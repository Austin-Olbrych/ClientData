﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Data - Reports</title>
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

        <h3>Single Client</h3>
        <p>This report shows all data for a single client, within a specified timeframe.</p>
        
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" AutoPostBack="true"></asp:TextBox>
            <br />
            

            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" AutoPostBack="true"></asp:TextBox>
            <br /> 
        
            <asp:Label ID="lblStartDateSingle" runat="server" Text="Start Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtStartDateSingle" runat="server" AutoPostBack="true"></asp:TextBox>
            <br />

            <asp:Label ID="lblEndDateSingle" runat="server" Text="End Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtEndDateSingle" runat="server" AutoPostBack="true"></asp:TextBox>
            <br />
            
            <br /><br />

        <asp:GridView ID="gvSingle" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" OnRowDataBound="gvSingle_RowDataBound" >
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" InsertVisible="False" ReadOnly="True" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" InsertVisible="False" ReadOnly="True" SortExpression="LastName" />
                <asp:TemplateField HeaderText="Aerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Anaerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Body Composition"></asp:TemplateField>
                <asp:TemplateField HeaderText="Flexibility"></asp:TemplateField>
                <asp:TemplateField HeaderText="Power"></asp:TemplateField>
                <asp:TemplateField HeaderText="Strength and Endurance"></asp:TemplateField>
            </Columns>            
        </asp:GridView> 
        <%--AerobicTest--%>            
        <asp:SqlDataSource ID="sdsSingleAerobicTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT [Submaximal VOsmax(absolute)],
                                [Submaximal VOsmax(relative)],
	                            [Maximal VOsmax(absolute)],
	                            [Maximal VOsmax(relative)],
	                            [Resting RMR(absolute)],
	                            [Resting RMR (relative)],
	                            [Resting Caloric Needs]
                            FROM AerobicTest
                            INNER JOIN UserProfile ON AerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--AnaerobicTest--%>
        <asp:SqlDataSource ID="sdsSingleAnaerobicTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT 
                                AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                AnaerobicTest.[Wingate - Fatique Index]                                                    
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--BodyCompTest--%>
        <asp:SqlDataSource ID="sdsSingleBodyCompTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT
                                [7-Site Skinfold(Pop Specific)],
	                            [7-Site Skinfold(Siri)],
	                            [7-Site Skinfold(Brozek)],
	                            [Waist-Hip Ratio],
	                            [Waist Circumference],
	                            [Body Mass Index],
	                            [Bioelectrical Impedance (BIA)],
	                            [BodPod]                                                                                                  
                            FROM BodyCompTest
                            INNER JOIN UserProfile ON BodyCompTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--FlexibilityTest--%>
        <asp:SqlDataSource ID="sdsSingleFlexibilityTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT
                                [Traditional Sit and Reach (best)],
	                            [Modified Sit and Reach (best)],
	                            [YMCA Sit and Reach (best)]                                                                                                 
                            FROM FlexibilityTest
                            INNER JOIN UserProfile ON FlexibilityTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--PowerTest--%>
        <asp:SqlDataSource ID="sdsSinglePowerTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT
                                [Vertical Jump(absolute)],
	                            [Vertical Jump(relative)],
	                            [Margaria-Kalamen(absolute)],
	                            [Margaria-Kalamen(relative)]                                                                                                  
                            FROM PowerTest
                            INNER JOIN UserProfile ON PowerTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--StrengthEndurTest--%>
        <asp:SqlDataSource ID="sdsSingleStrengthEndurTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT [Submaximal YMCA Bench Press],
	                                [Submaximal Pull-ups],
	                                [Submaximal Push-ups],
	                                [Submaximal Partial Curl-ups],
	                                [Submaximal Dips],
	                                [Maximal 1-RM Bench Press(absolute)],
	                                [Maximal 1-RM Bench Press(relative)],
	                                [Maximal 1-RM Squats(absolute)],
	                                [Maximal 1-RM Squats(relative)]                                                    
                            FROM StrengthEndurTest
                            INNER JOIN UserProfile ON StrengthEndurTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateSingle" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateSingle"  Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsSingle" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT ParticipantID, FirstName, LastName  
                            FROM UserProfile                            
                            WHERE (FirstName LIKE @FirstName + '%') AND (LastName LIKE @LastName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtFirstName" DefaultValue="%" Name="FirstName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtLastName" DefaultValue="%" Name="LastName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnExportSingle" runat="server" Text="Export Single Report" OnClick="btnExportSingle_Click" />
        
        <h3>Multiple Clients</h3>
        <p>This report generates data for all clients in a specified group (sport group, gender, or date).</p>
            <h2>By Sport</h2>
            
            <asp:Label ID="lblSport" runat="server" Text="Sport"></asp:Label>
            <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sdsSportCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>"
                        SelectCommand="SELECT * FROM [Sport]"></asp:SqlDataSource>
            <br /><br />
            
        <asp:GridView ID="gvMultipleSport" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" DataSourceID="sdsBySport" OnRowDataBound="gvMultipleSport_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" InsertVisible="False" ReadOnly="True" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" InsertVisible="False" ReadOnly="True" SortExpression="LastName" />
                <%--AerobicTest--%>
                <asp:TemplateField HeaderText="Aerobic">
                    <ItemTemplate>                            
                        <asp:GridView ID="gvMultipleSportAerobic" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Submaximal VOsmax(absolute)" HeaderText="Submaximal VOsmax(absolute)" SortExpression="Submaximal VOsmax(absolute)" />
                                <asp:BoundField DataField="Submaximal VOsmax(relative)" HeaderText="Submaximal VOsmax(relative)" SortExpression="Submaximal VOsmax(relative)" />
                                <asp:BoundField DataField="Maximal VOsmax(absolute)" HeaderText="Maximal VOsmax(absolute)" SortExpression="Maximal VOsmax(absolute)" />
                                <asp:BoundField DataField="Maximal VOsmax(relative)" HeaderText="Maximal VOsmax(relative)" SortExpression="Maximal VOsmax(relative)" />
                                <asp:BoundField DataField="Resting RMR(absolute)" HeaderText="Resting RMR(absolute)" SortExpression="Resting RMR(absolute)" />
                                <asp:BoundField DataField="Resting RMR (relative)" HeaderText="Resting RMR (relative)" SortExpression="Resting RMR (relative)" />
                                <asp:BoundField DataField="Resting Caloric Needs" HeaderText="Resting Caloric Needs" SortExpression="Resting Caloric Needs" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportAerobicTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [Submaximal VOsmax(absolute)],
                                                [Submaximal VOsmax(relative)],
	                                            [Maximal VOsmax(absolute)],
	                                            [Maximal VOsmax(relative)],
	                                            [Resting RMR(absolute)],
	                                            [Resting RMR (relative)],
	                                            [Resting Caloric Needs]
                                            FROM AerobicTest
                                            INNER JOIN UserProfile ON AerobicTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--AnaerobicTest--%>
                <asp:TemplateField HeaderText="Anaerobic">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportAnaerobic" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                
                                <asp:BoundField DataField="Wingate - Peak Power(absolute)" HeaderText="Wingate - Peak Power(absolute)" SortExpression="Wingate - Peak Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Peak Power(relative)" HeaderText="Wingate - Peak Power(relative)" SortExpression="Wingate - Peak Power(relative)" />
                                <asp:BoundField DataField="Wingate - Mean Power(absolute)" HeaderText="Wingate - Mean Power(absolute)" SortExpression="Wingate - Mean Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Mean Power(relative)" HeaderText="Wingate - Mean Power(relative)" SortExpression="Wingate - Mean Power(relative)" />
                                <asp:BoundField DataField="Wingate - Minimum Power(absolute)" HeaderText="Wingate - Minimum Power(absolute)" SortExpression="Wingate - Minimum Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Minimum Power(relative)" HeaderText="Wingate - Minimum Power(relative)" SortExpression="Wingate - Minimum Power(relative)" />
                                <asp:BoundField DataField="Wingate - Fatique Index" HeaderText="Wingate - Fatique Index" SortExpression="Wingate - Fatique Index" />                                    
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportAnaerobicTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT 
                                                AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                                AnaerobicTest.[Wingate - Fatique Index]                                                    
                                            FROM AnaerobicTest
                                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--BodyCompTest--%>
                <asp:TemplateField HeaderText="Body Composition">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportBodyComp" runat="server" AutoGenerateColumns="False">
                            <Columns>                                
                                <asp:BoundField DataField="7-Site Skinfold(Pop Specific)" HeaderText="7-Site Skinfold(Pop Specific)" SortExpression="7-Site Skinfold(Pop Specific)" />
                                <asp:BoundField DataField="7-Site Skinfold(Siri)" HeaderText="7-Site Skinfold(Siri)" SortExpression="7-Site Skinfold(Siri)" />
                                <asp:BoundField DataField="7-Site Skinfold(Brozek)" HeaderText="7-Site Skinfold(Brozek)" SortExpression="7-Site Skinfold(Brozek)" />
                                <asp:BoundField DataField="Waist-Hip Ratio" HeaderText="Waist-Hip Ratio" SortExpression="Waist-Hip Ratio" />
                                <asp:BoundField DataField="Waist Circumference" HeaderText="Waist Circumference" SortExpression="Waist Circumference" />
                                <asp:BoundField DataField="Body Mass Index" HeaderText="Body Mass Index" SortExpression="Body Mass Index" />
                                <asp:BoundField DataField="Bioelectrical Impedance (BIA)" HeaderText="Bioelectrical Impedance (BIA)" SortExpression="Bioelectrical Impedance (BIA)" />
                                <asp:BoundField DataField="BodPod" HeaderText="BodPod" SortExpression="BodPod" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportBodyCompTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT
                                                [7-Site Skinfold(Pop Specific)],
	                                            [7-Site Skinfold(Siri)],
	                                            [7-Site Skinfold(Brozek)],
	                                            [Waist-Hip Ratio],
	                                            [Waist Circumference],
	                                            [Body Mass Index],
	                                            [Bioelectrical Impedance (BIA)],
	                                            [BodPod]                                                                                                  
                                            FROM BodyCompTest
                                            INNER JOIN UserProfile ON BodyCompTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--FlexibilityTest--%>
                <asp:TemplateField HeaderText="Flexibility">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportFlexibility" runat="server" AutoGenerateColumns="False">
                            <Columns>                                
                                <asp:BoundField DataField="Traditional Sit and Reach (best)" HeaderText="Traditional Sit and Reach (best)" SortExpression="Traditional Sit and Reach (best)" />
                                <asp:BoundField DataField="Modified Sit and Reach (best)" HeaderText="Modified Sit and Reach (best)" SortExpression="Modified Sit and Reach (best)" />
                                <asp:BoundField DataField="YMCA Sit and Reach (best)" HeaderText="YMCA Sit and Reach (best)" SortExpression="YMCA Sit and Reach (best)" />                                
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportFlexibilityTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT
                                                [Traditional Sit and Reach (best)],
	                                            [Modified Sit and Reach (best)],
	                                            [YMCA Sit and Reach (best)]                                                                                                 
                                            FROM FlexibilityTest
                                            INNER JOIN UserProfile ON FlexibilityTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--PowerTest--%>
                <asp:TemplateField HeaderText="Power">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportPower" runat="server" AutoGenerateColumns="False">
                            <Columns>                                
                                <asp:BoundField DataField="Vertical Jump(absolute)" HeaderText="Vertical Jump(absolute)" SortExpression="Vertical Jump(absolute)" />
                                <asp:BoundField DataField="Vertical Jump(relative)" HeaderText="Vertical Jump(relative)" SortExpression="Vertical Jump(relative)" />
                                <asp:BoundField DataField="Margaria-Kalamen(absolute)" HeaderText="Margaria-Kalamen(absolute)" SortExpression="Margaria-Kalamen(absolute)" />
                                <asp:BoundField DataField="Margaria-Kalamen(relative)" HeaderText="Margaria-Kalamen(relative)" SortExpression="Margaria-Kalamen(relative)" />                                
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportPowerTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT
                                                [Vertical Jump(absolute)],
	                                            [Vertical Jump(relative)],
	                                            [Margaria-Kalamen(absolute)],
	                                            [Margaria-Kalamen(relative)]                                                                                                  
                                            FROM PowerTest
                                            INNER JOIN UserProfile ON PowerTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--StrengthEndurTest--%>
                <asp:TemplateField HeaderText="Strength Endurance">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportStrengthEndur" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Submaximal YMCA Bench Press" HeaderText="Submaximal YMCA Bench Press" SortExpression="Submaximal YMCA Bench Press" />
                                <asp:BoundField DataField="Submaximal Pull-ups" HeaderText="Submaximal Pull-ups" SortExpression="Submaximal Pull-ups" />
                                <asp:BoundField DataField="Submaximal Push-ups" HeaderText="Submaximal Push-ups" SortExpression="Submaximal Push-ups" />
                                <asp:BoundField DataField="Submaximal Partial Curl-ups" HeaderText="Submaximal Partial Curl-ups" SortExpression="Submaximal Partial Curl-ups" />
                                <asp:BoundField DataField="Submaximal Dips" HeaderText="Submaximal Dips" SortExpression="Submaximal Dips" />
                                <asp:BoundField DataField="Maximal 1-RM Bench Press(absolute)" HeaderText="Maximal 1-RM Bench Press(absolute)" SortExpression="Maximal 1-RM Bench Press(absolute)" />
                                <asp:BoundField DataField="Maximal 1-RM Bench Press(relative)" HeaderText="Maximal 1-RM Bench Press(relative)" SortExpression="Maximal 1-RM Bench Press(relative)" />
                                <asp:BoundField DataField="Maximal 1-RM Squats(absolute)" HeaderText="Maximal 1-RM Squats(absolute)" SortExpression="Maximal 1-RM Squats(absolute)" />
                                <asp:BoundField DataField="Maximal 1-RM Squats(relative)" HeaderText="Maximal 1-RM Squats(relative)" SortExpression="Maximal 1-RM Squats(relative)" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSportStrengthEndurTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [Submaximal YMCA Bench Press],
	                                                [Submaximal Pull-ups],
	                                                [Submaximal Push-ups],
	                                                [Submaximal Partial Curl-ups],
	                                                [Submaximal Dips],
	                                                [Maximal 1-RM Bench Press(absolute)],
	                                                [Maximal 1-RM Bench Press(relative)],
	                                                [Maximal 1-RM Squats(absolute)],
	                                                [Maximal 1-RM Squats(relative)]                                                    
                                            FROM StrengthEndurTest
                                            INNER JOIN UserProfile ON StrengthEndurTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.Sport LIKE @Sport) AND (UserProfile.ParticipantID = @ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <RowStyle VerticalAlign="Top" />
        </asp:GridView>        
        <asp:SqlDataSource ID="sdsBySport" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT ParticipantID, FirstName, LastName  
                            FROM UserProfile                            
                            WHERE (UserProfile.Sport LIKE @Sport)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnExportSportReport" runat="server" Text="Export Sport Report" OnClick="btnExportSport_Click" />

        <br /><br />

        <h2>By Gender</h2>
        <asp:Label ID="lblGender" runat="server" Text="Gender" ></asp:Label>
        <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="True" DataTextField="gender" DataValueField="gender">
            
            <asp:ListItem Value="male">male</asp:ListItem>
            <asp:ListItem Value="female">female</asp:ListItem>
        </asp:DropDownList>            
        <br /><br />
                        
        <asp:GridView ID="gvMultipleGender" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" OnRowDataBound="gvMultipleGender_RowDataBound" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" InsertVisible="False" ReadOnly="True" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" InsertVisible="False" ReadOnly="True" SortExpression="LastName" />
                <asp:TemplateField HeaderText="Aerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Anaerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Body Composition"></asp:TemplateField>
                <asp:TemplateField HeaderText="Flexibility"></asp:TemplateField>
                <asp:TemplateField HeaderText="Power"></asp:TemplateField>
                <asp:TemplateField HeaderText="Strength and Endurance"></asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--AerobicTest--%>
        <asp:SqlDataSource ID="sdsGenderAerobicTest" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                    SelectCommand="SELECT [Submaximal VOsmax(absolute)],
                                        [Submaximal VOsmax(relative)],
	                                    [Maximal VOsmax(absolute)],
	                                    [Maximal VOsmax(relative)],
	                                    [Resting RMR(absolute)],
	                                    [Resting RMR (relative)],
	                                    [Resting Caloric Needs]
                                    FROM AerobicTest
                                    INNER JOIN UserProfile ON AerobicTest.ParticipantID = UserProfile.ParticipantID 
                                    WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </SelectParameters>
        </asp:SqlDataSource>                    
        <%--AnaerobicTest--%>
        <asp:SqlDataSource ID="sdsGenderAnaerobicTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT 
                                AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                AnaerobicTest.[Wingate - Fatique Index]                                                    
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--BodyCompTest--%>
        <asp:SqlDataSource ID="sdsGenderBodyCompTest" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                        SelectCommand="SELECT
                                            [7-Site Skinfold(Pop Specific)],
	                                        [7-Site Skinfold(Siri)],
	                                        [7-Site Skinfold(Brozek)],
	                                        [Waist-Hip Ratio],
	                                        [Waist Circumference],
	                                        [Body Mass Index],
	                                        [Bioelectrical Impedance (BIA)],
	                                        [BodPod]                                                                                                  
                                        FROM BodyCompTest
                                        INNER JOIN UserProfile ON BodyCompTest.ParticipantID = UserProfile.ParticipantID 
                                        WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        <%--FlexibilityTest--%>
        <asp:SqlDataSource ID="sdsGenderFlexibilityTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT
                                [Traditional Sit and Reach (best)],
	                            [Modified Sit and Reach (best)],
	                            [YMCA Sit and Reach (best)]                                                                                                 
                            FROM FlexibilityTest
                            INNER JOIN UserProfile ON FlexibilityTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>                    
        <%--PowerTest--%>                
        <asp:SqlDataSource ID="sdsGenderPowerTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT
                                [Vertical Jump(absolute)],
	                            [Vertical Jump(relative)],
	                            [Margaria-Kalamen(absolute)],
	                            [Margaria-Kalamen(relative)]                                                                                                  
                            FROM PowerTest
                            INNER JOIN UserProfile ON PowerTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--StrengthEndurTest--%>
        <asp:SqlDataSource ID="sdsGenderStrengthEndurTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT [Submaximal YMCA Bench Press],
	                                [Submaximal Pull-ups],
	                                [Submaximal Push-ups],
	                                [Submaximal Partial Curl-ups],
	                                [Submaximal Dips],
	                                [Maximal 1-RM Bench Press(absolute)],
	                                [Maximal 1-RM Bench Press(relative)],
	                                [Maximal 1-RM Squats(absolute)],
	                                [Maximal 1-RM Squats(relative)]                                                    
                            FROM StrengthEndurTest
                            INNER JOIN UserProfile ON StrengthEndurTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender) AND (UserProfile.ParticipantID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%e%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>   
                
        <asp:SqlDataSource ID="sdsByGender" runat="server" ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT ParticipantID, FirstName, LastName  
                            FROM UserProfile                             
                            WHERE (UserProfile.gender = @Gender)">
            <SelectParameters>
                    <asp:ControlParameter ControlID="ddlGender" DefaultValue="male" Name="Gender" PropertyName="SelectedValue" Type="String" />                    
                </SelectParameters>
        </asp:SqlDataSource>
               
        <asp:Button ID="btnExportGender" runat="server" Text="Export Gender Report" OnClick="btnExportGender_Click" />
        <br /><br />

        <h2>By Date</h2>
        <asp:Label ID="lblStartDateMultiple" runat="server" Text="Start Date (YYYY-MM-DD)"></asp:Label>
        <asp:TextBox ID="txtStartDateMultiple" runat="server" AutoPostBack="true"></asp:TextBox>
        <br />

        <asp:Label ID="lblEndDateMultiple" runat="server" Text="End Date (YYYY-MM-DD)"></asp:Label>
        <asp:TextBox ID="txtEndDateMultiple" runat="server" AutoPostBack="true"></asp:TextBox>            
                             
        <br />          
        <br />
        <asp:GridView ID="gvMultipleDate" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" OnRowDataBound="gvMultipleDate_RowDataBound" AutoPostBack="True">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" InsertVisible="False" ReadOnly="True" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" InsertVisible="False" ReadOnly="True" SortExpression="LastName" />
                <asp:TemplateField HeaderText="Aerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Anaerobic"></asp:TemplateField>
                <asp:TemplateField HeaderText="Body Composition"></asp:TemplateField>
                <asp:TemplateField HeaderText="Flexibility"></asp:TemplateField>
                <asp:TemplateField HeaderText="Power"></asp:TemplateField>
                <asp:TemplateField HeaderText="Strength and Endurance"></asp:TemplateField>
            </Columns>            
        </asp:GridView>
        <%--AerobicTest--%>
        <asp:SqlDataSource ID="sdsDateAerobicTest" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [EntryDate],
                            [Submaximal VOsmax(absolute)], 
                            [Submaximal VOsmax(relative)], 
                            [Maximal VOsmax(absolute)], 
                            [Maximal VOsmax(relative)], 
                            [Resting RMR(absolute)], 
                            [Resting RMR (relative)], 
                            [Resting Caloric Needs]
                            FROM [AerobicTest]
                            INNER JOIN UserProfile ON AerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE ((EntryDate >= @StartDate) AND (EntryDate <= @EndDate) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--AnaerobicTest--%>                
        <asp:SqlDataSource ID="sdsDateAnaerobicTest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT [EntryDate],
                                AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                AnaerobicTest.[Wingate - Fatique Index]                                                    
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (((EntryDate > @StartDate) OR (EntryDate = @StartDate)) AND ((EntryDate < @EndDate) OR (EntryDate = @EndDate)) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--BodyCompTest--%>
        <asp:SqlDataSource ID="sdsDateBodyCompTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [EntryDate],
                                                [7-Site Skinfold(Pop Specific)],
	                                            [7-Site Skinfold(Siri)],
	                                            [7-Site Skinfold(Brozek)],
	                                            [Waist-Hip Ratio],
	                                            [Waist Circumference],
	                                            [Body Mass Index],
	                                            [Bioelectrical Impedance (BIA)],
	                                            [BodPod]                                                                                                  
                                            FROM BodyCompTest
                                            INNER JOIN UserProfile ON BodyCompTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (((EntryDate > @StartDate) OR (EntryDate = @StartDate)) AND ((EntryDate < @EndDate) OR (EntryDate = @EndDate)) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--FlexibilityTest--%>
        <asp:SqlDataSource ID="sdsDateFlexibilityTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [EntryDate],
                                                [Traditional Sit and Reach (best)],
	                                            [Modified Sit and Reach (best)],
	                                            [YMCA Sit and Reach (best)]                                                                                                 
                                            FROM FlexibilityTest
                                            INNER JOIN UserProfile ON FlexibilityTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (((EntryDate > @StartDate) OR (EntryDate = @StartDate)) AND ((EntryDate < @EndDate) OR (EntryDate = @EndDate)) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--PowerTest--%>
        <asp:SqlDataSource ID="sdsDatePowerTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [EntryDate],
                                                [Vertical Jump(absolute)],
	                                            [Vertical Jump(relative)],
	                                            [Margaria-Kalamen(absolute)],
	                                            [Margaria-Kalamen(relative)]                                                                                                  
                                            FROM PowerTest
                                            INNER JOIN UserProfile ON PowerTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (((EntryDate > @StartDate) OR (EntryDate = @StartDate)) AND ((EntryDate < @EndDate) OR (EntryDate = @EndDate)) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple" Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--StrengthEndurTest--%>
        <asp:SqlDataSource ID="sdsDateStrengthEndurTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
                            SelectCommand="SELECT [EntryDate],
                                                    [Submaximal YMCA Bench Press],
	                                                [Submaximal Pull-ups],
	                                                [Submaximal Push-ups],
	                                                [Submaximal Partial Curl-ups],
	                                                [Submaximal Dips],
	                                                [Maximal 1-RM Bench Press(absolute)],
	                                                [Maximal 1-RM Bench Press(relative)],
	                                                [Maximal 1-RM Squats(absolute)],
	                                                [Maximal 1-RM Squats(relative)]                                                    
                                            FROM StrengthEndurTest
                                            INNER JOIN UserProfile ON StrengthEndurTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (((EntryDate > @StartDate) OR (EntryDate = @StartDate)) AND ((EntryDate < @EndDate) OR (EntryDate = @EndDate)) AND (UserProfile.ParticipantID = @ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDateMultiple" Name="StartDate" DefaultValue="2018-01-01" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDateMultiple"  Name="EndDate" DefaultValue="3000-01-01" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="sdsByDate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClientData %>" 
            SelectCommand="SELECT [ParticipantID], [FirstName], [LastName] FROM [UserProfile]">
        </asp:SqlDataSource>       
        <asp:Button ID="btnExportDate" runat="server" Text="Export Date Report" OnClick="btnExportDate_Click"/>
    </form>
</body>
</html>