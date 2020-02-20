<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Releases.aspx.cs" Inherits="SurgeSolutions.FrontEnd.Releases" Title="Released - Lyons Place"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/PropertyFloorplan.ascx" tagname="PropertyFloorplan" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css?oc1018"/>    
    <link rel="stylesheet" href="/css/releases.css?oc1018"/>      
    <script src="/scr/releases.js?oc1018"></script>   
        <script src="/scr/jquery.cycle2.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_carousel.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_swipe.js?oc1018"></script>
    <script src="/scr/jquery.touchwipe.min.js?oc1018"></script>   
    <script src="/scr/jquery.maphilight.js"></script>
   <style>
        .container-fluid
        {
	        background-image:url(/gfx/asdasdasd.jpg);
            background-repeat:no-repeat;
            /*background-attachment:fixed;*/
	        background-size: cover !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
    <div class="col">
        <div class="row titlereleases">
            <h1 id="titlepage">currently released</h1>
            <h1 class="underline transition-slideup centre is-visible"></h1>

<h2 class="transition-slideup centre is-visible">TOWNHOUSES, DUPLEX PENTHOUSES &amp; APARTMENTS</h2>
        </div>
    </div>
    <div class="col">
        <div id="floorplanbigdiv" class="row testclass">
            <uc1:PropertyFloorplan ID="PropertyFloorplan1" PropertyTypeId="0" runat="server"/>
        </div>
    </div>

      <div class="col update">
        <div id="updatep" class="row">
            <p> <span id="lastupdate">last update</span> 14:13:14 02/10/18</p>

        </div>
    </div>

    <div class="col contact">
        <div id="contactp" class="row">
            <p> <a href="/register">contact us</a></p>

        </div>
    </div>

</asp:Content>