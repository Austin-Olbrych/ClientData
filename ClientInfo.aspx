<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClientInfo.aspx.cs" Inherits="TEAM_PROJECT_DataEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Data - Client Info</title>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
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

        <div>
            <table width="100%">
                <tr>
                    <td valign="top" align ="center" width="25%">
                        <table>
                            <th colspan="3">Existing Client</th>
                            <tr>
                                <td><asp:Label ID="lblSearchLastName" runat="server" Text="Last Name"></asp:Label></td>
                                <td><asp:TextBox ID="txtSearchLastName" runat="server" autocomplete="off"></asp:TextBox></td>
                                <td><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:GridView ID="gvSearch" runat="server" 
                                        AutoGenerateColumns="False" 
                                        DataKeyNames="ParticipantID" 
                                        allowpaging="True" PageSize="10" 
                                        OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" 
                                        OnPageIndexChanging="gvSearch_PageIndexChanging">
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                                            <ItemStyle BackColor="#999999" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" ReadOnly="True" SortExpression="ParticipantID" />
                                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                            <asp:BoundField DataField="Suffix" HeaderText="Suffix" SortExpression="Suffix" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdsExistingClient" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" SelectCommand="SELECT [ParticipantID], [FirstName], [LastName], [Suffix] FROM [UserProfile]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="center" width="50%">
                        <table id="personalInfo" align="center" border="0">
                                <tr>
                                    <th colspan ="2" align="center">
                                        Personal Info
                                    </th>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblID" runat="server" Text="Participant ID"></asp:Label></td>
                                     <td><asp:TextBox ID="txtID" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label></td>
                                     <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></td>
                                     <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblSuffix" runat="server" Text="Suffix"></asp:Label></td>
                                     <td><asp:TextBox ID="txtSuffix" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblSport" runat="server" Text="Sport"></asp:Label></td>
                                     <td>
                                         <asp:DropDownList ID="ddlSport" runat="server" DataSourceID="sdsSport" DataTextField="Sport" DataValueField="Sport" OnDataBound="ddlSport_DataBound" OnSelectedIndexChanged="ddlSport_SelectedIndexChanged"></asp:DropDownList>
                                         <asp:SqlDataSource ID="sdsSport" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" SelectCommand="SELECT [Sport] FROM [Sport]"></asp:SqlDataSource>
                                     </td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label></td>
                                     <td colspan="2">
                                         <asp:RadioButtonList ID="rdblGender" runat="server" >
                                            <asp:ListItem ID="rdbMale" runat="server" Text="Male" />
                                            <asp:ListItem ID="rdbFemale" runat="server" Text="Female"/>
                                         </asp:RadioButtonList>
                                     </td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblPhoneNum" runat="server" Text="Phone Num"></asp:Label></td>
                                     <td><asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
                                     <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblEmergConName" runat="server" Text="Emergency Contact Name"></asp:Label></td>
                                     <td><asp:TextBox ID="txtEmergConName" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblEmergConNum" runat="server" Text="Emergency Contact Number"></asp:Label></td>
                                     <td><asp:TextBox ID="txtEmergConNum" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                     <td align="right" class="auto-style2"><asp:Label ID="lblStartDate" runat="server" Text="Start Date (Month/Day/Year)"></asp:Label></td>
                                     <td><asp:TextBox ID="txtStartDate" runat="server" Text=""></asp:TextBox></td>
                                </tr>
                                <th colspan ="2" align="center">
                                    <asp:Button ID="btnClientInfo" runat="server" Text="Enter" OnClick="btnClientInfo_Click" />
                                </th>
                            </table>
                    </td>
                    <td width="25%" ></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
