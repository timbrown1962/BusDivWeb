<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PswdChange.Change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <table>
            <tr><td>&nbsp;</td><td><h1>Password Self Service</h1></td></tr>
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>User Name</td></tr>
            <tr><td>
                <br />
                </td><td>
                <asp:TextBox ID="UserName" runat="server" ></asp:TextBox>
            </td></tr>
            <tr><td>&nbsp;</td><td>Old Password</td></tr>
            <tr><td>
                <br />
                </td><td>
                <asp:TextBox ID="OldPswd" runat="server" ></asp:TextBox>
            </td></tr>
            <tr><td>&nbsp;</td><td>New Password</td></tr>
            <tr><td>
                <br />
                </td><td>
                <asp:TextBox ID="NewPswd" runat="server" ></asp:TextBox>
            </td></tr>
            <tr><td>
                &nbsp;</td><td>
                <asp:Button ID="ExecuteCode" runat="server" Text="Change Password" Width="251px" onclick="ExecuteCode_Click" />
            </td></tr>
                <tr><td>&nbsp;</td><td><h3>Result</h3></td></tr>
                <tr><td>
                    &nbsp;</td><td>
                    <asp:TextBox ID="ResultBox" TextMode="MultiLine" Width="700" Height="200" runat="server"></asp:TextBox>
                        <br />
                        <br />
                <asp:Button ID="Continue" runat="server" Text="Continue" Width="251px" onclick="Continue_Click" />
                </td></tr>
        </table>
    </div>
</form>
</body>
</html>
