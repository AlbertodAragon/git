<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogDetails.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.BlogDetails" %>

<asp:Repeater ID="rptBlogs" runat="server">
    <ItemTemplate>

        <div class="image"><img src="/img/db/<%#Eval("Large")%>" alt="<%#Eval("Title")%>"/></div>
        <div class="text">
            <ul id="blogdetails">
			<!--<li><a href="/<%=TableName %>"><< Back to <%=LinkBack %> index</a></li>-->
            <li><a href="https://www.lyonsplace.co.uk/blog/press-releases"><< Back to <%=LinkBack %> index</a></li>
			        
            
            <li><h1><%#Eval("Title")%></h1></li> 

               <li class="date"><p>  <%#Eval("BlogDateString") %></p></li>
                <li class="shotd"><p><%#Eval("Standfirst")%></p></li>
             
            <li class="details"><%#Eval("Details").ToString()%></li>
        </ul>

             </div>
    </ItemTemplate>
</asp:Repeater> 

