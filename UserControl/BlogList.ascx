<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogList.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.BlogList" %>

<div id="sortoption" runat="server" visible="false"></div>

<asp:Repeater ID="rptBlogs" runat="server">    
    <HeaderTemplate>			
		<ul id="blogs" class="blog<%=TableName %>">			
	</HeaderTemplate>
	<ItemTemplate>
		<li class="blog bc<%=TableName %>" id="blogitem<%#GetItemPosition(Container.ItemIndex)%>">
            <div class="blogitemtext">
                <div class="blogdate">
                    <%#Eval("BlogDateString") %>
                </div>
			    <div class="shortdescription">
			        <%#Eval("Standfirst")%>
			    </div>
			    <div class="longdescription">
			        <%#Eval("Details")%>
			    </div>
			</div>	
			<div class="blogitemimage" itemid="/blog/<%=TableName %>/<%#Eval("UrlID")%>">
				<img src="/img/db/blog/<%#Eval("Large")%>" alt="<%#Eval("Title")%>" onerror="LoadBlogImage(this)"/>
            </div>		
		</li>
	</ItemTemplate>
	<FooterTemplate>
		</ul>	
	</FooterTemplate>     
</asp:Repeater>


