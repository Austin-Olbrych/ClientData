using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    string dateTime = Convert.ToString(DateTime.Now);
    string date;

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    int numRowsAffected;

    int max = 1;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        //Cuts last 12 characters of dateTime string. HH:MM:SS PM
        date = dateTime.Substring(0, dateTime.Length - 11);
        txtStartDate.Text = Convert.ToString(date);

        //Sets participantID to next number in the list
        txtID.Text = Convert.ToString(Session["participantID"]);
        txtID.ReadOnly = true;

        //Set username to user doing the edit
        txtUsername.Text = Convert.ToString(Session["username"]);
        if (Convert.ToInt32(Session["permission"]) == 1 || Convert.ToInt32(Session["permission"]) == 2)
        {
            txtUsername.ReadOnly = true;
        }

        //Set Initials
        //txtInitials.Text = Convert.ToString(Session["initials"]);

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
    }
    protected void btnVitals_Click(object sender, EventArgs e)
    {
        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        //if (txtInitials.Text.Equals("")){Response.Write(@"<script langauge='text/javascript'>alert('Please enter your initials.');</script>"); }
        if (txtAge.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your age.');</script>"); }
        else if (txtRace.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your race.');</script>"); }
        else if (txtHeight.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your height.');</script>"); }
        else if (txtMass.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your mass.');</script>"); }
        else if (txtBloodGlucose.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your blood glucose.');</script>"); }
        else if (txtRMR.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your RMR.');</script>"); }
        else if (txtBloodPressTop.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your blood pressure.');</script>"); }
        else if (txtBloodPressBottom.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your blood pressure.');</script>"); }
        else if (txtHeartRate.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your heart rate.');</script>"); }
        else if (txtUsername.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your username.');</script>"); }
        else
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Client Info page');</script>");
        }

        //Bind bloodPressureTop with bloodPressureBottom
        string bloodPressureFinal = txtBloodPressTop.Text + "/" + txtBloodPressBottom.Text;
        //Response.Write(bloodPressureFinal);

        //Begin Connection and insert
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Vitals (ParticipantID,EntryDate,Initials,Age,Race,Height,Mass,BloodGlucose,RMR,BloodPress,HeartRate,Username) " +
            "VALUES (" +
            txtID.Text + ",'" +
            txtStartDate.Text + "','" +
            txtInitials.Text + "','" +
            txtAge.Text + "','" +
            txtRace.Text + "','" +
            txtHeight.Text + "','" +
            txtMass.Text + "','" +
            txtBloodGlucose.Text + "','" +
            txtRMR.Text + "','" +
            bloodPressureFinal + "','" +
            txtHeartRate.Text + "','" +
            Convert.ToString(Session["username"]) + "');";
        try
        {
            numRowsAffected = cmd.ExecuteNonQuery();
            if (numRowsAffected == 1)
            {
                //Response.Write("I think it worked");
            }
            else
            {
                //Response.Write("It no work");
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
        }

        con.Close();
        Response.Write(@"<script langauge='text/javascript'>alert('Vital Info has been added. Navigating to exercise page.');</script>");
        Response.Redirect("Exercise.aspx", false);
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