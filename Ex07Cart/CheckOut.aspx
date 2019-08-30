<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 7: CheckOut</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/CheckOut.css" rel="stylesheet" />
</head>
<body>
<header>
    <img src="Images/banner.jpg" alt="Halloween Store" />
</header>
<section>
    <h1>CheckOut Page 1</h1>
    <form id="form1" runat="server" defaultfocus="txtEmail1" defaultbutton="btnCheckOut">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="Please correct these entries" BorderColor="Black" 
            BorderStyle="Solid" BorderWidth="1px" />
        <h2>Contact information</h2>
        <label>Email address: </label>
        <asp:TextBox ID="txtEmail1" runat="server" CssClass="entry"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" 
                CssClass="validator" ErrorMessage="First email address"
                Display="Dynamic" ControlToValidate="txtEmail1"  >Required
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revtxtEmail1" runat="server"
                ErrorMessage="First email address" CssClass="validator" Display="Dynamic" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtEmail1">Must be a valid email address
            </asp:RegularExpressionValidator><br />
        <label>Email re-entry: </label>
        <asp:TextBox ID="txtEmail2" runat="server" CssClass="entry"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" 
                ErrorMessage="Second email address" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtEmail2">Required
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvEmail2" runat="server" ErrorMessage="Second email address" 
                ControlToCompare="txtEmail1" ControlToValidate="txtEmail2" 
                CssClass="validator" Display="Dynamic">Must match first entry
            </asp:CompareValidator><br />
        <label>First name: </label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="entry"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                ErrorMessage="First name" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtFirstName">Required
            </asp:RequiredFieldValidator><br />          
        <label>Last name: </label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="entry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                ErrorMessage="Last name" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtLastName">Required
            </asp:RequiredFieldValidator><br />
        <label>Phone number:</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="entry"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                ErrorMessage="Phone number" CssClass="validator"
                Display="Dynamic" ControlToValidate="txtPhone" Text="Required" InitialValue="999-999-9999"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                CssClass="validator" Display="Dynamic" ErrorMessage="Phone number" 
                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                ControlToValidate="txtPhone" >Use this format: 999-999-9999</asp:RegularExpressionValidator><br />

        <h2>Billing address</h2>
        <label>Address: </label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="entry"></asp:TextBox>       
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                ErrorMessage="Billing address" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtAddress" Text="Required">
            </asp:RequiredFieldValidator><br />
        <label>City: </label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="entry"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                ErrorMessage="Billing city" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtCity" Text="Required">
            </asp:RequiredFieldValidator><br />
        <label>State: </label>
        <asp:DropDownList ID="ddlState" runat="server" CssClass="entry" 
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="StateName" DataValueField="StateCode">
            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                ErrorMessage="Billing state" CssClass="validator" 
                Display="Dynamic" ControlToValidate="ddlState" Text="Required">
            </asp:RequiredFieldValidator><br />
        <label>Zip code: </label>
        <asp:TextBox ID="txtZip" runat="server" CssClass="entry" MaxLength="5"></asp:TextBox>    
            <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                ErrorMessage="Billing zip code" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtZip" Text="Required" InitialValue="99999 or 99999-9999"></asp:RequiredFieldValidator>
        <br />

        <h2>Shipping address</h2>
        <div id="sameAsBilling">
            <asp:CheckBox ID="chkSameAsBilling" runat="server" 
                Text="Same as billing address" 
                OnCheckedChanged="chkSameAsBilling_CheckedChanged" 
                AutoPostBack="True" /><br /><br />
        </div>
        <label>Address: </label>
        <asp:TextBox ID="txtShipAddress" runat="server" CssClass="entry"></asp:TextBox>       
            <asp:RequiredFieldValidator ID="rfvShipAddress" runat="server" 
                ErrorMessage="Shipping address" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtShipAddress" 
                Text="Required" >
            </asp:RequiredFieldValidator><br />
        <label>City: </label>
        <asp:TextBox ID="txtShipCity" runat="server" CssClass="entry" ></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvShipCity" runat="server" 
                ErrorMessage="Shipping city" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtShipCity" 
                Text="Required" >
            </asp:RequiredFieldValidator><br />
        <label>State: </label>
        <asp:DropDownList ID="ddlShipState" runat="server" CssClass="entry" 
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="StateName" DataValueField="StateCode" >
            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvShipState" runat="server" 
                ErrorMessage="Shipping state" CssClass="validator" 
                Display="Dynamic" ControlToValidate="ddlShipState" 
                Text="Required" >
            </asp:RequiredFieldValidator><br />
        <label>Zip code: </label>
        <asp:TextBox ID="txtShipZip" runat="server" CssClass="entry" ></asp:TextBox>    
            <asp:RequiredFieldValidator ID="rfvShipZip" runat="server" 
                ErrorMessage="Shipping zip code" CssClass="validator" 
                Display="Dynamic" ControlToValidate="txtShipZip" 
                Text="Required"   >
            </asp:RequiredFieldValidator><br />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
            SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateCode]">
        </asp:SqlDataSource>       

        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="button" 
            OnClick="btnCheckOut_Click"  />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
            CausesValidation="False" OnClick="btnCancel_Click" CssClass="button" />
        <asp:LinkButton ID="lbtnContinueShopping" runat="server"
            PostBackUrl="~/Order.aspx" CausesValidation="False">Continue Shopping</asp:LinkButton>
    
    </form>
</section>
</body>
</html>
