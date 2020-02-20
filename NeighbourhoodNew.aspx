<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="NeighbourhoodNew.aspx.cs" Inherits="SurgeSolutions.FrontEnd.NeighbourhoodNew" Title="Neighbourhood - Lyons Place"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/ListBoxUC.ascx" tagname="ListBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css"/>   
    <link rel="stylesheet" href="/css/neighbourhoodnew.css"/>   
   <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    
    <script src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>-->
    <script src="/scr/touchpunch.js"></script>
    <script src="/scr/neighnew.js"></script>     
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
                $("#interactivemapbox").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {

            if ($(window).width() > 730) {
                $("#neightboursection").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {

            if ($(window).width() > 730) {
                $("#mapsection").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {

            if ($(window).width() > 730) {
                $("#communitysection").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        $(window).scroll(function (event) {

            if ($(window).width() > 730) {
                $(".neighitem").each(function (i, el) {
                    var el = $(el);
                    if (el.visible(true)) {
                        el.addClass("come-in");
                    }
                });
            }
        });

        var win = $(window);
        var allMods = $(".movinsection");

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
    
    <video id="neighvideo" autoplay muted playsinline>        
        <source src="/gfx/LP-neighvideo.mp4" type="video/mp4">
    </video>

    <div class="col movinsection" id="neighdescription">
        <div class="row">
            <p>
                
                <!--This area of North West London was once made up of a cluster of villages, each with their own character and atmosphere. 
                Over time, these distinct neighbourhoods have grown and merged together while retaining their own discrete sense of place, personality and history.
                <br/><br/>
                Lyons Place and the surrounding villages of St John’s Wood, Maida Vale and Little Venice are all connected by the beauty and tranquillity of the Regent’s Canal.-->
                This boutique scheme by the world-renowned property developer Almacantar, located in one of London’s most idyllic areas is located moments away from London’s key shopping districts: 
                Maida Vale, St John’s Wood, Primrose Hill and Little Venice.
                <br/><br/>
                The beauty and tranquillity is a stones throw away from Regent’s Canal.
                <br/><br/>
                Sir Terry Farrell, a local resident felt very emotive towards this scheme and it’s central location, moments from prime central London.

            </p>
        </div>
    </div>

    <div class="col movinsection" id="interactivemapbox">
        <div class="row sectiontitleseparation">
            <h1 class="neightsectiontitleh1">What's nearby</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>
            <h2 class="transition-slideup centre is-visible test2">My Local area</h2>
        </div>

        <div class="row" id="interactivemap">
            <div id="interactivemapmap">
                <a href="javascript:CloseMapMobile()" id="closemapmob">X</a>
                <img id="mapeduca" class="selected" src="/img/db/maps/educationmap.jpg" />
                <img id="mapcultu" src="/img/db/maps/culturemap.jpg" />
                <img id="maprecre" src="/img/db/maps/recreationmap.jpg" />
                <img id="mapdeli" src="/img/db/maps/delimap.jpg" />
                <img id="mapshops" src="/img/db/maps/shopmap.jpg" />
                <img id="mapresta" src="/img/db/maps/restaurantmap.jpg" />
                <img id="maphotel" src="/img/db/maps/hotelmap.jpg" />
            </div>
            <div id="dothighlightmap"></div>
            <div id="maplistitems">
                <ol id="maplisteduca" type="1" class="selected">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/educationicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Edu1');">Saint George's Catholic School, Maida Vale</a></li>
                    <li><a href="javascript:MapClick('Edu2');">The American School in London</a></li>
                    <li><a href="javascript:MapClick('Edu3');">St John's Wood Pre-Preparatory School</a></li>
                    <li><a href="javascript:MapClick('Edu4');">London Business School</a></li>
                    <li><a href="javascript:MapClick('Edu5');">Regent's University London</a></li>
                    <li><a href="javascript:MapClick('Edu6');">King Solomon Academy</a></li>
                    <li><a href="javascript:MapClick('Edu7');">Westmister Academy</a></li> 
                    <li><a href="javascript:MapClick('Edu8');">Ark Atwood Primary Academy</a></li>
                    <li><a href="javascript:MapClick('Edu9');">St Saviour's C of E Primary School</a></li>
                    <li><a href="javascript:MapClick('Edu10');">Paddington Academy</a></li>
                </ol>
                <ol type="1" id="maplistcultu">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/cultureicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Cul1');">New London Synagogue</a></li>
                    <li><a href="javascript:MapClick('Cul2');">Abbey Road Studios</a></li>
                    <li><a href="javascript:MapClick('Cul3');">Lord's Cricket Ground </a></li>
                    <li><a href="javascript:MapClick('Cul4');">London Central Mosque</a></li>
                    <li><a href="javascript:MapClick('Cul5');">St Pauls Church</a></li>
                    <li><a href="javascript:MapClick('Cul6');">The Sherlock Holmes Museum</a></li>
                    <li><a href="javascript:MapClick('Cul7');">Madame Tussauds London</a></li>
                    <li><a href="javascript:MapClick('Cul8');">Royal Academy of Music Museum</a></li>
                </ol>
                <ol type="1" id="maplistrecre">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/recreationicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Rec1');">Paddington Recreation Ground</a></li>
                    <li><a href="javascript:MapClick('Rec2');">Violet Hill Gardens</a></li>
                    <li><a href="javascript:MapClick('Rec3');">St John's Wood Church Gardens</a></li>
                    <li><a href="javascript:MapClick('Rec4');">Primrose Hill</a></li>
                    <li><a href="javascript:MapClick('Rec5');">Winfield House Grounds</a></li>
                    <li><a href="javascript:MapClick('Rec6');">Regent's Park</a></li>
                    <li><a href="javascript:MapClick('Rec7');">Regent's Canal</a></li>
                    <li><a href="javascript:MapClick('Rec8');">Rembrandt Gardens</a></li>
                    <li><a href="javascript:MapClick('Rec9');">Little Venice</a></li>
                    <li><a href="javascript:MapClick('Rec10');">Westbourne Green Open Space</a></li>
                </ol>
                <ol type="1" id="maplistdeli">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/deliicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Del1');">Bruno's Deli</a></li>
                    <li><a href="javascript:MapClick('Del2');">Browns of St Johns Wood</a></li>
                    <li><a href="javascript:MapClick('Del3');">Gelato Mio</a></li>
                    <li><a href="javascript:MapClick('Del4');">Gail's Bakery</a></li>
                    <li><a href="javascript:MapClick('Del5');">Panxer's Delicatessen</a></li>
                    <li><a href="javascript:MapClick('Del6');">The Bread Shop Co</a></li>
                    <li><a href="javascript:MapClick('Del7');">Kent & Sons</a></li>
                    <li><a href="javascript:MapClick('Del8');">Harry Morgan</a></li>
                    <li><a href="javascript:MapClick('Del9');">D1 Coffee</a></li>
                    <li><a href="javascript:MapClick('Del10');">Sheepdrove Organic Farm Family Butcher</a></li>
                    <li><a href="javascript:MapClick('Del11');">The Winery</a></li>
                    <li><a href="javascript:MapClick('Del12');">Baker & Spice</a></li>
                </ol>
                <ol type="1" id="maplistshops">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/shopicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Sho1');">Cecilia Colman Gallery</a></li>
                    <li><a href="javascript:MapClick('Sho2');">Square One</a></li>
                    <li><a href="javascript:MapClick('Sho3');">Paulie</a></li>
                    <li><a href="javascript:MapClick('Sho4');">Daniel Raphael Gallery</a></li>
                    <li><a href="javascript:MapClick('Sho5');">Alfies Antique Market</a></li>
                    <li><a href="javascript:MapClick('Sho6');">Lisson Gallery</a></li>
                    <li><a href="javascript:MapClick('Sho7');">Joel & Son Fabrics</a></li>
                    <li><a href="javascript:MapClick('Sho8');">Farrells</a></li>
                    <li><a href="javascript:MapClick('Sho9');">Follett's</a></li>
                    <li><a href="javascript:MapClick('Sho10');">Clifton Nurseries</a></li>
                </ol>
                <ol type="1" id="maplistresta">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/restauranticon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Res1');">The Duke of York</a></li>
                    <li><a href="javascript:MapClick('Res2');">The Ivy Cafe</a></li>
                    <li><a href="javascript:MapClick('Res3');">Fego Caffe</a></li>
                    <li><a href="javascript:MapClick('Res4');">Lord's Tavern</a></li>
                    <li><a href="javascript:MapClick('Res5');">Original Lahore Restaurant</a></li>
                    <li><a href="javascript:MapClick('Res6');">Crocker's Folly</a></li>
                    <li><a href="javascript:MapClick('Res7');">Cafe Laville</a></li>
                    <li><a href="javascript:MapClick('Res8');">Maguro</a></li>
                    <li><a href="javascript:MapClick('Res9');">The Warwick Castle</a></li>
                    <li><a href="javascript:MapClick('Res10');">The Bridge House</a></li>
                    <li><a href="javascript:MapClick('Res11');">The Summerhouse</a></li>
                    <li><a href="javascript:MapClick('Res12');">The Waterway</a></li>
                    <li><a href="javascript:MapClick('Res13');">The Prince Alfred</a></li>
                </ol>
                <ol type="1" id="maplisthotel">
                    <li class="mapicon" style="list-style-type: none;"><img src="/img/db/maps/hotelicon.jpg" /></li>
                    <li value="1"><a href="javascript:MapClick('Hot1');">London Marriott Hotel Maide Vale</a></li>
                    <li><a href="javascript:MapClick('Hot2');">Danubius Hotel Regents Park</a></li>
                    <li><a href="javascript:MapClick('Hot3');">Park Avenue Baker Street</a></li>
                    <li><a href="javascript:MapClick('Hot4');">Dorset Square Hotel</a></li>
                    <li><a href="javascript:MapClick('Hot5');">The Landmark Hotel</a></li>
                    <li><a href="javascript:MapClick('Hot6');">The Colunnade Hotel London</a></li>
                    <li><a href="javascript:MapClick('Hot7');">The Warrington Hotel</a></li>
                </ol>
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
        </div>
    </div>
    
    <div class="col movinsection" id="neightboursection">
        
        <div class="row sectiontitleseparation">
            <h1 class="neightsectiontitleh1">Neighbourhood</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>
            <h2 class="transition-slideup centre is-visible test2">My Local life</h2>
        </div>
        <div class="row" id="mylocallifelist">
            <uc1:ListBox ID="ListBox1" runat="server" TableName="mylocallife"/> 
        </div>
    </div>

    <div class="col movinsection" id="mapsection">
        
        <div class="row sectiontitleseparation">
            <h1 class="neightsectiontitleh1">connected</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>
            <h2 class="transition-slideup centre is-visible test2">getting around london</h2>
        </div>
        <div class="row" id="mapslist">
            <div class="row neighitem neighimaleft">
                <div class="col">
                    <div class="row secondpart">
                        <div class="col slideimagecol">
				            <img src="/gfx/newelizabeth.jpg" alt="elizabeth Line"/>
                        </div>
                        <div class="col slidetextcol">
                            <div class="titletext">
                               THE ELIZABETH LINE (CROSSRAIL)
                            </div>
                            <div class="detailtext">
                                <p>
                                    From 2021, the Elizabeth Line (also known as Crossrail) will service nearby Paddington Station. This new line will cut journey 
                                    times across London, easing congestion and providing better connections to Heathrow Airport, shopping and theatre in Tottenham 
                                    Court Road, the City, Canary Wharf, and beyond. 
                                </p>
                                <p>
                                    Paddington Station is a 12 minute walk from Lyons Place.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
		    </div>
            <div class="row neighitem neighimaright">
                <div class="col">
                    <div class="row secondpart">
                        <div class="col slideimagecol mobileimage">
				            <img src="/gfx/newtube.jpg" alt="Underground"/>
                        </div>
                        <div class="col slidetextcol">
                            <div class="titletext">
                                Underground
                            </div>
                            <div class="detailtext">
                                <p>
                                    Lyons Place is ideally situated less than 12 minutes’ walk from five tube stations, with direct access to the Bakerloo, 
                                    District, Circle, and Hammersmith & City lines.
                                </p>
                                <p>
                                    All journey times indicated are from Edgware Road Station.
                                </p>
                            </div>
                        </div>
                        <div class="col slideimagecol desktopimage">
				            <img src="/gfx/newtube.jpg" alt="Underground"/>
                        </div>
                    </div>
                </div>
		    </div>
        </div>
    </div>

    <div class="col movinsection" id="communitysection">
        
        <div class="row sectiontitleseparation">
            <h1 class="neightsectiontitleh1">community</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>
            <h2 class="transition-slideup centre is-visible test2">Meet my neighbours</h2>
        </div>
        <div class="row" id="neighbourslist">
            <uc1:ListBox ID="ListBox2" runat="server" TableName="neighbours"/> 
        </div>
    </div>

</asp:Content>