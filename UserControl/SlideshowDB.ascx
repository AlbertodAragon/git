<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowDB.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.SlideshowDB" %>
 
<asp:Repeater ID="rptSlideshow" runat="server">
	<HeaderTemplate>        
		<div id="slideshowbox" class="row">
            <div class="col">
			    <div id="slidebuttons">
				<a id="prev" class="prev"></a>
				<a id="next" class="next"></a>
			</div>
		
			    <ul id="slideshow" class="cycle-slideshow" data-cycle-slides="li"
				     data-cycle-timeout="5000" 
				    data-cycle-swipe="true" data-cycle-swipe-fx="scrollHorz"
				    data-cycle-prev="#prev" data-cycle-next="#next">
	</HeaderTemplate>    
    <ItemTemplate>
		        <li>
			        <img src="/img/db/slideshow/<%#Eval("Image")%>"/>
                    <div class="slideshowtextbox">

                    </div>
		        </li>
    </ItemTemplate>
    <FooterTemplate>
			    </ul>
		    </div>
        </div>
    </FooterTemplate>
</asp:Repeater>


