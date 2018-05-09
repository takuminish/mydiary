$(function () {
    $('#diary-statement').bind("input propertychange" , function () {
        $('.preview-diary').text("ajax");
    });
});
