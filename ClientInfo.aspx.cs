using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class TEAM_PROJECT_DataEntry : System.Web.UI.Page
{
    string dateTime = Convert.ToString(DateTime.Now);
    string date;

    string firstInitial, lastInitial;

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    int numRowsAffected;

    Boolean isAllInfo = false;
    int maxID = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd.Connection = con;

        if (!IsPostBack)
        {

        }

        //Generate next participant ID
        //Generate next number for Participant ID
        cmd.CommandText = "SELECT ParticipantID FROM UserProfile ORDER BY ParticipantID DESC";
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        maxID = Convert.ToInt32(reader[0]); //gets max value
        maxID++; // max value + 1
        Session["participantID"] = maxID;

        //Cuts last 11 characters of dateTime string. HH:MM:SS PM
        date = dateTime.Substring(0, dateTime.Length - 11);
        txtStartDate.Text = Convert.ToString(date);
        
        //Adds session variables from Vitals Page
        txtID.Text = Convert.ToString(Session["participantID"]);
        if (Convert.ToInt32(Session["permission"]) == 1 || Convert.ToInt32(Session["permission"]) == 2)
        {
            txtID.ReadOnly = true;
        }

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
            Response.Redirect("MainMenu.aspx", false);
            btnEditUser.Visible = false;
            btnDataEntry.Visible = false;
        }
        con.Close();
    }

    protected void btnClientInfo_Click(object sender, EventArgs e)
    {
        //Testing inputs
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your initials.');</script>"); }
        if (txtFirstName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your first name.');</script>"); }
        else if (txtLastName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your last name.');</script>"); }
        else if (txtPhoneNum.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your phone number.');</script>"); }
        else if (txtEmail.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your email.');</script>"); }
        else if (txtEmergConName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your emergency contact name.');</script>"); }
        else if (txtEmergConNum.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your emergency contact number.');</script>"); }
        else if (ddlSport.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please select a sport.');</script>"); }
        else if (rdblGender.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please select a gender.');</script>"); }
        else if (txtStartDate.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your start date.');</script>"); }
        else
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted.');</script>");
            //isAllInfo = true;
        } 
        //Response.Write(isAllInfo);

        //Begin Connection and insert
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO UserProfile (ParticipantID,FirstName,LastName,Suffix,Phone,Email,EmergConName,EmergConNum,Sport,Username,gender,StartDate) " +
            "VALUES (" +
            txtID.Text + ",'" +
            txtFirstName.Text + "','" +
            txtLastName.Text + "','" +
            txtSuffix.Text + "','" +
            txtPhoneNum.Text + "','" +
            txtEmail.Text + "','" +
            txtEmergConName.Text + "','" +
            txtEmergConNum.Text + "','" +
            ddlSport.Text + "','" +
            Convert.ToString(Session["username"]) + "','" +
            rdblGender.Text + "','" +
            txtStartDate.Text + "');";
        try
        {
            numRowsAffected = cmd.ExecuteNonQuery();
            if (numRowsAffected == 1)
            {
                Response.Write("I think it worked");
            }
            else
            {
                Response.Write("It no work");
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }

        //Create initials session
        //if (txtFirstName.Text.Equals("") || txtLastName.Text.Equals(""))
        //{

        //}
        //else
        //{
        //    String sFirst = txtFirstName.Text;
        //    String sLast = txtLastName.Text;
        //    firstInitial = Convert.ToString(sFirst[0]);
        //    lastInitial = Convert.ToString(sLast[0]);
        //    Session["initials"] = firstInitial + lastInitial;
        //}

        con.Close();
        Response.Write(@"<script langauge='text/javascript'>alert('Client Info has been added. Navigating to vital information.');</script>");
        Response.Redirect("Vitals.aspx", false);
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        da = new SqlDataAdapter("SELECT * FROM UserProfile WHERE LastName LIKE '" + txtSearchLastName.Text + "%'", con);
        dt = new DataTable();
        da.Fill(dt);
        gvSearch.DataSource = dt;
        gvSearch.DataBind();
        con.Close();
    }

    protected void ddlSport_DataBound(object sender, EventArgs e)
    {
        ddlSport.SelectedValue = "none";
    }

    protected void ddlSport_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(gvSearch.SelectedValue);
        string first, last;
        String sFirst = txtFirstName.Text;
        String sLast = txtLastName.Text;

        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();

        cmd.CommandText = "SELECT FirstName,LastName FROM UserProfile";
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        first = Convert.ToString(reader[0]); //gets first name
        last = Convert.ToString(reader[1]); //gets last name
        firstInitial = Convert.ToString(first[0]);
        lastInitial = Convert.ToString(last[0]);

        //Session["initials"] = firstInitial + lastInitial;
        //Response.Write(firstInitial + lastInitial);

        //Response.Write(id);
        Session["participantID"] = id;
        Response.Redirect("Vitals.aspx");
    }

    protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        da = new SqlDataAdapter("SELECT * FROM UserProfile WHERE LastName LIKE '" + txtSearchLastName.Text + "%'", con);
        dt = new DataTable();
        da.Fill(dt);
        gvSearch.DataSource = dt;
        gvSearch.PageIndex = e.NewPageIndex;
        gvSearch.DataBind();
        con.Close();
    }
}
