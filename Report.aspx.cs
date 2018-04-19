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
    DataView dv;
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

            // Get the Exercise Categories and load them into the DropDownList
            //ddlExercise.DataSource = sdsExercise;
            //ddlExercise.DataTextField = "Exercise";
            //ddlExercise.DataValueField = "Exercise";
            //ddlExercise.DataBind();
            //ddlExercise.Items.Insert(0, new ListItem("all", "%"));
                       

        } // end of if
        //SqlDataSource s = (SqlDataSource)FindControl("sdsDateAerobicTest");
        //Response.Write(s.SelectCommand);
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
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsGenderAerobicTest");
            GridView gv = (GridView)e.Row.FindControl("gvMultipleGenderAerobic");
            s.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv.DataSource = s;
            gv.DataBind();

            SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsGenderAnaerobicTest");
            GridView gv2 = (GridView)e.Row.FindControl("gvMultipleGenderAnaerobic");
            s2.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv2.DataSource = s2;
            gv2.DataBind();

            SqlDataSource s3 = (SqlDataSource)e.Row.FindControl("sdsGenderBodyCompTest");
            GridView gv3 = (GridView)e.Row.FindControl("gvMultipleGenderBodyComp");
            s3.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv3.DataSource = s3;
            gv3.DataBind();

            SqlDataSource s4 = (SqlDataSource)e.Row.FindControl("sdsGenderFlexibilityTest");
            GridView gv4 = (GridView)e.Row.FindControl("gvMultipleGenderFlexibility");
            s4.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv4.DataSource = s4;
            gv4.DataBind();

            SqlDataSource s5 = (SqlDataSource)e.Row.FindControl("sdsGenderPowerTest");
            GridView gv5 = (GridView)e.Row.FindControl("gvMultipleGenderPower");
            s5.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv5.DataSource = s5;
            gv5.DataBind();

            SqlDataSource s6 = (SqlDataSource)e.Row.FindControl("sdsGenderStrengthEndurTest");
            GridView gv6 = (GridView)e.Row.FindControl("gvMultipleGenderStrengthEndur");
            s6.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv6.DataSource = s6;
            gv6.DataBind();
        }
    }

    protected void gvMultipleDate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsDateAnaerobicTest");
            GridView gv = (GridView)e.Row.FindControl("gvMultipleDateAnaerobic");
            s.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv.DataSource = s;
            gv.DataBind();


            SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsDateAnaerobicTest");
            GridView gv2 = (GridView)e.Row.FindControl("gvMultipleDateAnaerobic");
            s2.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv2.DataSource = s2;
            gv2.DataBind();

            SqlDataSource s3 = (SqlDataSource)e.Row.FindControl("sdsDateBodyCompTest");
            GridView gv3 = (GridView)e.Row.FindControl("gvMultipleDateBodyComp");
            s3.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv3.DataSource = s3;
            gv3.DataBind();

            SqlDataSource s4 = (SqlDataSource)e.Row.FindControl("sdsDateFlexibilityTest");
            GridView gv4 = (GridView)e.Row.FindControl("gvMultipleDateFlexibility");
            s4.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv4.DataSource = s4;
            gv4.DataBind();

            SqlDataSource s5 = (SqlDataSource)e.Row.FindControl("sdsDatePowerTest");
            GridView gv5 = (GridView)e.Row.FindControl("gvMultipleDatePower");
            s5.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv5.DataSource = s5;
            gv5.DataBind();

            SqlDataSource s6 = (SqlDataSource)e.Row.FindControl("sdsDateStrengthEndurTest");
            GridView gv6 = (GridView)e.Row.FindControl("gvMultipleDateStrengthEndur");
            s6.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv6.DataSource = s6;
            gv6.DataBind();
        }
    }

    protected void gvSingle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsSingleAerobicTest");
            GridView gv = (GridView)e.Row.FindControl("gvSingleAerobic");
            s.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv.DataSource = s;
            gv.DataBind();

            SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsSingleAnaerobicTest");
            GridView gv2 = (GridView)e.Row.FindControl("gvSingleAnaerobic");
            s2.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv2.DataSource = s2;
            gv2.DataBind();

            SqlDataSource s3 = (SqlDataSource)e.Row.FindControl("sdsSingleBodyCompTest");
            GridView gv3 = (GridView)e.Row.FindControl("gvSingleBodyComp");
            s3.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv3.DataSource = s3;
            gv3.DataBind();

            SqlDataSource s4 = (SqlDataSource)e.Row.FindControl("sdsSingleFlexibilityTest");
            GridView gv4 = (GridView)e.Row.FindControl("gvSingleFlexibility");
            s4.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv4.DataSource = s4;
            gv4.DataBind();

            SqlDataSource s5 = (SqlDataSource)e.Row.FindControl("sdsSinglePowerTest");
            GridView gv5 = (GridView)e.Row.FindControl("gvSinglePower");
            s5.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv5.DataSource = s5;
            gv5.DataBind();

            SqlDataSource s6 = (SqlDataSource)e.Row.FindControl("sdsSingleStrengthEndurTest");
            GridView gv6 = (GridView)e.Row.FindControl("gvSingleStrengthEndur");
            s6.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv6.DataSource = s6;
            gv6.DataBind();
        }
    }

}