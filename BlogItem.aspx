<%@ Page Language="C#" MasterPageFile="~/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="BlogItem.aspx.cs" Inherits="SurgeSolutions.FrontEnd.BlogItem" Title="Blogs - BexRox" %>
<%@ Register src="UserControls/BlogDetails.ascx" tagname="BlogDetails" tagprefix="uc1" %>
<%@ Register src="UserControls/BlogList.ascx" tagname="BlogList" tagprefix="uc1" %>
<%@ Register src="UserControls/BlogCategory.ascx" tagname="BlogCate" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">	
    <link type="text/css" href="/css/blog.css?oc1018" rel="stylesheet"/>
    <script type="text/javascript" src="/scr/blog.js?oc1018"></script>   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
<div id="contentbox">     
    <uc1:BlogDetails ID="BlogDetails" runat="server" TableName="blog"/>
</div> 

    <div id="contentbox2" class="insideblogcate">
   
        
   <div class="relatedpost"><p> related posts</p></div>

   <uc1:BlogList ID="Blogs" runat="server" TableName="blog"/>
</div>

</asp:Content>

