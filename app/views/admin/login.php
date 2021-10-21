

        <section class="headings">
            <div class="text-heading text-center">
                <div class="container mt-5">
                    <h2>Login</h2>
                </div>
            </div>
        </section>
        <!-- END SECTION HEADINGS -->

        <!-- START SECTION LOGIN -->
        <div id="login">
            <div class="login">
              <?=Zikzay\Core\Session::has('error') ? '<div class="alert alert-danger">'.Zikzay\Core\Session::get('error').'</div>' : ''?>
              <form  action="<?=SR.'/admin/submitLogin'?>" class="sign-form widget-form " method="post">
                    <div class="form-group">
                        <label>Phone*</label>
                        <input type="phone" class="form-control" name="phone" id="phone">
                    </div>
                    <div class="form-group">
                        <label>Password*</label>
                        <input type="password" class="form-control" name="password" id="password" value="">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div class="fl-wrap filter-tags clearfix add_bottom_30">
                        <div class="checkboxes float-left">
                            <div class="filter-tags-wrap">
                                <input id="check-b" type="checkbox" name="check">
                                <label for="check-b">Remember me</label>
                            </div>
                        </div>
                        <div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
                    </div>
                    <button class="btn_1 rounded full-width">Login</button>
                    <div class="text-center add_top_10">New to Find Houses? <strong><a href="<?=SR."/login/register"?>">Sign up!</a></strong></div>
                </form>
            </div>
        </div>
        <!-- END SECTION LOGIN -->

      
       
