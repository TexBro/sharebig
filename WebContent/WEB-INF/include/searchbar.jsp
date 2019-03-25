
<div class="site-section site-section-sm pb-0">
	<div class="container">
		<div class="row">
			<form class="form-search col-md-12" style="padding: 10px;">
				<div class="row  align-items-end">

					<div class="col-md-3 menu-search">
						<label for="select-city">Select City</label>
						<div class="select-wrap">
							<input type="text" style="width: 100%;">

						</div>
					</div>
					<div class="row" style="padding-left: 15px;">
						<div class="col-md-3 menu-date">
							<label for="list-types">Listing Types</label>

							<div class="input-append date form_datetime1"
								data-date="2019-02-21T15:25:00Z">

								<input size="20" type="text" value="" readonly
									style="width: 80%;"> <span class="add-on"><i
									class="icon-remove"></i></span> <span class="add-on"><i
									class="icon-calendar"></i></span>
							</div>

							<script type="text/javascript">
								$(".form_datetime1").datetimepicker({
									format : "yyyy-mm-dd - hh:ii",
									autoclose : true,
									todayBtn : true,
									startDate : "2013-02-14 10:00",
									minuteStep : 30
								});
							</script>

						</div>
						<div class="col-md-3 menu-date">
							<label for="offer-types">Offer Type</label>

							<div class="input-append date form_datetime2"
								data-date="2019-02-21T15:25:00Z">

								<input size="20" type="text" value="" readonly
									style="width: 80%;"> <span class="add-on"><i
									class="icon-remove"></i></span> <span class="add-on"><i
									class="icon-calendar"></i></span>
							</div>

							<script type="text/javascript">
								$(".form_datetime2").datetimepicker({
									format : "yyyy-mm-dd - hh:ii",
									autoclose : true,
									todayBtn : true,
									startDate : "2013-02-14 10:00",
									minuteStep : 30
								});
							</script>

						</div>
					</div>
					<div class="col-md-3 menu-search-btn">
						<input type="submit"
							class="btn btn-success text-white btn-block rounded-0"
							value="Search">
					</div>
				</div>
			</form>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div
					class="view-options bg-white py-3 px-3 d-md-flex align-items-center">
					<div class="mr-auto">
						<a href="index.jsp" class="icon-view view-module active"><span
							class="icon-view_module"></span></a> <a href="index-list.jsp"
							class="icon-view view-list"><span class="icon-view_list"></span></a>

					</div>
					<div class="ml-auto d-flex align-items-center">
						<div>
							<a href="#" class="view-list px-3 border-right active">All</a> <a
								href="#" class="view-list px-3 border-right">Rent</a> <a
								href="#" class="view-list px-3">Sale</a>
						</div>


						<div class="select-wrap">
							<span class="icon icon-arrow_drop_down"></span> <select
								class="form-control form-control-sm d-block rounded-0">
								<option value="">Sort by</option>
								<option value="">Price Ascending</option>
								<option value="">Price Descending</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

