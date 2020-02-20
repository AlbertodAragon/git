<%@ Page Language="C#" MasterPageFile="/masterpages/Standard.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SurgeSolutions.FrontEnd.Contact" Title="Contact Us - Lyons Place"%>
<%@ MasterType virtualpath="/masterpages/Standard.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headPL" runat="server">
   
    <link rel="stylesheet" href="/css/contact.css?1018"/>   
    <script src="/scr/contact2.js?1018"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="textPL" runat="server">
    
    <div class="slideshow">
        <img src="/gfx/headerevent.jpg" />

    </div>

    <div class="textcenter">

        <p><b>You are invited to view the new Sales Suite, as part of our open day to celebrate the launch of Lyons Place.</b></p>
        <p>Saturday 9th February<br/>
            10:00am – 4:00pm</p>
        <p><a href="https://goo.gl/maps/zKZwE94wyxn" target="_blank">Lyons Place Sales Suite,<br/>
           466 Edgware Road, W2 1EL</a></p>
        <p>Food provided by local eatery Baker & Spice.</p>

        <p class="yellow">Special offers available on launch day only</p>



    </div>

    <div class="form">
         <div id="titleform"><h2 id="titleform2">Yes, I would like to attend the launch event at Lyons Place</h2></div>
         <form name="contactform2" id="contactform2">
                <div class="col" id="leftcontactform2">
                    <ul>
                        <!--<li class="spaceinputdiv halfinput">
                            <%=TitleDropDown%>
                            <div id="ftitle_idlabel" class="spacediv">Title</div>     
                        </li>-->
                        <li class="spaceinputdiv halfinput">
                            <input id="ffirst-name" name="*first name" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="ffirst-namelabel" class="spacediv">First Name</div>     
                        </li>
                        <li class="spaceinputdiv halfinput">
                            <input id="flast-name" name="*last name" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="flast-namelabel" class="spacediv">Last Name</div>     
                        </li>
                        <li class="spaceinputdiv halfinput">
                            <input id="fmobile" name="*mobile" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="fmobilelabel" class="spacediv">Phone Number</div>     
                        </li>
                        <li class="spaceinputdiv halfinput">
                            <input id="femail" name="*email" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="femaillabel" class="spacediv">Email Address</div>     
                        </li>
                  
                      
                        <li class="spaceinputdiv halfinput mayors">
                            <span>Additional Guest?</span><img id="faditional" class="interested" src="/gfx/checkboxyes.jpg" />
                            <input id="faditionallabel" class="interestedhidden" type="hidden" name="" value="yes"/>
                            
                        </li>

                    <li class="spaceinputdiv halfinput numberguest">
                            <input id="fguestnumber" name="guest number" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="fguestnumberlabel" class="spacediv">Number of additional guests</div>     
                        </li>
                               
                        
                      
                        <li class="submitli">
                
        
                            <span id="outcomemsg" class="red"></span>
                            <a href="javascript:SubmitEvent();" id="submitforevent">Submit</a>
                        </li>
                    </ul>    
                </div>
            </form>
    </div>

    

    <div class="textcenter">
        <p><b>For event enquiries</b></p>
        <p>Zoe Stead-Hall</p>
        <p><a href="mailto:zoe.stead-hall@almacantar.com ">zoe.stead-hall@almacantar.com </a></p>
        <p><a href="tel:00442075352918">+44 20 7535 2918</a></p>

    </div>


</asp:Content>