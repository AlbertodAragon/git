<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PropertySlides.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.PropertySlides" %>
 
<asp:Repeater ID="rptPropertySlides" runat="server">
	<HeaderTemplate>        
		<div id="slides" class="row">
	</HeaderTemplate>    
    <ItemTemplate>
        <div class="row slideitem slideitemimagetext">
            <div class="col pslideimagecol">
                <img src="/img/db/property-slide/<%#Eval("Image")%>"/>
            </div>
            <div class="col pslidedetailscol">
                <h2><%#Eval("Title")%></h2>
                <p><%#Eval("Standfirst")%></p>
                <img src="/img/db/property-slide/<%#Eval("MaterialImage")%>"/>
            </div>
        </div>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <div class="row slideitem slideitemtextimage">
            <div class="col pslideimagecol propertymobile">
                <img src="/img/db/property-slide/<%#Eval("Image")%>"/>
            </div>
            <div class="col pslidedetailscol">
                <h2><%#Eval("Title")%></h2>
                <p><%#Eval("Standfirst")%></p>
                <img src="/img/db/property-slide/<%#Eval("MaterialImage")%>"/>
            </div>
            <div class="col pslideimagecol propertydesktop">
                <img src="/img/db/property-slide/<%#Eval("Image")%>"/>
            </div>
        </div>
    </AlternatingItemTemplate>
    <FooterTemplate>
			    </ul>
		    </div>
        </div>
    </FooterTemplate>
</asp:Repeater>


