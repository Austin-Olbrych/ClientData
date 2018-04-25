using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Exercises : System.Web.UI.Page
{
    string dateTime = Convert.ToString(DateTime.Now);

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    int numRowsAffected;

    int mass;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Sets txt in top left with the participantID
        txtEParticipantID.Text = Convert.ToString(Session["participantID"]);
        txtEParticipantID.ReadOnly = true;

        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT TOP 1 Mass FROM Vitals WHERE ParticipantID = " + txtEParticipantID + "ORDER BY EntryDate DESC";
        mass = ;
        con.Close();

    }

    protected void btnAerobic_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO AerobicTest VALUES (" +
            txtEParticipantID + "','" +
            lblAerobic + "','" +
            dateTime + "','" +
            txtVOsmax + "','" +
            (txtVOsmax * mass) + "','" +
            txtMVOsmax + "','" +
            (txtMVOsmax * mass) + "','" +
            txtRMR + "','" +
            (txtRMR * mass) + "','" +
            txtCaloric + "');";

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

        //Tests for data in textboxes
        //if (txtID.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter an ID number.');</script>"); } //Auto filled
        if (txtVOsmax.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the VOSmax.');</script>"); }
        else if (txtMVOsmax.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the MVOSmax.');</script>"); }
        else (txtRMR.Text.Equals("")) { Response.Write(@"<script langauge='text/javascript'>alert('Please enter the RMR.');</script>"); }
        {
            Response.Write(@"<script langauge='text/javascript'>alert('All your data was submitted. Now navigating to Exercise page');</script>");
        }
    }

    protected void btnAnaerobic_Click(object sender, EventArgs e)
    {
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO AnaerobicTest VALUES (" +
            txtEParticipantID + "','" +
            lblAnaerobic + "','" +
            dateTime + "','" +
            txtWingatePeak + "','" +
            (txtWingatePeak * mass) + "','" +
            txtWingateMean + "','" +
            (txtWingateMean * mass) + "','" +
            txtWingateMin + "','" +
            (txtWingateMin * mass) + "','" +
            txtWingateFatique + "');";

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
        //Begin Connection
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO PowerTest VALUES (" +
            txtEParticipantID + "','" +
            lblPower + "','" +
            dateTime + "','" +
            txtVertical + "','" +
            (txtVertical * mass) + "','" +
            txtMargaria + "','" +
            (txtMargaria * mass) + "');";

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
            txtEParticipantID + "','" +
            lblStrength + "','" +
            dateTime + "','" +
            txtBench + "','" +
            txtPull + "','" +
            txtPush + "','" +
            txtPCurl + "','" +
            txtDips + "','" +
            txtRMBench + "','" +
            (txtRMBench * mass) + "','" +
            txtRMSquat + "','" +
            (txtRMSquat * mass) + "');";

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
            txtEParticipantID + "','" +
            lblFlexibility + "','" +
            dateTime + "','" +
            txtTSAR + "','" +
            txtMSAR + "','" +
            txtYSAR + "');";
        
        //Enter Try Catch

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
            txtEParticipantID + "','" +
            lblBodyComp + "','" +
            dateTime + "','" +
            txtSkinFoldP + "','" +
            txtSkinFoldS + "','" +
            txtSkinFoldB + "','" +
            txtWHRatio + "','" +
            txtWCircumf + "','" +
            txtBMI + "','" +
            txtBIA + "','" +
            txtBodPod + "');";

        //Enter Try Catch

        con.Close();

        //Enter Alerts
    }
}