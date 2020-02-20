var numberofblogs;

$(function ()
{	
    $('.bcblog').click(function () {
        window.location = $(this).children("div.blogitemimage").attr('itemid');
    });

    $('.bcpress-releases').click(function () {
        //  $(this).children("div.blogitemtext").children("div.longdescription").fadeIn();
        window.location = $(this).children("div.blogitemimage").attr('itemid');
    });

    $('.bcpress-coverage').click(function () {
        //$(this).children("div.blogitemtext").children("div.longdescription").fadeIn();
        window.location = $(this).children("div.blogitemimage").attr('itemid');
    });

    $("#blogcategory li:first-child a").attr('href', '#');
    $("#blogcategory li:last-child a").attr('href', '#');

});
