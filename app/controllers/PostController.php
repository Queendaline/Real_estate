<?php
namespace Zikzay\Controller;


use Zikzay\Core\Controller;
use Zikzay\Lib\Util;
use Zikzay\Model\Post;

class PostController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index () 
    {
        $this->render("index");
    }

    public function create () 
    {
        $this->render("admin.add-property");
    }
    
    public function details($id) 
    {
        $post = Post::find($id);
        $this->render("post.details", ["post"=>$post]);
    }
    
    public function store() 
    {
        $post = new Post();
        $this->request($post);
        $post->save();
        Util::redirect("post/create");
    }
    
    public function edit($id) 
    {
        $post = Post::find($id);
        $this->render("post.edit", ["post"=>$post]);
    }
    
    public function update($id) 
    {        
        $post = (object) Post::find($id);
        $this->request($post, false);
        $post->save();
        Util::redirect("post/edit/$id");
    }

    public function delete($id)
    {
        $post = (object) Post::find($id);
        $post->delete();
        Util::redirect("post");
    }

    public function active($params)
    {
        if(count($params) == 2) {
            $post = (object) Post::find($params[0]);
            $post->active = $params[1];
            $post->save();
        }
        Util::redirect("post");
    }

}