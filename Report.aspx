<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
</head>
<body>
    <h2>Reports</h2>
    
    <form id="form1" runat="server">
        <h3>Single Client</h3>
        <p>This report shows all data for a single client, within a specified timeframe, for either all or a specific exercise category.</p>
        
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <br />
            

            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <br /> 
        
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblEndDate" runat="server" Text="End Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblCategory" runat="server" Text="Exercise Category"></asp:Label>
            <asp:DropDownList ID="ddlExercise" runat="server" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sdsExercise" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>"
                        SelectCommand="SELECT * FROM [Exercise]"></asp:SqlDataSource>           
            
            <br /><br />
        <%--
        <asp:GridView ID="gvSingle" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" DataSourceID="sdsSingle" OnRowDataBound="gvSingle_RowDataBound" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:TemplateField HeaderText="AnaerobicTest">
                    <ItemTemplate>                            
                        <asp:GridView ID="gvSingleAnaerobic" runat="server" AutoGenerateColumns="False" DataSourceID="sdsSingleAnaerobicTest">
                            <Columns>
                                <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                                <asp:BoundField DataField="Wingate - Peak Power(absolute)" HeaderText="Wingate - Peak Power(absolute)" SortExpression="Wingate - Peak Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Peak Power(relative)" HeaderText="Wingate - Peak Power(relative)" SortExpression="Wingate - Peak Power(relative)" />
                                <asp:BoundField DataField="Wingate - Mean Power(absolute)" HeaderText="Wingate - Mean Power(absolute)" SortExpression="Wingate - Mean Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Mean Power(relative)" HeaderText="Wingate - Mean Power(relative)" SortExpression="Wingate - Mean Power(relative)" />
                                <asp:BoundField DataField="Wingate - Minimum Power(absolute)" HeaderText="Wingate - Minimum Power(absolute)" SortExpression="Wingate - Minimum Power(absolute)" />
                                <asp:BoundField DataField="Wingate - Minimum Power(relative)" HeaderText="Wingate - Minimum Power(relative)" SortExpression="Wingate - Minimum Power(relative)" />
                                <asp:BoundField DataField="Wingate - Fatique Index" HeaderText="Wingate - Fatique Index" SortExpression="Wingate - Fatique Index" />                                    
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsSingleAnaerobicTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
                            SelectCommand="SELECT AnaerobicTest.ParticipantID,
                                                AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                                AnaerobicTest.[Wingate - Fatique Index]                                                    
                                            FROM AnaerobicTest
                                            ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtFirstName" DefaultValue="%" Name="FirstName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtLastName" DefaultValue="%" Name="LastName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtStartDate" DefaultValue="%" Name="StartDate" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtEndDate" DefaultValue="%" Name="EndDate" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlExercise" DefaultValue="%" Name="Exercise" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>                   
                </Columns>
                <RowStyle VerticalAlign="Top" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsSingle" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
            SelectCommand="SELECT DISTINCT AnaerobicTest.ParticipantID  
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            ">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlExercise" DefaultValue="%" Name="Exercise" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                
        <asp:Button ID="btnExportSingle" runat="server" Text="Generate Single Report" OnClick="btnExportSingle_Click" />          
         --%>
        <h3>Multiple Clients</h3>
        <p>This report generates data for all clients in a specified group (sport group, gender, or date).</p>
            <h2>By Sport</h2>
            
            <asp:Label ID="lblSport" runat="server" Text="Sport"></asp:Label>
            <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sdsSport" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>"
                        SelectCommand="SELECT * FROM [Sport]"></asp:SqlDataSource>
            <br /><br />
            
        <asp:GridView ID="gvMultipleSport" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" DataSourceID="sdsBySport" OnRowDataBound="gvMultipleSport_RowDataBound" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:TemplateField HeaderText="AnaerobicTest">
                    <ItemTemplate>
                        <asp:GridView ID="gvMultipleSportAnaerobic" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
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
                            ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
                            SelectCommand="SELECT AnaerobicTest.ParticipantID,
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
            </Columns>
            <RowStyle VerticalAlign="Top" />
        </asp:GridView>        
        <asp:SqlDataSource ID="sdsBySport" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
            SelectCommand="SELECT DISTINCT AnaerobicTest.ParticipantID  
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.Sport LIKE @Sport)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSport" DefaultValue="%" Name="Sport" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnExportSportReport" runat="server" Text="Export Sport Report" OnClick="btnExportSport_Click" />

        <br /><br />

        <h2>By Gender</h2>
        <asp:Label ID="lblGender" runat="server" Text="Gender" ></asp:Label>
        <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="True" DataTextField="Gender" DataValueField="Gender">
            <asp:ListItem Value="%">all</asp:ListItem>
            <asp:ListItem Value="male">male</asp:ListItem>
            <asp:ListItem Value="female">female</asp:ListItem>
        </asp:DropDownList>            
        <br /><br />
                        
        <asp:GridView ID="gvMultipleGender" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" DataSourceID="sdsByGender" OnRowDataBound="gvMultipleGender_RowDataBound" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                <asp:TemplateField HeaderText="AnaerobicTest">
                    <ItemTemplate>
                            
                        <asp:GridView ID="gvMultipleGenderAnaerobic" runat="server" AutoGenerateColumns="False" DataSourceID="sdsGenderAnaerobicTest">
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
                        <asp:SqlDataSource ID="sdsGenderAnaerobicTest" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
                            SelectCommand="SELECT AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                                AnaerobicTest.[Wingate - Peak Power(relative)], 
                                                AnaerobicTest.[Wingate - Mean Power(absolute)],
                                                AnaerobicTest.[Wingate - Mean Power(relative)],
                                                AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                                AnaerobicTest.[Wingate - Minimum Power(relative)],
                                                AnaerobicTest.[Wingate - Fatique Index] 
                                            FROM AnaerobicTest
                                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                                            WHERE (UserProfile.gender LIKE @Gender)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle VerticalAlign="Top" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsByGender" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
            SelectCommand="SELECT DISTINCT AnaerobicTest.ParticipantID  
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnExportGender" runat="server" Text="Export Gender Report" OnClick="btnExportGender_Click" />
        <br /><br />

        <h2>By Date</h2>
        <asp:Label ID="lblStartDateTwo" runat="server" Text="Start Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtStartDateTwo" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblEndDateTwo" runat="server" Text="End Date (YYYY-MM-DD)"></asp:Label>
            <asp:TextBox ID="txtEndDateTwo" runat="server" ></asp:TextBox>            
                             
            <br />  
        <%-- 
        <asp:GridView ID="gvMultipleDate" runat="server" AutoGenerateColumns="False" DataKeyNames="ParticipantID" DataSourceID="sdsByDate" OnRowDataBound="gvMultipleDate_RowDataBound" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="ParticipantID" HeaderText="ParticipantID" InsertVisible="False" ReadOnly="True" SortExpression="ParticipantID" />
                    <asp:TemplateField HeaderText="AnaerobicTest">
                        <ItemTemplate>
                            
                            <asp:GridView ID="gvMultipleDateAnaerobic" runat="server" AutoGenerateColumns="False" DataSourceID="sdsMultipleDateAnaerobicTest">
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
                            <asp:SqlDataSource ID="sdsMultipleDateAnaerobicTest" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
                                SelectCommand="SELECT AnaerobicTest.[Wingate - Peak Power(absolute)], 
                                                    AnaerobicTest.[Wingate - Peak Power(relative)], 
                                                    AnaerobicTest.[Wingate - Mean Power(absolute)],
                                                    AnaerobicTest.[Wingate - Mean Power(relative)],
                                                    AnaerobicTest.[Wingate - Minimum Power(absolute)],
                                                    AnaerobicTest.[Wingate - Minimum Power(relative)],
                                                    AnaerobicTest.[Wingate - Fatique Index] 
                                                FROM AnaerobicTest
                                                INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                                                ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtStartDateTwo" DefaultValue="%" Name="StartDate" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtEndDateTwo" DefaultValue="%" Name="EndDate" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                <RowStyle VerticalAlign="Top" />
            </asp:GridView>
            --%>

        <asp:SqlDataSource ID="sdsByDate" runat="server" ConnectionString="<%$ ConnectionStrings:ClientDataConnectionString %>" 
            SelectCommand="SELECT DISTINCT AnaerobicTest.ParticipantID  
                            FROM AnaerobicTest
                            INNER JOIN UserProfile ON AnaerobicTest.ParticipantID = UserProfile.ParticipantID 
                            WHERE (UserProfile.gender LIKE @Gender)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGender" DefaultValue="%" Name="Gender" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        
            

    </form>
        
    
        
</body>
</html>
