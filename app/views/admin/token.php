<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2"> 
    <div class="single-add-property">
        <h3>Generate Token</h3>
        <?=Zikzay\Core\Session::has('success') ? '<div class="alert alert-success">'.Zikzay\Core\Session::get('success').'</div>' : ''?>
        <form action="<?=SR."/admin/submit-token"?>" method="post">
        <div class="property-form-group">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <p class="no-mb last">
                        <label for="con-phn">Phone</label>
                        <input type="text" placeholder="Enter Your Phone Number" id="phone-e" name="phone">
                    </p>
                </div>
            </div>
        </div>
        <div class="add-property-button pt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="prperty-submit-button">
                    <button type="submit">Generate</button>
                </div>
            </div>
        </div>
        </form>
    </div>
    </div>                    
</div>