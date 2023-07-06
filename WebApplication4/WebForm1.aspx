<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 999px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="name" runat="server" Text="Name" ToolTip="hello"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <asp:ListBox ID="ListBox1" runat="server">
            <asp:ListItem>Item01</asp:ListItem>
            <asp:ListItem>Item02</asp:ListItem>
            <asp:ListItem>Item03</asp:ListItem>
            <asp:ListItem>Item04</asp:ListItem>
            <asp:ListItem>Item05</asp:ListItem>
        </asp:ListBox>
        <TWebControl:WebControl ID="Header" runat="server" />
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gender" Text="Male" />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gender" Text="Female" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://google.com" Target="_blank" ToolTip="www.google.com">Google</asp:HyperLink>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" ToolTip="Submit" BackColor="#6699FF" BorderColor="#3366FF" BorderStyle="Solid" />
        <br />
        <asp:Label ID="genderLabel" runat="server" Text="Result :"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="06/21/2023 13:57:04"></asp:Calendar>
        <asp:Label ID="dateLabel" runat="server" Text="Date:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload" ToolTip="Upload" />
        <asp:Label ID="FileStatus" runat="server" Text="FileStatus"></asp:Label>
        <br />
        <asp:FileUpload ID="MultipleFileUpload" runat="server" AllowMultiple="True" ToolTip="Multiple Upload" />
        <asp:Button ID="MultipleFileUploadButton" runat="server" OnClick="MultipleFileUploadButton_Click" Text="Upload" ToolTip="Multiple Upload" />
        <asp:Label ID="MulitpleFileStatus" runat="server" Text="FileStatus"></asp:Label>
        <br />
        <asp:Button ID="DownloadButton" runat="server" OnClick="DownloadButton_Click" Text="Download" />
        <asp:Label ID="DownloadLabel" runat="server" Text="Download Status"></asp:Label>
        <br />
        <asp:Label ID="CookieLabel" runat="server" Text="CookieLabel"></asp:Label>
        <br />
        <asp:CheckBox ID="Apple" runat="server" Text="Apple" />
        <br />
        <asp:CheckBox ID="Google" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged" Text="Google" />
        <br />
        <asp:CheckBox ID="Samsung" runat="server" Text="Samsung" />
        <br />
        <asp:Button ID="CookieCollectionButton" runat="server" OnClick="CookieCollectionButton_Click" Text="Next" />
        <br />
        <asp:Label ID="CookieCollectionLabel" runat="server" Text="CookieCollectionLabel"></asp:Label>
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString %>" SelectCommand="SELECT * FROM [students]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TOP (1000) [id]
      ,[name]
      ,[email]
  FROM [students].[dbo].[students]"></asp:SqlDataSource>
    </form>
</body>
</html>
