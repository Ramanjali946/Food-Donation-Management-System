<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDatabase.aspx.cs" Inherits="FoodDonationManagement.TestDatabase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Food Donation Management System</h2>

    <asp:Button ID="btnTest"
        runat="server"
        Text="Test Database Connection"
        OnClick="btnTest_Click" />

    <br /><br />

    <asp:Label ID="lblMessage"
        runat="server">
    </asp:Label>

        </div>
    </form>
</body>
</html>
