$(document).on('turbolinks:load', function() {
    $('#diary-statement').on("input" , function () {
	$('.preview-diary').html(marked($('#diary-statement').val()));  
    });

    $('#diary_search_date').on('keydown', function(e) {
        if (e.which == 13) {
	    $('#diary_search_date_button').trigger('click');
	}
    });
    
    $('#diary_search_date_button').on("click", function() {
	var search_text = $.trim($('#diary_search_date').val());
	$.ajax({ 
	    url: '/diaries/search', 
	    type: 'GET', 
	    data: ('search_date=' + search_text), 
	    processData: false, 
	    contentType: false, 
	    dataType: 'json' 
	}).done(function(data){
	    $('.diary-list').find('.row').fadeOut().promise().done(function() {
		$('.diary-list').append('<div class="row">');
		//$('<div class="row">').appendTo('.diary-list').hide().addClass('is-animated').fadeIn(1000);
	        $(data).each(function(i, diary) {
		    $('<div class="col-sm-3 card' + i + '">').appendTo('.diary-list > .row').hide().delay(i*100).addClass('is-animated').fadeIn(1000);
		$('.card' + i).append('<div class="card mb-3" style="width: 15rem;">');
		$('.card' + i).find('.card').append('<div class="card-block">');
	        $('.card' + i).find('.card').find('.card-block').append('<h5 class="card-title">' + diary.display_date + '</h5>');
		$('.card' + i).find('.card').find('.card-block').append('<a class="btn btn-primary" href="/diaries/' + diary.id + '"> Show Diary </a>');
	      });
	    });
	})
    });
});
