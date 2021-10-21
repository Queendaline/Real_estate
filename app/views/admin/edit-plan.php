<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2">
    <form action="<?=SR."/admin/update-media/{$plan->property}"?>" method="post" enctype="multipart/form-data">
        
        <div class="single-add-property">
            <h3>Property Plan</h3>
            <div class="property-form-group">
                <div class="row">
                 <div class="col-sm-4 col-6 pb-3">
                    <img src="<?=IMG_PATH?>properties/<?=$plan->media?>" class="img-fluid" alt="slider-listing">
                 </div>
                    <div class="col-md-12">
                        <label for="plan">Upload Property Plan</label>
                        <input type="file" name="media"  id="plan-a">
                        <input type="hidden" name="type" value="plan" id="plan-a">
                    </div>
                </div>
            </div>
        </div>

		<!-- SUBMIT BUTTON STARTS HERE  -->
		<div class="add-property-button pt-5">
			<div class="row">
				<div class="col-md-12">
					<div class="prperty-submit-button">
						<button type="submit">Submit Property</button>
					</div>
				</div>
			</div>
		</div>
    </form> 
    <!-- SUBMIT BUTTON STOPS HERE   -->
</div>