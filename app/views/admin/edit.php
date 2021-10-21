<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2"> 
    <?=Zikzay\Core\Session::has('success') ? '<div class="alert alert-success">'.Zikzay\Core\Session::get('success').'</div>' : ''?>
	<form action="<?=SR."/admin/update-property/{$property->id}"?>" method="post" enctype="multipart/form-data">
		<div class="single-add-property">
			<h3>Property description and price</h3>
			<div class="property-form-group">
					<div class="row">
						<div class="col-md-12">
							<p>
								<label for="title">Property Title</label>
								<input type="text" name="title" id="title" value="<?=$property->title?>">
								<small id="title-e"></small>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-xs-6"> 
							<div class="dropdown faq-drop">
								<label for="dropdownmissdcall">Type</label>
								<select name="type" class="pro-status dropdown-toggle" type="button" id="dropdownmissdcall" data-toggle="dropdown" aria-haspopup="true">
									<option value="<?=$property->type?>" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
									<?=$property->type?></option>
									<option value="Duplex">Duplex</option>
									<option value="Self Con">Self Con</option>>
									<option value="Bungalow">Bungalow</option>>
									<option value="Flat">Flat</option>>
									<option value="Hotel">Hotel</option>
									<option value="land">Land</option>
									<option value="other">Others</option>
								</select>
							</div>
						</div><div class="col-sm-6 col-xs-12">
							<p class="no-mb">
								<label for="price">Specify Type</label>
								<input type="text" name="specify_type" value="<?=$property->type?>">
							</p>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="dropdown faq-drop">
								<label for="dropdownmissdcall">Status</label>
								<select name="status" class="pro-status dropdown-toggle" type="button" id="dropdownmissdcall" data-toggle="dropdown" aria-haspopup="true">
									Select status
									<option value="<?=$property->status?>" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
									<?=$property->status?></option>
									<option value="rent">Rent</option>
									<option value="sale">Sale</option>
								</select>
							</div>
						</div> 
					    
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<p class="no-mb">
								<label for="price">Price</label>
								<input type="text" name="price" placeholder="NGN" id="price" value="<?=$property->price?>">
							</p>
						</div>
						<div class="col-lg-6 col-md-12">
							<p class="no-mb last">
								<label for="area">Area</label>
								<input type="text" name="area" placeholder="Sqft" id="area" value="<?=$property->area?>">
							</p>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-md-12">
							<p>
								<label for="description">Property Description</label>
								<textarea id="description" name="description" placeholder="Describe about your property"><?=$property->description?></textarea>
							</p>
						</div>
					</div>
			</div>
		</div>
		<div class="single-add-property">
			<h3>property Location</h3>
			<div class="property-form-group">
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="address">Address</label>
							<input type="text" name="address" value="<?=$property->location->address?>">
						</p>
					</div>
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="city">City</label>
							<input type="text" name="city" value="<?=$property->location->city?>" id="">
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="state">State</label>
							<input type="text" name="state" value="<?=$property->location->state?>" id="state">
						</p>
					</div>
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="country">Country</label>
							<input type="text" name="country" value="<?=$property->location->country?>" id="country">
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="single-add-property">
			<h3>property Details</h3>
			<div class="property-form-group">
					<?php foreach($property->details as $key => $detail) : ?>
					<div id="property-detail<?=$i?>" class=" mb-3 ">
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="dropdown faq-drop no-mb">
								<label for="age"> Label <span>(optional)</span></label>
									<select name="label[]" class="pro-status dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true">
										Select Label
										<option value="<?=$detail->label?>" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
										<?=ucwords($detail->label)?></option>
										<option value="property type">Property Type</option>
										<option value="property status">Property status</option>
										<option value="bedrooms">Bedrooms</option>
										<option value="compound space">Compound Space</option>
										<option value="sitting room">Sitting Room</option>
										<option value="bathroom">Bathroom</option>
										<option value="kitchen">kitchen</option>
										<option value="balconies">Balconies</option>
										<option value="guest room">Guest Room</option>
										<option value="garages">Garages</option>
										<option value="store">Store</option>
										<option value="basement">Basement</option>
										<option value="year built">Year Built</option>
									</select>
							</div>
						</div> 
						<div class="col-lg-6 col-md-12">
							<p>
								<label for="city">Details</label>
								<input type="text" name="detail[]" value="<?=$detail->detail?>">
							</p>
						</div>
					</div>
				</div>
				<?php endforeach; ?>
			</div>
			<div class="property-form-group">
				<?php for($i = 1; $i < 50; $i++) : ?>
					<div id="property-detail<?=$i?>" class="row mb-3 property-more-detail">
					<div class="row">
						<div clajss="col-lg-6 col-md-12">
							<div class="dropdown faq-drop no-mb">
								<label for="age"> Label <span>(optional)</span></label>
									<select name="label[]" class="pro-status dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true">
										Select Label
										<option value="" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
										--Select Label--</option>
										<option value="property type">Property Type</option>
										<option value="property status">Property status</option>
										<option value="bedrooms">Bedrooms</option>
										<option value="compound space">Compound Space</option>
										<option value="sitting room">Sitting Room</option>
										<option value="bathroom">Bathroom</option>
										<option value="kitchen">kitchen</option>
										<option value="balconies">Balconies</option>
										<option value="guest room">Guest Room</option>
										<option value="garages">Garages</option>
										<option value="store">Store</option>
										<option value="basement">Basement</option>
										<option value="year built">Year Built</option>
									</select>
							</div>
						</div> 
						<div class="col-lg-6 col-md-12">
							<p>
								<label for="city">Details</label>
								<input type="text" name="detail[]">
							</p>
						</div>
					</div>
				</div>
				<?php endfor; ?>
				<div class="row">
					<div class="add-property-button pt-2">
						<div class="row">
							<div class="col-md-12">
								<div class="prperty-submit-button">
									<button id="more-detail" type="button" onclick="return showMore();">Add More</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="single-add-property">
			<h3>Property Features</h3>
			<div class="property-form-group">
				<div class="row">
					<div class="col-md-12">
						<ul class="pro-feature-add pl-0">
                            <?php foreach(AMENITIES as $key => $amenity) : ?>
                                <li class="fl-wrap filter-tags clearfix">
                                    <div class="checkboxes float-left">
                                        <div class="filter-tags-wrap">
										<?php $checked = ''; if(in_array($amenity, $property->amenities)) $checked = 'checked'; ?>
                                            <input id="check-<?=$key?>" type="checkbox" name="amenity[]" value="<?=$amenity?>" <?=$checked?>> 
                                            <label for="check-<?=$key?>"><?=$amenity?></label>
                                        </div>
                                    </div>
                                </li>
                            <?php endforeach; ?>
						</ul>
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
</div>


