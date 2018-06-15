$(document).on('turbolinks:load', function() {
    $('#diary-statement').on("input" , function () {
	$('.preview-diary').html(marked($('#diary-statement').val()));  
    });
});
