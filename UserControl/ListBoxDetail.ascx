<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListBoxDetail.ascx.cs" Inherits="SurgeSolutions.FrontEnd.UserControls.ListBoxDetail" %>

<asp:Repeater ID="rptBlogs" runat="server">
    <ItemTemplate>
        <ul id="blogdetails">
			<li class="backlink"><a href="/blog"><< Back to <%=LinkTo %> index</a></li>
			<li>&nbsp;</li>            
            <li class="image"><img src="/img/db/<%=TableName %>-large/<%#Eval("Image")%>" alt="<%#Eval("Title")%>"/></li>
            <li class="title"><h1><%#Eval("Title")%></h1></li> 
            <li class="details"><%#Eval("Details").ToString()%></li>
        </ul>
    </ItemTemplate>
</asp:Repeater> 