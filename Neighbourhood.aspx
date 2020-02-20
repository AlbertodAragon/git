<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Neighbourhood.aspx.cs" Inherits="SurgeSolutions.FrontEnd.Neighbourhood" Title="Neighbourhood - Lyons Place"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/ListBoxUC.ascx" tagname="ListBox" tagprefix="uc1" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css"/>    	
     
    <link rel="stylesheet" href="/css/neighbourhood.css"/>   
    <script src="/scr/jquery.cycle2.js"></script>
      <script src="/scr/neigh.js"></script>
        <script src="/scr/jquery.cycle2_carousel.js"></script>
    <script src="/scr/jquery.cycle2_swipe.js"></script>
    <script src="//code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

    <script>


        (function ($) {

            $.fn.visible = function (partial) {

                var $t = $(this),
                    $w = $(window),
                    viewTop = $w.scrollTop(),
                    viewBottom = viewTop + $w.height(),
                    _top = $t.offset().top,
                    _bottom = _top + $t.height(),
                    compareTop = partial === true ? _bottom : _top,
                    compareBottom = partial === true ? _top : _bottom;

                return ((compareBottom <= viewBottom) && (compareTop >= viewTop));

            };


        })(jQuery);
        $(window).scroll(function (event) {
            
            if ($(window).width() > 730) {
                $("#neighdescription").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });
        $(window).scroll(function (event) {
            
            if ($(window).width() > 730) {
                $("#neighdescription img").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {
            
            if ($(window).width() > 730) {
                $(".quotetext").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {
            
            if ($(window).width() > 730) {
                $(".test2").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {
            
            if ($(window).width() > 730) {
                $("#teamlist .row").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        var win = $(window);
        var allMods = $(".row");

        // Already visible modules
        allMods.each(function (i, el) {
            var el = $(el);
            if (el.visible(true)) {
                el.addClass("already-visible");
            }
        });

        win.scroll(function (event) {
            
            if ($(window).width() > 730) {
                allMods.each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });
    </script> 
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
    
    <!--<uc1:Slideshow ID="Slideshow1" runat="server" ParentID="1122"/>-->

    <video id="neighvideo" autoplay muted playsinline>        
        <source src="/gfx/LP-neighvideo.mp4" type="video/mp4">
    </video>

    <div class="col" id="neighdescription">
        <div class="row">
            <h1>Neighbourhood</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>
<h2 class="transition-slideup centre is-visible test2">Local Life</h2>
           <p>This area of North West London was once made up of a cluster of villages, each with their own character and atmosphere. 
               Over time, these distinct neighbourhoods have grown and merged together while retaining their own discrete sense of place, personality and history.
               <br/><br/>
               Lyons Place and the surrounding villages of St John’s Wood, Maida Vale and Little Venice are all connected by the beauty and tranquillity of the Regent’s Canal.</p>
        </div>
    </div>

    <div class="col">
        <div class="row" id="interactivemap">
            <div id="interactivemapmap">
                <img id="mapeduca" class="selected" src="/img/db/maps/educationmap.jpg" />
                <img id="mapcultu" src="/img/db/maps/culturemap.jpg" />
                <img id="maprecre" src="/img/db/maps/recreationmap.jpg" />
                <img id="mapdeli" src="/img/db/maps/delimap.jpg" />
                <img id="mapshops" src="/img/db/maps/shopmap.jpg" />
                <img id="mapresta" src="/img/db/maps/restaurantmap.jpg" />
                <img id="maphotel" src="/img/db/maps/hotelmap.jpg" />
            </div>
            <div id="mapmenu">
                <ul>
                    <li id="menuitemeduca" class="activemap"><a href="javascript:MapInteract('educa')"><span>Education</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemcultu"><a href="javascript:MapInteract('cultu')"><span>Culture & Landmarks</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemrecre"><a href="javascript:MapInteract('recre')"><span>Recreation & Parks</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemdeli"><a href="javascript:MapInteract('deli')"><span>Deli & Food Shops</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemshops"><a href="javascript:MapInteract('shops')"><span>Shops</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemresta"><a href="javascript:MapInteract('resta')"><span>Restaurants</span><i class="far fa-square"></i></a></li>
                    <li id="menuitemhotel"><a href="javascript:MapInteract('hotel')"><span>Hotels</span></a></li>
                </ul>
            </div>
            <div id="maplistitems">
                <ol id="maplisteduca" type="1" class="selected">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/educationicon.jpg" /></li>
                    <li value="1">Saint George's Catholic School, Maida Vale</li>
                    <li>The American School in London</li>
                    <li>St John's Wood Pre-Preparatory School</li>
                    <li>London Business School</li>
                    <li>Regent's University London</li>
                    <li>King Solomon Academy</li>
                    <li>Westmister Academy</li> 
                    <li>Ark Atwood Primary Academy</li>
                    <li>St Savior's C of E Primary School</li>
                    <li>Paddington Academy</li>
                </ol>
                <ol type="1" id="maplistcultu">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/cultureicon.jpg" /></li>
                    <li value="1">New London Synagogue</li>
                    <li>Abbey Road Studios</li>
                    <li>Lord's Cricket Ground </li>
                    <li>London Central Mosque</li>
                    <li>St Pauls Church</li>
                    <li>The Sherlock Holmes Museum</li>
                    <li>Madame Tussauds London</li>
                    <li>Royal Academy of Music Museum</li>
                </ol>
                <ol type="1" id="maplistrecre">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/recreationicon.jpg" /></li>
                    <li value="1">Paddington Recreation Ground</li>
                    <li>Violet Hill Gardens</li>
                    <li>St John's Wood Church Gardens</li>
                    <li>Primrose Hill</li>
                    <li>Winfield House Grounds</li>
                    <li>Regent's Park</li>
                    <li>Regent's Canal</li>
                    <li>Rembrandt Gardens</li>
                    <li>Little Venice</li>
                    <li>Westbourne Green Open Space</li>
                </ol>
                <ol type="1" id="maplistdeli">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/deliicon.jpg" /></li>
                    <li value="1">Bruno's Deli</li>
                    <li>Browns of St Johns Wood</li>
                    <li>Gelato Mio</li>
                    <li>Gail's Bakery</li>
                    <li>Panxer's Delicatessen</li>
                    <li>The Bread Shop Co</li>
                    <li>Kent & Sons</li>
                    <li>Harry Morgan</li>
                    <li>Di Coffee</li>
                    <li>Sheepdrove Organic Farm Family Butcher</li>
                    <li>The Winery</li>
                    <li>Baker & Spice</li>
                </ol>
                <ol type="1" id="maplistshops">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/shopicon.jpg" /></li>
                    <li value="1">Cecilia Colman Gallery</li>
                    <li>Square One</li>
                    <li>Paulie</li>
                    <li>Daniel Raphael Gallery</li>
                    <li>Alfies Antique Market</li>
                    <li>Lisson Gallery</li>
                    <li>Joel & Son Fabrics</li>
                    <li>Farrells</li>
                    <li>Follett's</li>
                    <li>Clifton Nurseries</li>
                </ol>
                <ol type="1" id="maplistresta">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/restauranticon.jpg" /></li>
                    <li value="1">The Duke of York</li>
                    <li>The Ivy Cafe</li>
                    <li>Fego Caffe</li>
                    <li>Lord's Tavern</li>
                    <li>Original Lahore Restaurant</li>
                    <li>Crocker's Folly</li>
                    <li>Cafe Laville</li>
                    <li>Maguro</li>
                    <li>The Warwick Castle</li>
                    <li>The Bridge House</li>
                    <li>The Summerhouse</li>
                    <li>The Waterway</li>
                    <li>The Prince Alfred</li>
                </ol>
                <ol type="1" id="maplisthotel">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/hotelicon.jpg" /></li>
                    <li value="1">London Marriott Hotel Maide Vale</li>
                    <li>Danubius Hotel Regents Park</li>
                    <li>Park Avenue Baker Street</li>
                    <li>Dorset Square Hotel</li>
                    <li>The Landmark Hotel</li>
                    <li>The Colunnade Hotel London</li>
                    <li>The Warrington Hotel</li>
                </ol>
            </div>
        </div>
    </div>

    
   <div class="col">
        <div class="row imgholding imgholding2">
           <img src="/gfx/LP-1-02.jpg" class="desktopmap"/>
           <img src="/gfx/crossrailmob.png" class="mobilepmap"/>
        </div>
    </div>
    
    <div class="col">
        <div class="row imgholding imgholding3">
           <img src="/gfx/LP-1-01.jpg" />
        </div>
    </div>
    
      <div class="col">
        <div class="row imgholding imgholding4">
            <img src="/gfx/walking map.jpg" class="desktopmap" />
            <img src="/gfx/walkingmob.png" class="mobilepmap" />
        </div>
    </div>

    <div class="col">
        <div class="row" id="teamlist">

            <uc1:ListBox ID="ListBox1" runat="server" TableName="neighbourhood"/> 
        </div>
    </div>

</asp:Content>