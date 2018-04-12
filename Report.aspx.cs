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
    GridView gv;

    // This way gives a file name of C_Temp_States.xls
    // But it works.
    // Also, we can change it in the header in WriteTheFile method, and it still works
    string fileName = "C:/Temp/States.xls";

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
            ddlSport.DataSource = sdsSport;
            ddlSport.DataTextField = "Sport";
            ddlSport.DataValueField = "Sport";            
            ddlSport.DataBind();            
            ddlSport.Items.Insert(0, new ListItem("all", "%"));

            // Get the Exercise Categories and load them into the DropDownList
            ddlExercise.DataSource = sdsExercise;
            ddlExercise.DataTextField = "Exercise";
            ddlExercise.DataValueField = "Exercise";
            ddlExercise.DataBind();
            ddlExercise.Items.Insert(0, new ListItem("all", "%"));

            //gvMultiple.Visible = true;
            //gvMultipleSport.Visible = true;



        } // end of if
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

    protected void btnExportSingle_Click(object sender, EventArgs e)
    {
        StringWriter strWriter = new StringWriter();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(strWriter);
        //gvSingle.RenderControl(htmlWriter);
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
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsSportAnaerobicTest");
            GridView gv = (GridView)e.Row.FindControl("gvMultipleSportAnaerobic");
            s.SelectParameters["ID"].DefaultValue = e.Row.Cells[0].Text;
            gv.DataSource = s;
            gv.DataBind();
            /*
            s.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;
            dv = (DataView)s.Select(DataSourceSelectArguments.Empty);
            gv = new GridView();
            gv.DataSource = dv;
            gv.DataBind();
            e.Row.Cells[1].Controls.Add(gv);
            */
        }
    }

    protected void gvMultipleGender_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsGenderAnaerobicTest");
            s.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;

            //SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsAerobicTest");
            //s2.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;
        }
    }

    protected void gvMultipleDate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsDateAnaerobicTest");
            s.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;

            //SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsAerobicTest");
            //s2.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;
        }
    }

    protected void gvSingle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource s = (SqlDataSource)e.Row.FindControl("sdsSingleAnaerobicTest");
            s.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;

            //SqlDataSource s2 = (SqlDataSource)e.Row.FindControl("sdsAerobicTest");
            //s2.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;
        }
    }

}