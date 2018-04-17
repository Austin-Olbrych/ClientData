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

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    int numRowsAffected;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Cuts last 12 characters of dateTime string. HH:MM:SS PM
        date = dateTime.Substring(0, dateTime.Length - 12);
        txtStartDate.Text = Convert.ToString(date);
        
        //Sets lbl in top left with users first and last name
        lblUser.Text = Convert.ToString(Session["lastName"] + ", " + Session["FirstName"]);
        
        //Adds session variables from Vitals Page
        txtID.Text = Convert.ToString(Session["participantID"]);
        txtID.ReadOnly = true;
    }

    protected void btnClientInfo_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO UserProfile (ParticipantID,FirstName,LastName,Suffix,Phone,Email,EmergConName,EmergConNum) " +
            "VALUES (" + 
            txtID.Text + ",'" +
            txtFirstName.Text + "','" +
            txtLastName.Text + "','" +
            txtSuffix.Text + "','" +
            txtPhoneNum.Text + "','" +
            txtEmail.Text + "','" +
            txtEmergConName.Text + "','" +
            txtEmergConNum.Text + "');";
        //Insert
        try
        {
            Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
            numRowsAffected = cmd.ExecuteNonQuery();
            if (numRowsAffected == 1)
            {
                Response.Write(@"<script langauge='text/javascript'>alert('DATA WAS ADDED. CHECK DATABASE');</script>");
            }
            else
            {
                Response.Write(@"<script langauge='text/javascript'>alert('DATA NOT INSERTED');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();
        //Response.Write(@"<script langauge='text/javascript'>alert('Client Info has been added. Navigating to vital information.');</script>");
        //Response.Redirect("Vitals.aspx", false);

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtFirstName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your first name.');</script>"); }
        else if (txtLastName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your last name.');</script>"); }
        else if (txtPhoneNum.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your phone number.');</script>"); }
        else if (txtEmail.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your email.');</script>"); }
        else if (txtEmergConName.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your emergency contact.');</script>"); }
        else if (txtEmergConNum.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter your emergency contact number.');</script>"); }
        else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        con.Close();
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx", false);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT ParticipantID, FirstName, LastName, Suffix FROM UserProfile WHERE " +
            txtFirstName.Text + "','" +
            txtLastName.Text + "','" +
            txtID.Text + "');";
        //Insert
        try
        {
            Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
            numRowsAffected = cmd.ExecuteNonQuery();
            if (numRowsAffected == 1)
            {
                Response.Write(@"<script langauge='text/javascript'>alert('DATA WAS ADDED. CHECK DATABASE');</script>");
            }
            else
            {
                Response.Write(@"<script langauge='text/javascript'>alert('DATA NOT INSERTED');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }
    }
}