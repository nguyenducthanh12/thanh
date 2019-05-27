<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Chapter 3: Future Value</title>
    <link href="Styles.css" rel="stylesheet" />
</head>
<body>
    <header>
        <img id="logo" alt="Murach logo" src="Images/MurachLogo.jpg"/>
    </header>
    <section>
        <form id="form1" runat="server">
            <h1>401K Future Value Calculator</h1>
            <label>Monthly investment:</label>
            <asp:DropDownList ID="ddlMonthlyInvestment" runat="server" CssClass="entry"></asp:DropDownList ><br />
            <label>Annual interest rate:</label>
            <asp:TextBox ID="txtInterestRate" runat="server" CssClass="entry">6.0</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    CssClass="validator" ErrorMessage="Interest rate is required." 
                    ControlToValidate="txtInterestRate" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="validator" 
                    ControlToValidate="txtInterestRate" Display="Dynamic" 
                    ErrorMessage="Interest rate must range from 1 to 20." MaximumValue="20" 
                    MinimumValue="1" Type="Double"></asp:RangeValidator><br />
            <label>Number of years:</label>
            <asp:TextBox ID="txtYears" runat="server" CssClass="entry">10</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    CssClass="validator" ControlToValidate="txtYears" Display="Dynamic" 
                    ErrorMessage="Number of years is required."></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" CssClass="validator"
                    ControlToValidate="txtYears" Display="Dynamic" 
                    ErrorMessage="Years must range from 1 to 45." MaximumValue="45" 
                    MinimumValue="1" Type="Integer"></asp:RangeValidator><br />
            <label>Future value:</label>
            <asp:Label ID="lblFutureValue" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate" 
                onclick="btnCalculate_Click" CssClass="button" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" 
                onclick="btnClear_Click" CssClass="button" CausesValidation="False" />
        </form>
    </section>    
</body>
</html>
