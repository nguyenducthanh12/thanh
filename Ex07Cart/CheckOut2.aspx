<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut2.aspx.cs" Inherits="CheckOut2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 7: Shopping Cart</title>
    <link href="Styles/Main.css" rel="stylesheet" />
</head>
<body>
    <h1>CheckOut Page 2</h1>
    <h2>Data in Session state</h2>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" Columns="50" Rows="20"></asp:TextBox>  
        <br /><br />
        <asp:Button ID="btnContinue" runat="server"
            PostBackUrl="~/Order.aspx" Text="Continue Shopping" />
    </form>
</body>
</html>
