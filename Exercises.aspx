<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exercises.aspx.cs" Inherits="Exercises" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>410 Project - Exercise Info Entry</title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="left">

            <br />
            <br />

            <table width="100%">
                <tr>
                    <td width="15%"><asp:Label ID="lblDropdownList" runat="server" Text="Category of Exercise" /></td>
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
                        <table frame="box">
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
                                    <asp:TextBox ID="txtVOsmax" runat="server" size="10" />
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
                                    <asp:TextBox ID="txtMVOsmax" runat="server" size="10" />
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
                                    <asp:TextBox ID="txtRMR" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblCaloric" runat="server" Text="Caloric" />
                                    <asp:TextBox ID="txtCaloric" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnAerobic" runat="server" Text="Enter" OnClick="btnAerobic_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table frame="box">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblAnaerobic" runat="server" Text="Anaerobic Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingatePeak" runat="server" Text="Wingate Peak Power" />
                                    <asp:TextBox ID="txtWingatePeak" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateMean" runat="server" Text="Wingate Mean Power" />
                                    <asp:TextBox ID="txtWingateMean" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateMin" runat="server" Text="Wingate Minimum Power" />
                                    <asp:TextBox ID="txtWingateMin" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWingateFatique" runat="server" Text="Wingate Fatique" />
                                    <asp:TextBox ID="txtWingateFatique" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnAnaerobic" runat="server" Text="Enter" OnClick="btnAnaerobic_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table frame="box">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblPower" runat="server" Text="Power Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblVertical" runat="server" Text="Vertical Jump" />
                                    <asp:TextBox ID="txtVertical" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblMargaria" runat="server" Text="Margaria Kalamen" />
                                    <asp:TextBox ID="txtMargaria" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnPower" runat="server" Text="Enter" OnClick="btnPower_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table frame="box">
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
                                    <asp:TextBox ID="txtBench" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblPull" runat="server" Text="Pull-ups" />
                                    <asp:TextBox ID="txtPull" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblPush" runat="server" Text="Push-ups" />
                                    <asp:TextBox ID="txtPush" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblCurl" runat="server" Text="Partial Curl-ups" />
                                    <asp:TextBox ID="txtPCurl" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblDips" runat="server" Text="Dips" />
                                    <asp:TextBox ID="txtDips" runat="server" size="10" />
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
                                    <asp:TextBox ID="txtRMBench" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblRMSquat" runat="server" Text="1-RM Squat" />
                                    <asp:TextBox ID="txtRMSquat" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnStrength" runat="server" Text="Enter" OnClick="btnStrength_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table frame="box">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblFlexibility" runat="server" Text="Flexibility Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblTSAR" runat="server" Text="Traditional Sit and Reach" />
                                    <asp:TextBox ID="txtTSAR" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblMSAR" runat="server" Text="Modified Sit and Reach" />
                                    <asp:TextBox ID="txtMSAR" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblYSAR" runat="server" Text="YMCA Sit and Reach" />
                                    <asp:TextBox ID="txtYSAR" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnFlexibility" runat="server" Text="Enter" OnClick="btnFlexibility_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table frame="box">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblBodyComp" runat="server" Text="Body Composition Test" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblSkinFoldP" runat="server" Text="7 Site Sknifold(Pop)" />
                                    <asp:TextBox ID="txtSkinFoldP" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblSkinFoldS" runat="server" Text="7 Site Sknifold(Siri)" />
                                    <asp:TextBox ID="txtSkinFoldS" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblSkinFoldB" runat="server" Text="7 Site Sknifold(Brozek)" />
                                    <asp:TextBox ID="txtSkinFoldB" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWHRatio" runat="server" Text="Waist-Hip Ratio" />
                                    <asp:TextBox ID="txtWHRatio" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblWCircumf" runat="server" Text="Waist Circumference" />
                                    <asp:TextBox ID="txtWCircumf" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBMI" runat="server" Text="Body Mass Index" />
                                    <asp:TextBox ID="txtBMI" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBIA" runat="server" Text="Bioelectrical Impedance" />
                                    <asp:TextBox ID="txtBIA" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    <asp:Label ID="lblBodPod" runat="server" Text="BodPod" />
                                    <asp:TextBox ID="txtBodPod" runat="server" size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnBodyComp" runat="server" Text="Enter" OnClick="btnBodyComp_Click" />
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
