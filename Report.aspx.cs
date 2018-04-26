using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;  // for ConfigurationManager
using System.Data.SqlClient; // for SqlConnection, SqlCommand, and SqlDataReader
using System.Data;           // for CommandType
using System.IO;                   // File I/O stuff

public partial class Report : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataReader dr;
    string connectionString;
    ListItem listItem;
    int numRowsAffected;

    //Single Variables
    DataView dvSingleAerobic;
    GridView gvSingleAerobic;
    DataView dvSingleAnaerobic;
    GridView gvSingleAnaerobic;
    DataView dvSingleBodyComp;
    GridView gvSingleBodyComp;
    DataView dvSingleFlexibility;
    GridView gvSingleFlexibility;
    DataView dvSinglePower;
    GridView gvSinglePower;
    DataView dvSingleStrengthEndur;
    GridView gvSingleStrengthEndur;

    //ByDate Variables
    DataView dvDateAerobic;
    GridView gvDateAerobic;
    DataView dvDateAnaerobic;
    GridView gvDateAnaerobic;
    DataView dvDateBodyComp;
    GridView gvDateBodyComp;
    DataView dvDateFlexibility;
    GridView gvDateFlexibility;
    DataView dvDatePower;
    GridView gvDatePower;
    DataView dvDateStrengthEndur;
    GridView gvDateStrengthEndur;

    //ByGender Variables
    DataView dvGenderAerobic;
    GridView gvGenderAerobic;
    DataView dvGenderAnaerobic;
    GridView gvGenderAnaerobic;
    DataView dvGenderBodyComp;
    GridView gvGenderBodyComp;
    DataView dvGenderFlexibility;
    GridView gvGenderFlexibility;
    DataView dvGenderPower;
    GridView gvGenderPower;
    DataView dvGenderStrengthEndur;
    GridView gvGenderStrengthEndur;
    //GridView gv;

    // This way gives a file name of C_Temp_States.xls
    // But it works.
    // Also, we can change it in the header in WriteTheFile method, and it still works
    string fileName = "C:/Temp/Report.xls";

    // This way gives an error, trying to put the file in C:\Program Files (x86)...
    //string fileName = "States.xls";

    // This method is required, but don't put anything in it!!
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    } // end of VerifyRenderingInServerForm

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // We are only here if this is NOT a post back.
            // i.e. We do this once.
            
            // Get the Sport Categories and load them into the DropDownList
            ddlSport.DataSource = sdsSportCategory;
            ddlSport.DataTextField = "Sport";
            ddlSport.DataValueField = "Sport";            
            ddlSport.DataBind();            
            ddlSport.Items.Insert(0, new ListItem("all", "%")); 

        } // end of if
        
        gvMultipleDate.DataSourceID = "sdsByDate";
        gvMultipleDate.DataBind();

        gvMultipleGender.DataSourceID = "sdsByGender";
        gvMultipleGender.DataBind();

        gvSingle.DataSourceID = "sdsSingle";
        gvSingle.DataBind();

        lblUser.Text = Convert.ToString(Session["lastName"] + ", " + Session["FirstName"]);
        //lblPerm.Text = Convert.ToString(Session["permission"]);
        if (Session["username"] != null)
        {
            //Response.Write("Username = " + Session["username"]);
        }
        else
        {
            Response.Redirect("Default.aspx", false);
        }
        //Determines Permissions
        if (Convert.ToString(Session["permission"]) == "0")
        {

        }
        if (Convert.ToString(Session["permission"]) == "1")
        {
            btnEditUser.Visible = false;
        }
        if (Convert.ToString(Session["permission"]) == "2")
        {
            btnEditUser.Visible = false;
            btnDataEntry.Visible = false;
        }
    } 
    

    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ClientDataConnectionString"].ConnectionString;
    } // end of getConnectionString

    protected void btnExportSport_Click(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(strWriter);        
        gvMultipleSport.RenderControl(htmlWriter);        
        StreamWriter writer = new StreamWriter(fileName, false);
        strWriter.ToString().Normalize();
        writer.Write(strWriter.ToString());
        writer.Flush();
        writer.Close();
        WriteTheFile(fileName, "application/vnd.ms-excel", strWriter.ToString());
    } // end of btnExportSport

    protected void btnExportGender_Click(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(strWriter);
        gvMultipleGender.RenderControl(htmlWriter);
        StreamWriter writer = new StreamWriter(fileName, false);
        strWriter.ToString().Normalize();
        writer.Write(strWriter.ToString());
        writer.Flush();
        writer.Close();
        WriteTheFile(fileName, "application/vnd.ms-excel", strWriter.ToString());
    } // end of btnExportGender

    protected void btnExportDate_Click(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(strWriter);
        gvMultipleDate.RenderControl(htmlWriter);
        StreamWriter writer = new StreamWriter(fileName, false);
        strWriter.ToString().Normalize();
        writer.Write(strWriter.ToString());
        writer.Flush();
        writer.Close();
        WriteTheFile(fileName, "application/vnd.ms-excel", strWriter.ToString());
    } // end of btnExportDate

    protected void btnExportSingle_Click(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(strWriter);
        gvSingle.RenderControl(htmlWriter);
        StreamWriter writer = new StreamWriter(fileName, false);
        strWriter.ToString().Normalize();
        writer.Write(strWriter.ToString());
        writer.Flush();
        writer.Close();
        WriteTheFile(fileName, "application/vnd.ms-excel", strWriter.ToString());
    } // end of btnExportSingle      

    private void WriteTheFile(string fileName, string FileType, string content)
    {
        HttpResponse Response = System.Web.HttpContext.Current.Response;
        Response.ClearHeaders();

        // This way strangely gives a file name of C_Temp_States.xls
        //Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

        // This way works, but only if we use the C:/Temp/ prefix in the declaration above
        Response.AppendHeader("Content-Disposition", "attachment; filename=States.xls");
        Response.ContentType = FileType;
        Response.Write(content);
        Response.End();
    } // end of WriteTheFile

    protected void gvMultipleSport_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsSportAerobicTest");
            GridView gv = (GridView)e.Row.FindControl("gvMultipleSportAerobic");
            s.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv.DataSource = s;
            gv.DataBind();

            SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsSportAnaerobicTest");
            GridView gv2 = (GridView)e.Row.FindControl("gvMultipleSportAnaerobic");
            s2.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv2.DataSource = s2;
            gv2.DataBind();

            SqlDataSource s3 = (SqlDataSource)e.Row.FindControl("sdsSportBodyCompTest");
            GridView gv3 = (GridView)e.Row.FindControl("gvMultipleSportBodyComp");
            s3.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv3.DataSource = s3;
            gv3.DataBind();

            SqlDataSource s4 = (SqlDataSource)e.Row.FindControl("sdsSportFlexibilityTest");
            GridView gv4 = (GridView)e.Row.FindControl("gvMultipleSportFlexibility");
            s4.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv4.DataSource = s4;
            gv4.DataBind();

            SqlDataSource s5 = (SqlDataSource)e.Row.FindControl("sdsSportPowerTest");
            GridView gv5 = (GridView)e.Row.FindControl("gvMultipleSportPower");
            s5.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv5.DataSource = s5;
            gv5.DataBind();

            SqlDataSource s6 = (SqlDataSource)e.Row.FindControl("sdsSportStrengthEndurTest");
            GridView gv6 = (GridView)e.Row.FindControl("gvMultipleSportStrengthEndur");
            s6.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv6.DataSource = s6;
            gv6.DataBind();
        }
    }

    protected void gvMultipleGender_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            sdsGenderAerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderAerobic = (DataView)sdsGenderAerobicTest.Select(DataSourceSelectArguments.Empty);
            gvGenderAerobic = new GridView();
            gvGenderAerobic.DataSource = dvGenderAerobic;
            gvGenderAerobic.DataBind();
            e.Row.Cells[3].Controls.Add(gvGenderAerobic);

            sdsGenderAnaerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderAnaerobic = (DataView)sdsGenderAnaerobicTest.Select(DataSourceSelectArguments.Empty);
            gvGenderAnaerobic = new GridView();
            gvGenderAnaerobic.DataSource = dvGenderAerobic;
            gvGenderAnaerobic.DataBind();
            e.Row.Cells[4].Controls.Add(gvGenderAnaerobic);

            sdsGenderBodyCompTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderBodyComp = (DataView)sdsGenderBodyCompTest.Select(DataSourceSelectArguments.Empty);
            gvGenderBodyComp = new GridView();
            gvGenderBodyComp.DataSource = dvGenderBodyComp;
            gvGenderBodyComp.DataBind();
            e.Row.Cells[5].Controls.Add(gvGenderBodyComp);

            sdsGenderFlexibilityTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderFlexibility = (DataView)sdsGenderFlexibilityTest.Select(DataSourceSelectArguments.Empty);
            gvGenderFlexibility = new GridView();
            gvGenderFlexibility.DataSource = dvGenderFlexibility;
            gvGenderFlexibility.DataBind();
            e.Row.Cells[6].Controls.Add(gvGenderFlexibility);

            sdsGenderPowerTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderPower = (DataView)sdsGenderPowerTest.Select(DataSourceSelectArguments.Empty);
            gvGenderPower = new GridView();
            gvGenderPower.DataSource = dvGenderPower;
            gvGenderPower.DataBind();
            e.Row.Cells[7].Controls.Add(gvGenderPower);

            sdsGenderStrengthEndurTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvGenderStrengthEndur = (DataView)sdsGenderStrengthEndurTest.Select(DataSourceSelectArguments.Empty);
            gvGenderStrengthEndur = new GridView();
            gvGenderStrengthEndur.DataSource = dvGenderStrengthEndur;
            gvGenderStrengthEndur.DataBind();
            e.Row.Cells[8].Controls.Add(gvGenderStrengthEndur);
        }
    }

    protected void gvMultipleDate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
                       
            sdsDateAerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDateAerobic = (DataView)sdsDateAerobicTest.Select(DataSourceSelectArguments.Empty);
            gvDateAerobic = new GridView();
            gvDateAerobic.DataSource = dvDateAerobic;
            gvDateAerobic.DataBind();
            e.Row.Cells[3].Controls.Add(gvDateAerobic);

            sdsDateAnaerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDateAnaerobic = (DataView)sdsDateAnaerobicTest.Select(DataSourceSelectArguments.Empty);
            gvDateAnaerobic = new GridView();
            gvDateAnaerobic.DataSource = dvDateAerobic;
            gvDateAnaerobic.DataBind();
            e.Row.Cells[4].Controls.Add(gvDateAnaerobic);

            sdsDateBodyCompTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDateBodyComp = (DataView)sdsDateBodyCompTest.Select(DataSourceSelectArguments.Empty);
            gvDateBodyComp = new GridView();
            gvDateBodyComp.DataSource = dvDateBodyComp;
            gvDateBodyComp.DataBind();
            e.Row.Cells[5].Controls.Add(gvDateBodyComp);

            sdsDateFlexibilityTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDateFlexibility = (DataView)sdsDateFlexibilityTest.Select(DataSourceSelectArguments.Empty);
            gvDateFlexibility = new GridView();
            gvDateFlexibility.DataSource = dvDateFlexibility;
            gvDateFlexibility.DataBind();
            e.Row.Cells[6].Controls.Add(gvDateFlexibility);

            sdsDatePowerTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDatePower = (DataView)sdsDatePowerTest.Select(DataSourceSelectArguments.Empty);
            gvDatePower = new GridView();
            gvDatePower.DataSource = dvDatePower;
            gvDatePower.DataBind();
            e.Row.Cells[7].Controls.Add(gvDatePower);

            sdsDateStrengthEndurTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvDateStrengthEndur = (DataView)sdsDateStrengthEndurTest.Select(DataSourceSelectArguments.Empty);
            gvDateStrengthEndur = new GridView();
            gvDateStrengthEndur.DataSource = dvDateStrengthEndur;
            gvDateStrengthEndur.DataBind();
            e.Row.Cells[8].Controls.Add(gvDateStrengthEndur);
        }
    }

    protected void gvSingle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            sdsSingleAerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSingleAerobic = (DataView)sdsSingleAerobicTest.Select(DataSourceSelectArguments.Empty);
            gvSingleAerobic = new GridView();
            gvSingleAerobic.DataSource = dvSingleAerobic;
            gvSingleAerobic.DataBind();
            e.Row.Cells[3].Controls.Add(gvSingleAerobic);

            sdsSingleAnaerobicTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSingleAnaerobic = (DataView)sdsSingleAnaerobicTest.Select(DataSourceSelectArguments.Empty);
            gvSingleAnaerobic = new GridView();
            gvSingleAnaerobic.DataSource = dvSingleAerobic;
            gvSingleAnaerobic.DataBind();
            e.Row.Cells[4].Controls.Add(gvSingleAnaerobic);

            sdsSingleBodyCompTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSingleBodyComp = (DataView)sdsSingleBodyCompTest.Select(DataSourceSelectArguments.Empty);
            gvSingleBodyComp = new GridView();
            gvSingleBodyComp.DataSource = dvSingleBodyComp;
            gvSingleBodyComp.DataBind();
            e.Row.Cells[5].Controls.Add(gvSingleBodyComp);

            sdsSingleFlexibilityTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSingleFlexibility = (DataView)sdsSingleFlexibilityTest.Select(DataSourceSelectArguments.Empty);
            gvSingleFlexibility = new GridView();
            gvSingleFlexibility.DataSource = dvSingleFlexibility;
            gvSingleFlexibility.DataBind();
            e.Row.Cells[6].Controls.Add(gvSingleFlexibility);

            sdsSinglePowerTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSinglePower = (DataView)sdsSinglePowerTest.Select(DataSourceSelectArguments.Empty);
            gvSinglePower = new GridView();
            gvSinglePower.DataSource = dvSinglePower;
            gvSinglePower.DataBind();
            e.Row.Cells[7].Controls.Add(gvSinglePower);

            sdsSingleStrengthEndurTest.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            dvSingleStrengthEndur = (DataView)sdsSingleStrengthEndurTest.Select(DataSourceSelectArguments.Empty);
            gvSingleStrengthEndur = new GridView();
            gvSingleStrengthEndur.DataSource = dvSingleStrengthEndur;
            gvSingleStrengthEndur.DataBind();
            e.Row.Cells[8].Controls.Add(gvSingleStrengthEndur);
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("Default.aspx", false);
    }

    protected void btnDataEntry_Click(object sender, EventArgs e) { Response.Redirect("ClientInfo.aspx", false); }

    protected void btnEditUser_Click(object sender, EventArgs e) { Response.Redirect("AdminMenu.aspx", false); }

    protected void btnReports_Click(object sender, EventArgs e) { Response.Redirect("Report.aspx", false); }

}