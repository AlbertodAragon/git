<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="SurgeSolutions.FrontEnd.Content" Title="Samuel Estates"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register assembly="GlobalControls" namespace="SurgeSolutions.GlobalControls.Navigation" tagprefix="Navigation" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css?oc1018"/>    
    <link rel="stylesheet" href="/css/slider.css?oc1018"/>    
    <link rel="stylesheet" href="/css/content.css?oc1018"/>            
    <script src="/scr/jquery.cycle2.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_carousel.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_swipe.js?oc1018"></script>
    <script src="/scr/jquery.touchwipe.min.js?oc1018"></script>       
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?oc1018#pubid=ra-4eaff31d5c82ad34"></script>    
    <script src="/scr/content.js?oc1019"></script>    
	<script src="/scr/forms.js?oc1018"></script>	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
<!--    <uc1:Slideshow ID="Slideshow" runat="server"/>-->
        
    <div id="contentbox" class="row maincontent">
        <div class="col">
            <h2 class="title"><%=PageTitle%></h2>
            <div class="textcontent"><%=BodyText%></div>
        </div>

        <!--<div class="execlose"><p>Close</p><a href="javascript:showeverything()"><img src="/gfx/closenav.png" /></a></div>-->
        <div class="execlose"><p>Close</p><a href="/"><img src="/gfx/closenav.png" /></a></div>
    </div>	


</asp:Content>