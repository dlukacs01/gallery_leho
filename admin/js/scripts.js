/* everything in here will load after the document has loaded */
$(document).ready(function(){

	var folder_href;
	var folder_href_splitted;
	var folder_id;

	var image_src;
	var image_href_splitted;
	var image_name;

	var photo_id;

	$(".modal_thumbnails").click(function(){

		//Apply Selection-button kivalasztása ID alapjan, es enabled lesz (disabled=false) (ez jQuery)
		$("#set_cover_image").prop('disabled', false);

		folder_href = $("#folder-id").prop('href');

		folder_href_splitted = folder_href.split("=");

		folder_id = folder_href_splitted[folder_href_splitted.length - 1];

		// alert(folder_id);

		image_src = $(this).prop("src");

		image_href_splitted = image_src.split("/");

		// image filename
		image_name = image_href_splitted[image_href_splitted.length - 1];

		// alert(image_name);
		

		// ***** SIDEBAR ****** //

		photo_id = $(this).attr("data");

		$.ajax({

			url: "includes/ajax_code.php",
			data: {photo_id: photo_id, sidebar_flag: 1},
			type: "POST",
			success: function(data) {

				// checking if we have any type of error
				if(!data.error) {

					$("#modal_sidebar").html(data);

				}

			}

		});

	});

	$("#set_cover_image").click(function(){

		// alert(image_name);

		$.ajax({

			url: "includes/ajax_code.php",
			data: {photo_id: photo_id, folder_id: folder_id},
			type: "POST",
			success: function(data) {

				// checking if we have any type of error
				if(!data.error) {

					// alert(data);

					// location.reload(true); // page refresh to see new pic instantly

					// updating user image src with new path (so we dont nee to refresh the page)
					$(".user_image_box a img").prop('src', data);

				}

			}

		});

	});

	/*******************Edit Photo Sidebar *************/

	$(".info-box-header").click(function(){

		//alert("hello");

		$(".inside").slideToggle("fast");

		$("#toggle").toggleClass("glyphicon-menu-down glyphicon , glyphicon-menu-up glyphicon "); // changing CSS class

	});


	/*********************** Delete Function ********************/

	$(".delete_link").click(function(){

		return confirm('Biztosan törölni akarsz?'); // confirm photo delete

	});

	tinymce.init({
		selector:'textarea',
	  	plugins: 'link'
	});

});