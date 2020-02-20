<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogCategory.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.BlogCategory" %>

<div id="sortoption" runat="server" visible="false"></div>

<asp:Repeater ID="rptBlogs" runat="server">    
    <HeaderTemplate>			
		<ul id="blogcategory">			
	</HeaderTemplate>
	<ItemTemplate>
		<li class="blogcate">
			<a href="/blog/<%#Eval("UrlId") %>" class="<%#Eval("Category") %>"><%#Eval("Title") %></a>		
		</li>
	</ItemTemplate>
	<FooterTemplate>
		</ul>	
	</FooterTemplate>     
</asp:Repeater>