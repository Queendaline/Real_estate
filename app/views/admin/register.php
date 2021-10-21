

        <section class="headings">
            <div class="text-heading text-center">
                <div class="container mt-5">
                    <h2>Register</h2>
                </div>
            </div>
        </section>
        <!-- END SECTION HEADINGS -->

        <!-- START SECTION 404 -->
        <div id="login">
            <div class="login">
            <?=Zikzay\Core\Session::has('error') ? '<div class="alert alert-danger">'.Zikzay\Core\Session::get('error').'</div>' : ''?>
                <form  action="<?=SR.'/admin/submitRegister'?>" class="sign-form widget-form " method="post">
                    <div class="form-group">
                        <label>Your Name</label>
                        <input class="form-control" type="text" name="name" id="name-e">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group">
                        <label>Your Email</label>
                        <input class="form-control" type="email" name="email" id="email-e">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Your Phone</label>
                        <input class="form-control" type="phone" name="phone" id="phone-e">
                        <i class="icon_phone_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Your Token</label>
                        <input class="form-control" type="text" name="token" id="token-e">
                    </div>
                    <div class="form-group">
                        <label>Your password</label>
                        <input class="form-control" type="password" name="password" id="password1">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Confirm password</label>
                        <input class="form-control" type="password"name="password" id="password2">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div id="pass-info" class="clearfix"></div>
                    <button class="btn_1 rounded full-width add_top_30">Register Now!</button>
                    <div class="text-center add_top_10">Already have an acccount? <strong><a href="<?=SR."/admin/token"?>">Sign In</a></strong></div>
                </form>
            </div>
        </div>
        <!-- END SECTION 404 -->

