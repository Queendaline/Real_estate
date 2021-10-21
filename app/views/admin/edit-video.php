<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2">
    <form action="<?=SR."/admin/update-media/{$video->property}"?>" method="post" enctype="multipart/form-data">
        
        <div class="single-add-property">
            <h3>Property Video</h3>
            <div class="property-form-group">
                <div class="row">
                    <div class="col-sm-4 col-md-8 col-lg-10">
                    <img src="<?=IMG_PATH?>properties/<?=$video->media?>" class="img-fluid" alt="slider-listing">
                        <label for="video">Upload Property Video</label>
                        <input type="file" name="media" id="video-a">
                          <input type="hidden" name="type" value="video" id="video-a">
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
		<!-- SUBMIT BUTTON STOPS HERE   -->
        
    </form>


</div>