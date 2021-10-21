
    <section class="section pt-55 mb-50">
        <div class="container">
            <div class="sign widget ">
                <div class="section-title">
                    <h5>Delete</h5>
                </div>
                <!-- <?=Zikzay\Core\Session::has('success') ? '<div class="alert alert-success">'.Zikzay\Core\Session::get('success').'</div>' : ''?> -->
                <form  action="<?=SR."/post/delete/{$post->id}"?>" class="sign-form widget-form " method="post" enctype="multipart/form-data">
                    <div class="delete">
                        <?=$post->admin?>
                    </div>
                    <div class=" delete">
                        <img src="<?=IMG_PATH?>post/<?=$post->image?>">
                      
                    </div>
                    <div class="delete">
                        <?=$post->title?>
                    </div>
                    <div class="delete"> <?=$post->details?>
                    </div>
                   
                    <div class="form-group">
                        <button type="submit" class="btn-custom">Delete</button>
                    </div>
                </form>
            </div> 
        </div>
    </section> 




    
         <!-- START SECTION FEATURED PROPERTIES -->
         <section class="featured portfolio mb-5">
            <div class="container">
                <div class="row">
                    <div class="section-title col-md-5">
                        <h2>Delete</h2>
                    </div>
                </div>
                 <!-- <?=Zikzay\Core\Session::has('success') ? '<div class="alert alert-success">'.Zikzay\Core\Session::get('success').'</div>' : ''?> -->
                 <form  action="<?=SR."/admin/delete/{$property->id}"?>" class="sign-form widget-form " method="post" enctype="multipart/form-data">
                <div class="row portfolio-items">
				
                    <div class="item col-lg-4 col-md-6 col-xs-12 landscapes sale">
                        <div class="project-single" data-aos="zoom-in">
                            <div class="project-inner project-head">
                                <div class="project-bottom">
                                    <h4><a href="">View Property</a><span class="category">Real Estate</span></h4>
                                </div>
                                <div class="homes">
                                    <!-- homes img -->
                                    <a href="single-property-1.html" class="homes-img">
                                        <div class="homes-tag button alt sale">For Sale</div>
                                        <div class="homes-price">Family Home</div>
                                        <img src="<?=IMG_PATH?>properties/<?=$property->image?>" alt="home-1" class="img-responsive">
                                    </a>
                                </div>
                                <div class="button-effect">
                                    <a href="single-property-1.html" class="btn"><i class="fa fa-link"></i></a>
                                    <a href="<?=IMG_PATH?>properties/<?=$property->image?>" class="btn popup-video popup-youtube"><i class="fas fa-video"></i></a>
                                    <a href="single-property-2.html" class="img-poppu btn"><i class="fa fa-photo"></i></a>
                                </div>
                            </div>
                            <!-- homes content -->
                            <div class="homes-content">
                                <!-- homes address -->
                                <h3><a href="<?=SR."/home/single"?>"><?=$property->title?></a></h3>
                                <p class="homes-address mb-3">
                                    <a href="single-property-1.html">
                                        <i class="fa fa-map-marker"></i><span><?=$property->location?></span>
                                    </a>
                                </p>
                                <!-- homes List -->
                                <ul class="homes-list clearfix">
                                    <li>
                                        <i class="fa fa-bed" aria-hidden="true"></i>
                                        <span></span>
                                    </li>
                                    <li>
                                        <i class="fa fa-bath" aria-hidden="true"></i>
                                        <span></span>
                                    </li>
                                    <li>
                                        <i class="fa fa-object-group" aria-hidden="true"></i>
                                        <span><?=$property->area?></span>
                                    </li>
                                    <li>
                                        <i class="fas fa-warehouse" aria-hidden="true"></i>
                                        <span></span>
                                    </li>
                                </ul>
                                <!-- Price -->
                                <div class="price-properties">
                                    <h3 class="title mt-3">
                                <a href="single-property-1.html"><?=$property->price?></a>
                                </h3>
                                    <div class="compare">
                                        <a href="#" title="Compare">
                                            <i class="fas fa-exchange-alt"></i>
                                        </a>
                                        <a href="#" title="Share">
                                            <i class="fas fa-share-alt"></i>
                                        </a>
                                        <a href="#" title="Favorites">
                                            <i class="fa fa-heart-o"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="footer">
                                    <a href="agent-details.html">
                                        <i class="fa fa-user"></i><?=$property->admin?>
                                    </a>
                                    <span>
                                <i class="fa fa-calendar"></i> 
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>            
        </div>     

   
  