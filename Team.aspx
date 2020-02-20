<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="SurgeSolutions.FrontEnd.Team" Title="Team - Lyons Place"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>
<%@ Register src="/UserControls/ListBoxUC.ascx" tagname="ListBox" tagprefix="uc1" %>
<%@ Register src="/UserControls/SlideshowDB.ascx" tagname="Slideshow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
    <link rel="stylesheet" href="/css/slideshow.css?oc1018"/>    
    <link rel="stylesheet" href="/css/releases.css?oc1018"/>      
    <link rel="stylesheet" href="/css/team.css?oc1018"/>  
      <link rel="stylesheet" href="/css/slideshow.css?oc1018"/>
    <script src="/scr/jquery.cycle2.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_carousel.js?oc1018"></script>
    <script src="/scr/jquery.cycle2_swipe.js?oc1018"></script>    
    <script src="/scr/property.js?oc1018"></script>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
    
    <uc1:Slideshow ID="Slideshow1" runat="server" ParentID="1111"/>

    <div class="col teamintro">
        <div class="row teamtitle">
            <h1>team</h1>

        </div>
    </div>
    <div class="col">
        <div class="row" id="teamlist">
            <uc1:ListBox ID="ListBox1" runat="server" TableName="team"/> 
        </div>
    </div>

</asp:Content>