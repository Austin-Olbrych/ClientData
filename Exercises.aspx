<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exercises.aspx.cs" Inherits="Exercises" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Data - Exercises</title>
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

        <div align="left">

            <br />
            <br />

            <table width="100%">
                <tr>
                    <td width="15%"><asp:Label ID="lblDropdownList" runat="server" Text="Category of Exercise" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlEDropDown" runat="server" DataSourceID="sdsDropDown" DataTextField="Exercise" DataValueField="Exercise" OnSelectedIndexChanged="ddlEDropDown_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="sdsDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" SelectCommand="SELECT [Exercise] FROM [Exercise]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEParticipantID" runat="server" Text="Participant ID:" />
                        <asp:TextBox ID="txtEParticipantID" runat="server" Text="You need to get the selected ID"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />



            <table style="margin:auto;margin">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblAerobic" runat="server" Text="Aerobic Test" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAerobicSubmaximal" runat="server" Text="Submaximal" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblSVOsmax" runat="server" Text="VOsmax" />
                                    <asp:TextBox ID="txtVOsmax" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAerobicMaximal" runat="server" Text="Maximal" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblMVOsmax" runat="server" Text="VOsmax" />
                                    <asp:TextBox ID="txtMVOsmax" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblResting" runat="server" Text="Resting" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblRMR" runat="server" Text="RMR" />
                                    <asp:TextBox ID="txtRMR" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblCaloric" runat="server" Text="Caloric" />
                                    <asp:TextBox ID="txtCaloric" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblAnaerobic" runat="server" Text="Anaerobic Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingatePeak" runat="server" Text="Wingate Peak Power" />
                                    <asp:TextBox ID="txtWingatePeak" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateMean" runat="server" Text="Wingate Mean Power" />
                                    <asp:TextBox ID="txtWingateMean" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateMin" runat="server" Text="Wingate Minimum Power" />
                                    <asp:TextBox ID="txtWingateMin" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateFatique" runat="server" Text="Wingate Fatique" />
                                    <asp:TextBox ID="txtWingateFatique" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblPower" runat="server" Text="Power Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblVertical" runat="server" Text="Vertical Jump" />
                                    <asp:TextBox ID="txtVertical" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblMargaria" runat="server" Text="Margaria Kalamen" />
                                    <asp:TextBox ID="txtMargaria" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblStrength" runat="server" Text="Strength/Endurance Test" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSSubmaximal" runat="server" Text="Submaximal" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBenchPress" runat="server" Text="YMCA Bench Press" />
                                    <asp:TextBox ID="txtBench" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblPull" runat="server" Text="Pull-ups" />
                                    <asp:TextBox ID="txtPull" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblPush" runat="server" Text="Push-ups" />
                                    <asp:TextBox ID="txtPush" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblCurl" runat="server" Text="Partial Curl-ups" />
                                    <asp:TextBox ID="TextBox4" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblDips" runat="server" Text="Dips" />
                                    <asp:TextBox ID="txtDips" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSMaximal" runat="server" Text="Maxiaml" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblRMBench" runat="server" Text="1-RM Bench Press" />
                                    <asp:TextBox ID="txtRMBench" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblRMSquat" runat="server" Text="1-RM Squat" />
                                    <asp:TextBox ID="txtRMSquat" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblFlexibility" runat="server" Text="Flexibility Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblTSAR" runat="server" Text="Traditional Sit and Reach" />
                                    <asp:TextBox ID="txtTSAR" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblMSAR" runat="server" Text="Modified Sit and Reach" />
                                    <asp:TextBox ID="txtMSAR" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblYSAR" runat="server" Text="YMCA Sit and Reach" />
                                    <asp:TextBox ID="txtYSAR" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblBodyComp" runat="server" Text="Body Composition Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblSkinFold" runat="server" Text="7 Site Sknifold" />
                                    <asp:TextBox ID="txtSkinFold" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWHRatio" runat="server" Text="Waist-Hip Ratio" />
                                    <asp:TextBox ID="txtWHRatio" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWCircumf" runat="server" Text="Waist Circumference" />
                                    <asp:TextBox ID="txtWCircumf" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBMI" runat="server" Text="Body Mass Index" />
                                    <asp:TextBox ID="txtBMI" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBIA" runat="server" Text="Bioelectrical Impedance" />
                                    <asp:TextBox ID="txtBIA" runat="server" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBodPod" runat="server" Text="BodPod" />
                                    <asp:TextBox ID="txtBodPod" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
