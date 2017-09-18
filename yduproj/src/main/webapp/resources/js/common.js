
/*$('#inner-panel').on('click','a', function(e){ 
	if ($(this).hasClass('ajax-link')) {
		e.preventDefault();
		if ($(this).hasClass('add-full')) {
			$('#content').addClass('full-content');
		}
		else {
			$('#content').removeClass('full-content');
		}
		var url = $(this).attr('href');
		window.location.hash = url;
		LoadAjaxContent(url);
	}
});*/



$('.ajax-link').on('click', function(e){ 
		e.preventDefault();
		var url = $(this).attr('href');
		window.location.hash = url;
		LoadAjaxContent(url);
});
