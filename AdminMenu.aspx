<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.aspx.cs" Inherits="AdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Data - Admin</title>
</head>
<body>
    <form id="form1" runat="server">

        <div align="center" style="padding:10px; background-color:lightgrey;">
            <table width="100%">
                <tr>
                    <td align="left" width="25%"><asp:Label ID="lblUser" runat="server" Text=""/></td>
                    <td align="center" width="50%"><asp:Button ID="btnEditUser" runat="server" Text="Admin Page" OnClick="btnEditUser_Click" />
                        <asp:button ID="btnDataEntry" runat="server" Text="Data Entry Page" OnClick="btnDataEntry_Click"/>
                        <asp:button ID="btnReports" runat="server" Text="Reports Page" OnClick="btnReports_Click" /></td>
                    <td align="right" width="25%"><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"/></td>
                </tr>
            </table>
        </div>
        <br />
        <div align="center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="sdsUserData">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Permission" HeaderText="Permission" SortExpression="Permission" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="PhoneNum" HeaderText="PhoneNum" SortExpression="PhoneNum" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsUserData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ClientData %>" DeleteCommand="DELETE FROM [UserData] WHERE [Username] = @original_Username AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL))" InsertCommand="INSERT INTO [UserData] ([FirstName], [LastName], [Permission], [Username], [Password], [Email], [PhoneNum]) VALUES (@FirstName, @LastName, @Permission, @Username, @Password, @Email, @PhoneNum)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserData] ORDER BY [FirstName], [LastName]" UpdateCommand="UPDATE [UserData] SET [FirstName] = @FirstName, [LastName] = @LastName, [Permission] = @Permission, [Password] = @Password, [Email] = @Email, [PhoneNum] = @PhoneNum WHERE [Username] = @original_Username AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Permission" Type="Int32" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_PhoneNum" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Permission" Type="Int32" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="PhoneNum" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Permission" Type="Int32" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="PhoneNum" Type="String" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Permission" Type="Int32" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_PhoneNum" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <table align="center">
            <tr>
                <th colspan="2" align="center">Enter New User</th>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblFirst" runat="server" Text="First Name:"></asp:Label></td>
                <td><asp:TextBox ID="txtFirst" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblLast" runat="server" Text="Last Name:"></asp:Label></td>
                <td><asp:TextBox ID="txtLast" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblPermission" runat="server" Text="Permission:"></asp:Label></td>
                <td><asp:TextBox ID="txtPermission" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label></td>
                <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label></td>
                <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label></td>
                <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"><asp:Label ID="lblPhone" runat="server" Text="Phone Number:"></asp:Label></td>
                <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnInput" runat="server" Text="Input Data" OnClick="btnInput_Click" /></td>
            </tr>
        </table>
            <asp:Label ID="lblStatus" runat="server" Text="" Visible="False"></asp:Label>
    </form>
    </body>
</html>
