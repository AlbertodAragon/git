<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="PropertyT.aspx.cs" Inherits="SurgeSolutions.FrontEnd.PropertyT" Title="Property"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>
<%@ Register src="/UserControls/PropertySlides.ascx" tagname="PropertySlides" tagprefix="uc1" %>
<%@ Register src="/UserControls/PropertyFloorplan.ascx" tagname="PropertyFloorplan" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css"/>    
    <link rel="stylesheet" href="/css/property.css"/>      
    <link rel="stylesheet" href="/css/propertymasterplan.css"/>       
    <script src="/scr/jquery.cycle2.js"></script>
    <script src="/scr/jquery.cycle2_carousel.js"></script>
    <script src="/scr/jquery.cycle2_swipe.js"></script>
    <script src="/scr/jquery.touchwipe.min.js"></script> 
    <script src="/scr/jquery.maphilight.js"></script>            
    <script src="/scr/property.js"></script> 
    <script>
        $(function () {
            OpenAcordeon('1');
            setTimeout("OpenAcordeon('2');", 100);
            setTimeout("OpenAcordeon('3');", 200);
            setTimeout("OpenAcordeon('4');", 300);
            setTimeout("OpenAcordeon('5');", 400);
            setTimeout("OpenAcordeon('6');", 500);
        });

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

            $(".ptypemain").each(function (i, el) {
                var el = $(el);
                if (el.visible(true)) {
                    el.addClass("come-in"); 
                }
            });

        });
        $(window).scroll(function (event) {

            $("#floorplanbigdiv").each(function (i, el) {
                var el = $(el);
                if (el.visible(true)) {
                    el.addClass("come-in");
                }
            });

        });

        $(window).scroll(function (event) {

            $(".slideitem").each(function (i, el) {
                var el = $(el);
                if (el.visible(true)) {
                    el.addClass("come-in");
                }
            });

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

            allMods.each(function (i, el) {
                var el = $(el);
                if (el.visible(true)) {
                    el.addClass("come-in");
                }
            });

        });
    </script>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">

    <uc1:Slideshow ID="Slideshow" runat="server" ParentID="1111"/>

    <!-- details text and description -->
    <div class="row ptypemain property">
        <h1><%=Title %></h1>
        <p><%=BodyText %></p>
        <img src="/img/db/property-type/<%=FloorplanImage %>" id="holdingmasterplan" />

        <div id="masterplan">
            <img src="/gfx/masterplan/baseimage.jpg" id="masterplanbase" class="masterplanimage" />
            <img src="/gfx/masterplan/blue.png" id="masterplanblue" class="masterplanimage" />
            <img src="/gfx/masterplan/pink.png" id="masterplanpink" class="masterplanimage" />

            <div id="gardenbox">
                <div id="gardeninside">
                    <h1>Gardens and courtyards</h1>
                    <p>Courtyard areas and larger roof gardens have been generously planted for the residents exclusive use.</p>
                </div>
                <img src="/gfx/masterplanpointer.png" class="masterplanpointer" />
            </div>

            <div id="apartmentbox">
                <img src="/gfx/masterplanpointer.png" class="masterplanpointer" />
            </div>
            <div id="apartmentboxcontent">
                <h1>Twenty-four apartments & two duplex penthouses</h1>
                <p>There are 13 one-bed apartments, 9 two-bed apartments and 2 three-bed duplex penthouses. They all enjoy private balconies or terraces, with the two duplex penthouse apartments benefiting from large roof terraces.</p>
            </div>

            <div id="townhousebox">
                <img src="/gfx/masterplanpointer.png" class="masterplanpointer" />
                <div id="townhouseinside">
                    <h1>five townhouses</h1>
                    <p>There are 5 three-bed townhouses set over three floors. All have private access from Lyons Place and benefit from generous outdoor terraces.</p>
                </div>
            </div>

            <div id="parkingbox">
                <img src="/gfx/masterplanpointer.png" class="masterplanpointer" />
                <div id="parkinginside">
                    <h1>Private parking</h1>
                    <p>Lyons Place offers secure underground parking with remote controlled gates for 39 cars, and 118 bicycle spaces.</p>
                </div>
            </div>
        </div>

    </div>
        
    <div id="contentbox" class="row">
        <div class="col">
            <uc1:PropertySlides ID="PropertySlides1" runat="server"/>
        </div>

        <div class="col">
            <div id="floorplanbigdiv" class="row">
                <uc1:PropertyFloorplan ID="PropertyFloorplan1" runat="server"/>
            </div>
        </div>
    </div>	

</asp:Content>