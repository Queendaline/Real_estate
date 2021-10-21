<?php
namespace Zikzay\Controller;


use Zikzay\Core\Controller;
use Zikzay\Lib\Util;
use Zikzay\Model\Home;
use Zikzay\Model\Property;
use Zikzay\Model\PropertyDetails;
use Zikzay\Model\Amenities;
use Zikzay\Model\Location;
use Zikzay\Model\PropertyMedia;


class HomeController extends Controller
{

    public function __construct()
    {
    }

    public function index () 
    {
        $lands = Property::where("type = 'land'")::all();
        foreach($lands as $key => $property){
            $locObj = Location::where("property = '{$property->id}'")::first();
            $lands[$key]->location = "$locObj->address, $locObj->city, $locObj->state";
            $lands[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
            $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
            if($mediaObj == false){
                $lands[$key]->image = 'default-property-image.jpg';
            } else {
                $lands[$key]->image = $mediaObj->media;
            }
        }
        $rents = Property::where("type <> 'land' AND status = 'rent'")::all();
        
        foreach($rents as $key => $property){
            $locObj = Location::where("property = '{$property->id}'")::first();
            $location = "$locObj->address, $locObj->city, $locObj->state";
            $rents[$key]->location = $location;
            $rents[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
            $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
            if($mediaObj == false){
                $rents[$key]->image = 'default-property-image.jpg';
            } else {
                $rents[$key]->image = $mediaObj->media;
            }
        }
        $sales = Property::where("type <> 'land' AND status = 'sale'")::all();
        
        foreach($sales as $key => $property){
            $locObj = Location::where("property = '{$property->id}'")::first();
            $location = "$locObj->address, $locObj->city, $locObj->state";
            $sales[$key]->location = $location;
            $sales[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
            $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
            if($mediaObj == false){
                $sales[$key]->image = 'default-property-image.jpg';
            } else {
                $sales[$key]->image = $mediaObj->media;
            }
        }
        
        $data = [
            'lands' => $lands,
            'rents' => $rents,
            'sales' => $sales
        ];
        
      
        $this->render("guest.index", $data);
     }

    public function create () 
    {
        $this->render("home.create");
    }


    public function single () 
    {
        $this->render("guest.single-property");
    }

    public function viewSingle ($id) 
    {
        
        $property = Property::find($id);
        // dnd($property);
        $locObj = Location::where("property = '{$property->id}'")::first();
        $location = "$locObj->address, $locObj->city, $locObj->state";
        $property->location = $location;
        $property->details = PropertyDetails::where("property = '{$property->id}'")::all();
        $property->amenities = Amenities::where("property = '{$property->id}'")::all();
        $media = PropertyMedia::where("property = '{$property->id}'")::all();
        
        foreach($media as $m) {
            if($m->type == 'image') {
                $property->images[] = $m->media;
            } else{
                $property->{$m->type} = $m->media;
            }
        }
       
        $this->render("guest.view-single", ['property' => $property]);
    }
    
    
    public function viewAll ($which) 
    {
        if($which == 'land') {
            $properties = Property::where("type = 'land'")::all();
            foreach($properties as $key => $property){
                $locObj = Location::where("property = '{$property->id}'")::first();
                $properties[$key]->location = "$locObj->address, $locObj->city, $locObj->state";
                $properties[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
                $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
                if($mediaObj == false){
                    $properties[$key]->image = 'default-property-image.jpg';
                } else {
                    $properties[$key]->image = $mediaObj->media;
                }
            }
        }else {
            $properties = Property::where("type <> 'land' AND status = '{$which}'")::all();
        

        foreach($properties as $key => $property){
            $locObj = Location::where("property = '{$property->id}'")::first();
            $location = "$locObj->address, $locObj->city, $locObj->state";
            $properties[$key]->location = $location;
            $properties[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
            $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
            if($mediaObj == false){
                $properties[$key]->image = 'default-property-image.jpg';
            } else {
                $properties[$key]->image = $mediaObj->media;
            }
        }
        }
       
        $this->render("guest.view-all", ['properties' => $properties]);
    }

    public function submitAll () 
    {
        $this->render("home.submitAll");
    }

    public function about()
    {

        $this->render("guest.about-us");
    }
    
    public function contact()
    {

        $this->render("guest.contact-us");
    }
    

    public function details($id) 
    {
        $home = Home::find($id);
        $this->render("home.details", ["home"=>$home]);
    }
    
    public function store() 
    {
        $home = new Home();
        $this->request($home);
        $home->save();
        Util::redirect("home/create");
    }
    
   
    public function delete($id)
    {
        $home = (object) Home::find($id);
        $home->delete();
        Util::redirect("home");
    }

    public function active($params)
    {
        if(count($params) == 2) {
            $home = (object) Home::find($params[0]);
            $home->active = $params[1];
            $home->save();
        }
        Util::redirect("home");
    }

}

/*
$lands = Property::where("type = 'land'")::all();
        foreach($lands as $key => $property){
            $locObj = Location::where("property = '{$property->id}'")::first();
            $location = "$locObj->address, $locObj->city, $locObj->state";
            $lands[$key]->location = $location;
            $lands[$key]->details = PropertyDetails::where("property = '{$property->id}'")::all();
            $mediaObj = PropertyMedia::where("property = '{$property->id}' AND type = 'image'")::first();
            if($mediaObj == false){
                $lands[$key]->image = 'default-property-image.jpg';
            } else {
                $lands[$key]->image = $mediaObj->media;
            }
            $lands[$key]->plan = PropertyMedia::where("property = '{$property->id}' AND type = 'plan'")::first();
            $lands[$key]->video = PropertyMedia::where("property = '{$property->id}' AND type = 'video'")::first();
        }

*/