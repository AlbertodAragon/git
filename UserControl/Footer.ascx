<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.Footer" %>
<%@ Register assembly="GlobalControls" namespace="SurgeSolutions.GlobalControls.Navigation" tagprefix="Navigation" %>

<footer>
    <div id="footernavs" class="container">
        <div class="row" id="footerform">
            <!-- footer form code here -->
            <div id="titleform"><h2 id="titleform2">register or book a viewing</h2></div>
            <form name="contactform" id="contactform">
                <div class="col" id="leftcontactform">
                    <ul>
                        <li class="spaceinputdiv halfinput">
                            <%=TitleDropDown%>
                            <div id="ftitle_idlabel" class="spacediv">Title</div>     
                        </li>
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
                            <div id="fmobilelabel" class="spacediv">Mobile</div>     
                        </li>
                        <li class="spaceinputdiv halfinput">
                            <input id="femail" name="*email" type="text" class="txt spaceinput" maxlength="50"/> 
                            <div id="femaillabel" class="spacediv">Email</div>     
                        </li>
                        <li class="spaceinputdiv">
                            <%=CountryDropDown %> 
                            <div id="countrylabel" class="spacediv">Country of Residence</div>     
                        </li>
                        <li class="spaceinputdiv">
                            <%=ReasonPurchaseDropDown %> 
                            <div id="reason-for-purchaselabel" class="spacediv">Reason for Purchase</div>     
                        </li>
                        <li>
                            <input id="inputcheckterms" type="checkbox" name="*condictions" checked/><a id="linkterms" href="javascript:OpenFooter('privacy');" target="_blank">Terms and Conditions</a>

                        </li>
                    </ul>
                </div>
                <div class="col" id="rightcontactform">
                    <ul>
                        <li>
                            <span> i am interested in</span>
                        </li>
                        <li class="thirdinput thirdleft">
                            <input class="interestedhidden" type="checkbox" name="finterested" value="apartments" checked>apartments      
                        </li>
                        <li class="thirdinput thirdcenter">
                            <input class="interestedhidden" type="checkbox" name="finterested" value="townhouse">townhouses     
                        </li>
                        <li class="thirdinput thirdright">
                            <input class="interestedhidden" type="checkbox" name="finterested" value="penthouse">duplex penthouses   
                        </li>
                    
                        <% if (!UTMSession)
                           { %>
                        <li class="spaceinputdiv">
                            <%=EnquirySourceDropDown %> 
                            <div id="enquiry-sourcelabel" class="spacediv">How did you hear about lyons place?</div>     
                        </li>
                        <% } %>
                        <li class="spaceinputdiv">
                            <textarea name="*comments" id="fcomments"></textarea>
                            <div id="fcommentslabel" class="spacediv">comments</div>     
                        </li>
                        <li>
                
        
                            <span id="outcomemsg" class="red"></span>
                            <a href="javascript:SubmitContact();" id="submitformhome">Submit</a>
                        </li>
                    </ul>    
                </div>
            </form>

        </div>
        
        <div class="row contactdetails">
            <div class="col">
                <h2>contact our sales team</h2>
            </div>
            <div class="col" id="footercontent">
                <h2>almacantar</h2>
                <span id="linefooterform">-<br /></span>
                <span>James Guilfoyle</span><br />
                <span>Sales Manager</span><br />
                <a href="mailto:james.guilfoyle@almacantar.com">james.guilfoyle@almacantar.com</a><br />
                <a href="tel:004402075353948">+44 (0) 207 535 3948</a>
            </div>
        </div>
        <div class="row">
          <div class="col">
             <a href="https://almacantar.com/" target="_blank"> <img src="/gfx/almacantarlogo.png" /></a>
          </div>
          <div class="col">
            <a href="http://www.lyonsplace.co.uk/" target="_blank">  <img src="/gfx/lyonsplacelogo.png" /></a>
          </div>       
          <div class="col">
             <a href="https://www.thebryanston.co.uk/" target="_blank"> <img src="/gfx/bryanstonlogo.png" /></a>
          </div>       
          <div class="col">
             <a href="https://centrepointresidences.co.uk/" target="_blank"> <img src="/gfx/centerpointlogo.png" /></a>
          </div>       
        </div>
       
    </div> 
    

<div class="topfooterbar">
     <div id="footerbar" class="row">
            <div class="col">
                <!--<Navigation:Nav ID="footernav" runat="server"></Navigation:Nav>-->
                <nav>
                    <ul id="footernav">
                        <li id="l_cookie-policy" class="first">
                            <a id="ctl00_Footer1_s_cookie-policy" href="javascript:OpenFooter('cookie');">cookie policy</a>
                        </li>
                        <li>
                            <span>-</span>
                        </li>
                        <li id="l_disclaimer">
                            <a id="ctl00_Footer1_s_disclaimer" href="javascript:OpenFooter('disclaimer');">disclaimer</a>
                        </li>
                        <li>
                            <span>-</span>
                        </li>
                        <li id="l_privacy-policy">
                            <a id="ctl00_Footer1_s_privacy-policy" href="javascript:OpenFooter('privacy');">privacy policy</a>
                        </li>
                    </ul>
                </nav>  
                    
            </div>
            <div class="col"></div>
            <div class="col">
                <div class="row" id="informationfooter">
                    <div class="col">
                        <span id="copyg">&copy;<asp:Label ID="currentyear" runat="server"></asp:Label><span>&nbsp;Almacantar </span></span></div>
                    <div class="col">
                        <ul id="footersocialnetwork">
                            <li>
                                <a href="https://twitter.com/almacantar_" class="link"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/lyonsplace/" class="link"><i class="fab fa-instagram"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col">
                        <a href="#" class="link">news</a>
                    </div>
                </div>
                <span id="spacegalleon"><a class="link" href="http://www.spacegalleon.co.uk/" target="_blank">Website by Space Galleon</a></span>
            </div>        
        </div>      
    </div>   
   
    <div class="footernavcontent" id="footerconcookie" style="">
        <div class="footercontentbox">
            <%=CoockieContent %>
        </div>
        <a href="javascript:CloseFooter('cookie');" class="closefooter">Close<br /><i class="fas fa-chevron-down"></i></a>
    </div>

    <div class="footernavcontent" id="footercondisclaimer" style="">
        <div class="footercontentbox">
            <%=DisclaimerContet %>
        </div>
        <a href="javascript:CloseFooter('disclaimer');" class="closefooter">Close<br /><i class="fas fa-chevron-down"></i></a>
    </div>

    <div class="footernavcontent" id="footerconprivacy" style="">
        <div class="footercontentbox">
            <%=PrivacyContent %>
        </div>
        <a href="javascript:CloseFooter('privacy');" class="closefooter">Close<br /><i class="fas fa-chevron-down"></i></a>
    </div>
                                 	
</footer>
     


