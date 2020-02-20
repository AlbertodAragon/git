<%@ Page Language="C#" MasterPageFile="~/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="BlogList.aspx.cs" Inherits="SurgeSolutions.FrontEnd.BlogList" Title="Blogs - Lyons Place" %>
<%@ Register src="UserControls/BlogList.ascx" tagname="BlogList" tagprefix="uc1" %>
<%@ Register src="UserControls/BlogCategory.ascx" tagname="BlogCate" tagprefix="uc1" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">	
    <link rel="stylesheet" href="/css/slideshow.css"/>  
    <link type="text/css" href="/css/blog.css?oc1018" rel="stylesheet"/> 
     <script src="/scr/jquery.cycle2.js"></script>
    <script src="/scr/jquery.cycle2_carousel.js"></script>
    <script src="/scr/jquery.cycle2_swipe.js"></script>
    <script type="text/javascript" src="/scr/blog.js?oc1018"></script>   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">

    
    <uc1:Slideshow ID="Slideshow" runat="server" ParentID="1114"/>

<div id="contentbox">
   <h1 class="contentmaintitle" style="">news</h1>
        
   <uc1:BlogCate ID="BlogCate1" runat="server" TableName="blog"/>

   <uc1:BlogList ID="Blogs" runat="server" TableName="blog"/>
</div>
</asp:Content>