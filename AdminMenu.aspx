<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.aspx.cs" Inherits="AdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Menu</title>
    <h2>Main Menu</h2>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsUserName" OnRowDeleting="GridView1_RowDeleting" style="margin-right: 2px" OnRowDeleted="GridView1_RowDeleted" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Permission" HeaderText="Permission" SortExpression="Permission" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="PhoneNum" HeaderText="PhoneNum" SortExpression="PhoneNum" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="sdsUserName" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            DeleteCommand="DELETE FROM [UserData] WHERE [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Permission] = @original_Permission AND [Username] = @original_Username AND [Password] = @original_Password AND [Email] = @original_Email AND [PhoneNum] = @original_PhoneNum"
            InsertCommand="INSERT INTO [UserData] ([FisrtName], [LastName], [Permission], [UserName], [Password], [Email], [PhoneNum]) VALUES (@FirstName, @LastName, @Permission, @Username, @Password, @Email, @PhoneNum)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [UserData] ORDER BY [FirstName]"
            UpdateCommand="UPDATE [UserData] SET [FirstName] = @FirstName WHERE [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Permission] = @original_Permission AND [Username] = @original_Username AND [Password] = @original_Password AND [Email] = @original_Email AND [PhoneNum] = @original_PhoneNum">
            <DeleteParameters>
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Permission" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_PhoneNum" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Permission" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNum" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_FirsName" Type="String" />
                <asp:Parameter Name="original_Permission" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_PhoneNum" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h2>Enter New User</h2>
        <p>First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
        </p>
        <p>Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
        </p>
        <p>Permission &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPermission" runat="server"></asp:TextBox>
        </p>
        <p>Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        </p>
        <p>Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
        </p>
        <p>Emai&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </p>
        <p>Phone Number
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="btnInput" runat="server" Text="Input Data" OnClick="btnInput_Click" />
        <p>
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </p>
    </form>
    </body>
</html>
