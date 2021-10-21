<?php
namespace Zikzay\Controller;


use Zikzay\Core\Controller;
use Zikzay\Core\Session;
use Zikzay\Lib\Util;
use Zikzay\libs\Hash;
use Zikzay\Model\Admin;
use Zikzay\Model\Token;
use Zikzay\Model\Property;
use Zikzay\Model\PropertyDetails;
use Zikzay\Model\Amenities;
use Zikzay\Model\Location;
use Zikzay\Model\PropertyMedia;

class AdminController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index () 
    {

          $this->render("admin.login", null, false, false, false);
    }

    public function submitLogin() {
        $admin = new Admin();
        $this->request($admin,false);
        $dbAdmin = Admin::search('email', $admin->email);

        if($dbAdmin != false) {
            if(Hash::validate($admin->password, $dbAdmin->password)) {
             Session::set('admin', $dbAdmin->name);
             self::redirect("");
            }
        }
        Session::set('error','Invalid login combination');
        self::redirect('login');
    }

    public function register () 
    {
        $this->render("admin.register",  null, false, false, false);
    }

    public function submitRegister() {
        $admin = new Admin();
        $this->request($admin);

        $dbToken = Token::search('token', $admin->token);

        if($dbToken != false) {
            if($admin->phone == $dbToken->phone) {
                $admin->password = Hash::password($admin->password);
                $admin->save();
                self::redirect('post/create');
                exit();
            }
        }
        Session::set('error', "Token is invalid");
        self::redirect('admin/register');


        
    }


    public function createToken () 
    {
        $this->render("admin.token");
    }

    public function submitToken(){
        $token =  new Token();
        $this->request($token);
        $tokenCode = Util::randomString(8);
        $dbToken = Token::search('phone', $token->phone);
        
        if($dbToken != false){
            $dbToken->token = $tokenCode;
            $dbToken->save();
        }else{
            $newToken =  new Token();
            $newToken->phone = $token->phone;
            $newToken->token = $tokenCode;
            $newToken->admin = 1;
            $token->save();
        }
        Session::set('success', "Token for $token->phone is: $tokenCode");
        self::redirect('admin/create-token');
    }
    
    public function storeProperty() 
    {
    
        $property = new Property();
        $this->request($property, false, false);
        
        if($property->type = 'other') {
            $property->type = $this->posted('specify_type');
        }
        $property->propertyid = Util::randomInt(5);
        $propId = $property->save();

        $location = new Location();
        $this->request($location, false, false);
        $location->property = $propId;
        $location->save();


        $this->request($property, false);

        foreach($property->label as $key => $label) {
            if($label != '' and $property->detail != '') {
                $propertyDetial = new PropertyDetails();
                $propertyDetial->label = $property->label[$key]; 
                $propertyDetial->detail = $property->detail[$key]; 
                $propertyDetial->property = $propId; 
                $propertyDetial->save();
            }
        }
        foreach($property->amenity as $key => $value) {
            $amenity = new Amenities();
            $amenity->amenity = $property->amenity[$key]; 
            $amenity->property = $propId; 
            $amenity->save();
            
        }
        
        
        Session::set('property', $propId);
       
        Util::redirect("admin/upload-media/image");
    }


    
     public function uploadMedia ($media) 
    {
        $this->render("admin.upload-{$media}");
       
    }

    public function storeImages() {

        $propId = Session::get('property');

        $images = $this->imageUpload('properties');
        
        $propertyMedia = new PropertyMedia();
        $propertyMedia->property = $propId;
        $propertyMedia->type = 'image';
        if(is_array($images)){
            foreach($images as $image) {
                $propertyMedia->media = $image;
                $propertyMedia->save();
            }

        } else {
            $propertyMedia->media = $images;
            $propertyMedia->save();
        }
        
        self::redirect('admin/upload-media/video');
    }

    public function storeVideo() {

        $vedio = $this->imageUpload('properties');
        $propId = Session::get('property');
        $propertyMedia = new PropertyMedia();
        $propertyMedia->property = $propId;
        $propertyMedia->type = 'video';
        $propertyMedia->media = $video;
        $propertyMedia->save();
        
        self::redirect('admin/upload-media/plan');
    }

    public function storePlan() {
        $propId = Session::get('property');

        $plan = $this->imageUpload('properties');
        $propertyMedia = new PropertyMedia();
        $propertyMedia->property = $propId;
        $propertyMedia->type = 'plan';
        $propertyMedia->media = $plan;
        $propertyMedia->save();
        Session::unset('property');
        self::redirect('post/create');
    }

    public function edit($id) 
    {
        if($id == null){
            $this->render("guest.error-404");
            exit();
        }
        $property = Property::find($id);
        $locObj = Location::where("property = '{$property->id}'")::first();
        $property->location = $locObj;
        $property->details = PropertyDetails::where("property = '{$property->id}'")::all();
        $amenities = [];
        $objects = Amenities::where("property = '{$property->id}'")::all();
        foreach($objects as $amenity) {
            $amenities[] = $amenity->amenity;
        }
        $property->amenities = $amenities;
       
        $media = PropertyMedia::where("property = '{$property->id}'")::all();
        
        foreach($media as $m) { 
            if($m->type == 'image') {
                $property->images[] = $m->media;
           } else{
                $property->{$m->type} = $m->media;
            }
        }
        // dnd($property);

       
        $this->render("admin.edit", ['property' => $property]);
    }
    
    public function updateProperty($propId) 
    {       
        $property = Property::find($propId);

        $this->request($property, false, false);
        
        if($property->type = 'other') {
            $property->type = $this->posted('specify_type');
        }
        
        $property->save();

        $location = Location::search('property', $propId);
        $this->request($location, false, false);
        $location->save();

        $proDetail = new PropertyDetails();
        $proDetail->delete("property = '{$propId}'");

        $this->request($property, false);

        foreach($property->label as $key => $label) {
            if($label != '' and $property->detail != '') {
                $propertyDetial = new PropertyDetails();
                $propertyDetial->label = $property->label[$key]; 
                $propertyDetial->detail = $property->detail[$key]; 
                $propertyDetial->property = $propId; 
                $propertyDetial->save();
            }
        }

        
        $ami = new Amenities();
        $ami->delete("property = '{$propId}'");

        foreach($property->amenity as $key => $value) {
            $amenity = new Amenities();
            $amenity->amenity = $property->amenity[$key]; 
            $amenity->property = $propId; 
            $amenity->save();
            
        }
        
        
           
        Util::redirect("admin/edit-image/{$propId}");


    }

    public function updateMedia($propId) {
    
        $media = $this->imageUpload('properties');

        $type = $this->posted('type');
        $propertyMedia = new PropertyMedia();
     
        $propertyMedia->delete("property = '{$propId}' AND type = '{$type}'");

        $propertyMedia = new PropertyMedia();
        $propertyMedia->property = $propId;
        $propertyMedia->type = $type;

        if(is_array($media)) {
            foreach($media as $image) {
                $propertyMedia->media = $image;
                $propertyMedia->save();
            }

        } else if(is_string($media)) {
            $propertyMedia->media = $media;
            $propertyMedia->save();
        } 

        self::redirect("admin/edit-{$type}/{$propId}");
    }

    public function editImage ($id) 
    {
        $media = PropertyMedia::where("property = '{$id}' AND type = 'image'")::all();
        $images = [];
        foreach($media as $m) {
            $images[] = $m->media;
            
        }


        $this->render("admin.edit-image", ['images' => $media]);
        
        Util::redirect("admin/edit-plan/{$propId}");

    }
    public function editPlan($id)
    {
        $media = PropertyMedia::where("property = '{$id}' AND type = 'plan'")::first();
        
        //dnd($media);
        $this->render("admin.edit-plan", ['plan' => $media]);

        Util::redirect("admin/edit-plan/{$propId}");
    }
    public function editVideo($id)
    {
        $media = PropertyMedia::where("property = '{$id}' AND type = 'video'")::first();
        
        $this->render("admin.edit-video",['video' =>$media]);

        Util::redirect("admin/edit-video/{$propId}");
    }

    public function details($id) 
    {
        $admin = Admin::find($id);
        $this->render("admin.details", ["admin"=>$admin]);
    }
    

    public function delete($id)
    {
        $admin = (object) Admin::find($id);
        $admin->delete();
        Util::redirect("admin");
    }

    public function active($params)
    {
        if(count($params) == 2) {
            $admin = (object) Admin::find($params[0]);
            $admin->active = $params[1];
            $admin->save();
        }
        Util::redirect("admin");
    }

}