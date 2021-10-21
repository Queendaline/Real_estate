<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2">
    <form action="<?=SR."/admin/update-media/{$images[0]->property}"?>" method="post" enctype="multipart/form-data">

        
    <input type="hidden" name="type" value="image" id="plan-a">
        <div class="single-add-property">
            <h3>Property Images</h3>
            <div class="mb-30">
            <div class="row">
                <?php foreach($images as $image) : ?>
                <div class="col-sm-4 col-6 pb-3">
                    <img src="<?=IMG_PATH?>properties/<?=$image->media?>" class="img-fluid" alt="slider-listing">
                </div>
                <?php endforeach; ?>
            </div>
        </div>
            <div class="property-form-group">
                <div class="row">
                    <div class="col-md-12">
                        <label for="image">Upload image</label>
                        <input type="file" name="image[]"value="" id="image-a">
                    </div>
                    <div class="col-md-12">
                        <label for="image">Upload image</label>
                        <input type="file" name="image[]"value="" id="image-b">
                    </div>
                    <div class="col-md-12">
                        <label for="image">Upload image</label>
                        <input type="file" name="image[]"value="" id="image-c">
                    </div>
                    <div class="col-md-12">
                        <label for="image">Upload image</label>
                        <input type="file" name="image[]"value="" id="image-d">
                    </div>
                    <div class="col-md-12">
                        <label for="image">Upload image</label>
                        <input type="file" name="image[]" value="" id="image-e">
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