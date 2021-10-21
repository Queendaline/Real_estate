<div class="col-lg-9 col-md-12 col-xs-12 royal-add-property-area section_100 pl-0 user-dash2">
	<form action="<?=SR."/admin/store-property"?>" method="post">
		<div class="single-add-property">
			<h3>Property description and price</h3>
			<div class="property-form-group">
					<div class="row">
						<div class="col-md-12">
							<p>
								<label for="title">Property Title</label>
								<input type="text" name="title" id="title" placeholder="Enter your property title">
								<small id="title-e"></small>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-xs-6">
							<div class="dropdown faq-drop">
								<label for="dropdownmissdcall">Type</label>
								<select name="type" class="pro-status dropdown-toggle" type="button" id="dropdownmissdcall" data-toggle="dropdown" aria-haspopup="true">
									Select type
									<option value="" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
									Select type</option>
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
								<input type="text" name="specify_type" placeholder="Enter type if others is selected">
							</p>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="dropdown faq-drop">
								<label for="dropdownmissdcall">Status</label>
								<select name="status" class="pro-status dropdown-toggle" type="button" id="dropdownmissdcall" data-toggle="dropdown" aria-haspopup="true">
									Select status
									<option value="" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
									Select status</option>
									<option value="rent">Rent</option>
									<option value="sale">Sale</option>>
								</select>
							</div>
						</div> 
					    
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<p class="no-mb">
								<label for="price">Price</label>
								<input type="text" name="price" placeholder="NGN" id="price">
							</p>
						</div>
						<div class="col-lg-6 col-md-12">
							<p class="no-mb last">
								<label for="area">Area</label>
								<input type="text" name="area" placeholder="Sqft" id="area">
							</p>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-md-12">
							<p>
								<label for="description">Property Description</label>
								<textarea id="description" name="description" placeholder="Describe about your property"></textarea>
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
							<input type="text" name="address" placeholder="Enter Your Address" id="address">
						</p>
					</div>
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="city">City</label>
							<input type="text" name="city" placeholder="Enter Your City" id="city">
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="state">State</label>
							<input type="text" name="state" placeholder="Enter Your State" id="state">
						</p>
					</div>
					<div class="col-lg-6 col-md-12">
						<p>
							<label for="country">Country</label>
							<input type="text" name="country" placeholder="Enter Your Country" id="country">
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="single-add-property">
			<h3>property Details</h3>
			<div class="property-form-group">
				<?php for($i = 0; $i < 50; $i++) : ?>
					<div id="property-detail<?=$i?>" class="row mb-3 property-more-detail">
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="dropdown faq-drop no-mb">
								<label for="age"> Label <span>(optional)</span></label>
									<select name="label[]" class="pro-status dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true">
										Select Label
										<option value="" class="dropdown-menu faq-drop-open" aria-labelledby="dropdownmissdcall">
										Select Label</option>
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
								<input type="text" name="detail[]" placeholder="Enter Detail">
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
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-a" type="checkbox" name="amenity[]" value="Air Conditioning">
										<label for="check-a">Air Conditioning</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-b" type="checkbox" name="amenity[]" value="Swimming Pool">
										<label for="check-b">Swimming Pool</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-e" type="checkbox" name="amenity[]" value="Gym">
										<label for="check-e">Gym</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-g" type="checkbox" name="amenity[]" value="Electricity">
										<label for="check-g">Electricity</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-h" type="checkbox" name="amenity[]" value="Curtains">
										<label for="check-h">Curtains</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-i" type="checkbox" name="amenity[]" value="Refrigerator">
										<label for="check-i">Refrigerator</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-l" type="checkbox" name="amenity[]" value="TV Cable">
										<label for="check-l">TV Cable</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-j" type="checkbox" name="amenity[]" value="Wifi">
										<label for="check-j">Wifi</label>
									</div>
								</div>
							</li>
							<li class="fl-wrap filter-tags clearfix">
								<div class="checkboxes float-left">
									<div class="filter-tags-wrap">
										<input id="check-k" type="checkbox" name="amenity[]" value="Water Supply">
										<label for="check-k">Water Supply</label>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
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
