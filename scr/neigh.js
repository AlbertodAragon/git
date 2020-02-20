var mapopened = "educa";

$(function () {


    var heightnav = $("#slideshow").height;
    $('#slideshowbox').attr('style', 'height:' + heightnav);

    $('#maplistitems').attr('style', 'height:' + $('#maplistitems').height() + 'px;');

    VideoWidth();

    $(window).on('resize', function () {
        VideoWidth();
    });
});

/*$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.imgholding1 img').fadeIn();
    } else {
        $('.imgholding1 img').fadeOut();
    }
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 1100) {
        $('.imgholding2 img').fadeIn();
    } else {
        $('.imgholding2 img').fadeOut();
    }
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 2200) {
        $('.imgholding3 img').fadeIn();
    } else {
        $('.imgholding3 img').fadeOut();
    }

});

$(window).scroll(function () {
    if ($(this).scrollTop() > 2600) {
        $('.imgholding4 img').fadeIn();
    } else {
        $('.imgholding4 img').fadeOut();
    }
});*/

function MapInteract(maptoopen)
{
    $('#map' + mapopened).attr('class', '');
    $('#maplist' + mapopened).attr('class', '');
    $('#menuitem' + mapopened).attr('class', '');

    $('#map' + maptoopen).attr('class', 'selected');    
    $('#map' + maptoopen).attr('style', 'opacity: 0;filter: alpha(opacity = 0);');

    $('#maplist' + maptoopen).attr('class', 'selected');
    $('#maplist' + maptoopen + ' li').each(function () {
        $(this).attr('style', 'display:none');
    });

    $('#menuitem' + maptoopen).attr('class', 'activemap');


    $('#map' + maptoopen).delay(400).animate({
        opacity: "1",
        filter: "alpha(opacity = 100)"
    }, 500);

    var counter = 1;
    $('#maplist' + maptoopen + ' li').each(function () {
        var timeextra = counter * 200;
        $(this).delay(timeextra).fadeIn();
        counter++;
    });

    mapopened = maptoopen;
}

function VideoWidth()
{
    var videow = $(window).width();
    var videoh = (videow * 1080) / 1920;

    $('#neighvideo').attr('width', videow).attr('height', videoh);
}