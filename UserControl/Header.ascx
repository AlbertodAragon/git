<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.Header" %>
<%@ Register assembly="GlobalControls" namespace="SurgeSolutions.GlobalControls.Navigation" tagprefix="Navigation" %>

<header>    
    <div id="logoandnav" class="row" style="">	
        <div id="headerbg"></div>
        	
        <div class="col"> 
		    <a id="logo" href="/">                
                <img src="/gfx/logo.png" />
		    </a>
        </div>
        <div class="col">
            <a id="registerlink2" href="http://www.lyonsplace.co.uk/register">register</a>
        </div>
        <div class="col">
		    <a id="showmenu" href="javascript:ShowMenu()" title="Show Menu">      
                <img src="/gfx/show-menu.png" />
		    </a>
         </div>     
        <div id="navigationbox">

            <a id="logo2" href="/">                
                <img src="/gfx/logo.png" />
		    </a>
               <div class="col register title">
            <a id="registerlink" href="http://www.lyonsplace.co.uk/register">register</a>
        </div>
		    <a id="showmenuclose" href="javascript:HideMenu()" title="Hide Menu">
                <a href="javascript:HideMenu()" id="nav-close" class="is-visible"></a>
		    </a>
        <!--<Navigation:Nav ID="navigation" runat="server"></Navigation:Nav>-->
           <nav id="navigationnav"><ul id="navigation">
                <li id="l_home" class="first"><a id="ctl00_Header1_s_home" href="/">Home</a></li>
                <li id="l_townhouses"><a id="ctl00_Header1_s_townhouses" href="/townhouses">Townhouses</a></li>
                <li id="l_duplex-penthouse"><a id="ctl00_Header1_s_duplex-penthouse" href="/duplex-penthouse">duplex penthouses</a></li>
                <li id="l_register"><a id="ctl00_Header1_s_register" href="/register">register</a></li>
                <li id="l_neighbourhood"><a id="ctl00_Header1_s_neighbourhood" href="/neighbourhood">neighbourhood</a></li>
                <li id="l_apartments"><a id="ctl00_Header1_s_apartments" href="/apartments">apartments</a></li>
                <li id="l_team"><a id="ctl00_Header1_s_team" href="/team">team</a></li>
                <li id="l_currently-released"><a id="ctl00_Header1_s_currently-released" href="/currently-released">currently released</a></li>

                 </ul></nav>
            <nav id="navigationmobnav"><ul id="navigationmob">
                <li id="l_homemob" class="first"><a id="ctl00_Header1_s_homemob" href="/">Home</a></li>
                <li id="l_townhousesmob"><a id="ctl00_Header1_s_townhousesmob" href="/townhouses">Townhouses</a></li>
                <li id="l_duplex-penthousemob"><a id="ctl00_Header1_s_duplex-penthousmob" href="/duplex-penthouse">duplex penthouses</a></li>
                <li id="l_apartmentsmob"><a id="ctl00_Header1_s_apartmentsmob" href="/apartments">apartments</a></li>
                <li id="l_neighbourhoodmob"><a id="ctl00_Header1_s_neighbourhoodmob" href="/neighbourhood">neighbourhood</a></li>
                <li id="l_teammob"><a id="ctl00_Header1_s_teammob" href="/team">team</a></li>
                <li id="l_currently-releasedmob"><a id="ctl00_Header1_s_currently-releasedmob" href="/currently-released">currently released</a></li>
                <li id="l_registermob"><a id="ctl00_Header1_s_registermob" href="/register">register</a></li>

                 </ul></nav>
        
        </div>  
	</div>	    
</header>

