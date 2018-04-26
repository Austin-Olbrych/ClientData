using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class ExerciseTest : System.Web.UI.Page
{
    string dateTime = Convert.ToString(DateTime.Now);

    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd2 = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    int numRowsAffected;

    int ID = 0;
    int mass = 0;
    ArrayList list = new ArrayList();
    int totalRows = 0;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        //Sets txt in top left with the participantID
        txtEParticipantID.Text = Convert.ToString(Session["participantID"]);
        //txtEParticipantID.Text = Convert.ToString(1);
        txtEParticipantID.ReadOnly = true;
        ID = Convert.ToInt32(Session["participantID"]);
        
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;

        //Adds session variables from Vitals Page
        txtEParticipantID.Text = Convert.ToString(Session["participantID"]);
        if (Convert.ToInt32(Session["permission"]) == 1 || Convert.ToInt32(Session["permission"]) == 2)
        {
            txtEParticipantID.ReadOnly = true;
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

        cmd.CommandType = CommandType.Text;

        string massString = "SELECT Mass FROM Vitals WHERE ParticipantID = " +
                            ID + " AND EntryDate IN(SELECT MAX(EntryDate) FROM Vitals);";

        cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = massString;
        mass = Convert.ToInt32(cmd2.ExecuteScalar());

        con.Close();

    }

    protected void btnAerobic_Click(object sender, EventArgs e)
    {

        string massString = "SELECT Mass FROM Vitals WHERE ParticipantID = " +
                            ID + " AND EntryDate IN(SELECT MAX(EntryDate) FROM Vitals);";
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();

        cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = massString;
        mass = Convert.ToInt32(cmd2.ExecuteScalar());

        cmd = new SqlCommand();        
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO AerobicTest VALUES (" +
            txtEParticipantID.Text + "," +
            "'Aerobic'," +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtVOsmax.Text + "," +
            (Convert.ToInt32(txtVOsmax.Text) * mass) + "," +
            txtMVOsmax.Text + "," +
            (Convert.ToInt32(txtMVOsmax.Text) * mass) + "," +
            txtRMR.Text + "," +
            (Convert.ToInt32(txtRMR.Text) * mass) + "," +
            txtCaloric.Text + ");";

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtVOsmax.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the VOSmax.');</script>"); }
        else if (txtMVOsmax.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the MVOSmax.');</script>"); }
        else if (txtRMR.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the RMR.');</script>"); }
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }
    }

    protected void btnAnaerobic_Click(object sender, EventArgs e)
    {

        string massString = "SELECT Mass FROM Vitals WHERE ParticipantID = " +
                            ID + " AND EntryDate IN(SELECT MAX(EntryDate) FROM Vitals);";

        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();

        cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = massString;
        mass = Convert.ToInt32(cmd2.ExecuteScalar());

        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO AnaerobicTest VALUES (" +
            txtEParticipantID.Text + "," +
            "'Anaerobic'," +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtWingatePeak.Text + "," +
            (Convert.ToInt32(txtWingatePeak.Text) * mass) + "," +
            txtWingateMean.Text + "," +
            (Convert.ToInt32(txtWingateMean.Text) * mass) + "," +
            txtWingateMin.Text + "," +
            (Convert.ToInt32(txtWingateMin.Text) * mass) + "," +
            txtWingateFatique.Text + ");";

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtWingatePeak.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter wingate peak power.');</script>"); }
        else if (txtWingateMean.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter wingate mean power.');</script>"); }
        else if (txtWingateMin.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the wingate minimum power.');</script>"); }
        else if (txtWingateFatique.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the wingate fatique index.');</script>"); }
        else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }
    }

    protected void btnPower_Click(object sender, EventArgs e)
    {

        string massString = "SELECT Mass FROM Vitals WHERE ParticipantID = " +
                            ID + " AND EntryDate IN(SELECT MAX(EntryDate) FROM Vitals);";


        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();

        cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = massString;
        mass = Convert.ToInt32(cmd2.ExecuteScalar());

        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO PowerTest VALUES (" +
            txtEParticipantID.Text + "," +
            "'PowerTest'," +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtVertical.Text + "," +
            (Convert.ToInt32(txtVertical.Text) * mass) + "," +
            txtMargaria.Text + "," +
            (Convert.ToInt32(txtMargaria.Text) * mass) + ");";

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtVertical.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the vertical.');</script>"); }
        else if (txtMargaria.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the margaria-kalamen power.');</script>"); }
        else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }
    }

    protected void btnStrength_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO StrengthEndur VALUES (" +
            txtEParticipantID.Text + "," +
            "'Strength'," +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtBench.Text + "," +
            txtPull.Text + "," +
            txtPush.Text + "," +
            txtPCurl.Text + "," +
            txtDips.Text + "," +
            txtRMBench.Text + "," +
            (Convert.ToInt32(txtRMBench.Text) * mass) + "," +
            txtRMSquat.Text + "," +
            (Convert.ToInt32(txtRMSquat.Text) * mass) + ");";

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtBench.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the bench press.');</script>"); }
        else if (txtPull.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the pull ups.');</script>"); }
        else if (txtVertical.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the vertical.');</script>"); }
        //else if (txtVertical.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the vertical.');</script>"); }
        //else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }
    }

    protected void btnFlexibility_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO FlexibilityTest VALUES (" +
            txtEParticipantID.Text + "," +
            "'Flexibility', " +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtTSAR.Text + "," +
            txtMSAR.Text + "," +
            txtYSAR.Text + ");";

        //Enter Try Catch

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Enter Alerts
    }

    protected void btnBodyComp_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO BodyCompTest VALUES (" +
            txtEParticipantID.Text + "," +
            "'Body Composition'," +
            DateTime.Now.ToString("yyyy-MM-dd") + "," +
            txtSkinFoldP.Text + "," +
            txtSkinFoldS.Text + "," +
            txtSkinFoldB.Text + "," +
            txtWHRatio.Text + "," +
            txtWCircumf.Text + "," +
            txtBMI.Text + "," +
            txtBIA.Text + "," +
            txtBodPod.Text + ");";

        //Enter Try Catch

        try
        {
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE TRY');</script>");
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
            //Response.Write(@"<script langauge='text/javascript'>alert('IN THE CATCH');</script>");
            Response.Write(ex.Message);
        }

        con.Close();

        //Enter Alerts
    }

    protected void ddlEDropDown_DataBound(object sender, EventArgs e)
    {
        //ddlEDropDown.SelectedValue = "Select and exercise";
    }
    protected void ddlEDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {

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
}