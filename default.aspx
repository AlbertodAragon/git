<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SurgeSolutions.FrontEnd._Default" Title=""%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/ListBoxUC.ascx" tagname="ListBox" tagprefix="uc1" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">    
    <link rel="stylesheet" href="/css/homepage.css?oc1018"/>       	
    <link rel="stylesheet" href="/css/slideshow.css?oc1018"/>
    <script src="/scr/jquery.cycle2.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_carousel.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_swipe.js?oc1018"></script>    
    <script src="/scr/homepage.js?oc1018"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">	
    <uc1:Slideshow ID="Slideshow1" runat="server" ParentID="1111"/>
	<!--<section class="row">
        <div class="col"></div>
	</section>-->
     <div id="introtext">
        <%=HPText %>

        </div>
    <uc1:ListBox ID="ListBox1" runat="server" TableName="homepagesection"/>    
</asp:Content> 