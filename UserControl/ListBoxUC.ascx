<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListBoxUC.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.ListBoxUC" %>

<asp:Repeater ID="rptHomepageSection" runat="server">	  

    <HeaderTemplate>

        
     </headerTemplate>
	<ItemTemplate>
		<div class="row">
            <div class="col" style="background-image:url(/img/db/homepagesection/<%#Eval("Image")%>)">
                <div class="row">
                    <div class="col sectiontextbox">
                        <div class="row">
                            <h2><%#Eval("Title")%></h2>
                            <%#Eval("Details")%>
                            
                            <a href="<%#Eval("UrlId")%>">
                                <div class="rectangle3">
                                    <img src="/gfx/arrowhomepage.png" />
                                </div>
                            </a>
                        </div>
                        <div class="row linksproper">
                            <div class="col" >
                                <div class="titlebox">   <%#Eval("Btt1Text")%></div>
                                <div class="iconbox">
                                    <p class="comingsoon">COMING SOON</p>
                                    <a href="<%#Eval("Btt1Link")%>"><div class="rectangle3copy"><img src="/gfx/arrowhomepagewhite.png" /></div></a></div>
                            </div>
                            <div class="col" >
                                <div class="titlebox"> <%#Eval("Btt2Text")%></div>
                                <div class="iconbox"> <p class="comingsoon">COMING SOON</p><a href="<%#Eval("Btt2Link")%>"><div class="rectangle3copy"><img src="/gfx/arrowhomepagewhite.png" /></div></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
        
	</ItemTemplate>
</asp:Repeater>

<asp:Repeater ID="rptTeam" runat="server">	  
	<ItemTemplate>
		<div class="row teammember teamimagetext">
            <div class="col teamimage">
                <div class="row">
				    <img src="/img/db/team/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                </div>
            </div>
            <div class="col teamtext">
                <div class="row teamdeta">
                    <h2><%#Eval("Title")%></h2>
                   <p><%#Eval("Details")%></p>
                    <%#Eval("WebsiteString")%>
                </div>
                <div class="row teamtesti">
                  <p><%#Eval("TestimonialText")%></i></p>
                    <h1><%#Eval("TestimonialWho")%></h1>
                    <h2><%#Eval("TestimonialTitle")%></h2>
                </div>
            </div>
		</div>
	</ItemTemplate>
    <AlternatingItemTemplate>        
		<div class="row teammember teamtextimage">
            <div class="col teamimage teammobile">
                <div class="row">
				    <img src="/img/db/team/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                </div>
            </div>
            <div class="col teamtext">
                <div class="row teamdeta">
                    <h2><%#Eval("Title")%></h2>
                 <p><%#Eval("Details")%></p>
                    <%#Eval("WebsiteString")%>
                </div>
                <div class="row teamtesti">
                  <p><%#Eval("TestimonialText")%></p>
                    <h1><%#Eval("TestimonialWho")%></h1>
                    <h2><%#Eval("TestimonialTitle")%></h2>
                </div>
            </div>
            <div class="col teamimage teamdesktop">
                <div class="row">
				    <img src="/img/db/team/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                </div>
            </div>
		</div>
    </AlternatingItemTemplate>
</asp:Repeater>

<asp:Repeater ID="rptNeighbour" runat="server">	  
	<ItemTemplate>
		<div class="row neighitem">
            <div class="col">
                <div class="row">
				    <h1>NEIGHBOURHOOD</h1>
                    <h1 class="underline transition-slideup centre is-visible"></h1> <h2 class="transition-slideup centre is-visible"><%#Eval("Title")%></h2>
                </div>
                <div class="row test">
				    <img src="/img/db/neighbourhood/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                </div>
                <div class="row secondpart">
                    <div class="col test2">

                        <div class="testimonialoverimage row quotetext"><%#Eval("TestimonialText")%></div>
                        <img src="/img/db/neighbourhood/<%#Eval("Thumb")%>" alt="<%#Eval("Title")%>"/>
                    </div>
                    <div class="col">
                        <div class="row quotetext">
                         <%#Eval("TestimonialText")%>
                        </div>
                        <div class="row detailtext">
                            <%#Eval("Details")%>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</ItemTemplate>
</asp:Repeater>

<asp:Repeater ID="rptNewNeighbour" runat="server">	  
	<ItemTemplate>
		<div class="row neighitem movinsection neighimaleft">
            <div class="col">
                <div class="row secondpart">
                    <div class="col slideimagecol">
				        <img src="/img/db/neighbourhood/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                    </div>
                    <div class="col slidetextcol">
                        <div class=" titletext">
                            <%#Eval("Title")%>
                        </div>
                        <div class=" quotetext">
                         <%#Eval("TestimonialText")%>
                        </div>
                        <div class=" detailtext">
                            <%#Eval("Details")%>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</ItemTemplate>
	<AlternatingItemTemplate>
		<div class="row neighitem movinsection neighimaright">
            <div class="col">
                <div class="row secondpart">
                    <div class="col slideimagecol mobileimage">
				        <img src="/img/db/neighbourhood/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                    </div>
                    <div class="col slidetextcol">
                        <div class=" titletext">
                            <%#Eval("Title")%>
                        </div>
                        <div class=" quotetext">
                         <%#Eval("TestimonialText")%>
                        </div>
                        <div class=" detailtext">
                            <%#Eval("Details")%>
                        </div>
                    </div>
                    <div class="col slideimagecol desktopimage">
				        <img src="/img/db/neighbourhood/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/>
                    </div>
                </div>
            </div>
		</div>
	</AlternatingItemTemplate>
</asp:Repeater>