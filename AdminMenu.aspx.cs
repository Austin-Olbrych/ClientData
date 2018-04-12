using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;  // for ConfigurationManager
using System.Data.SqlClient; // for SqlConnection, SqlCommand, and SqlDataReader
using System.Data;
public partial class AdminMenu : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataReader dr;
    string connectionString;
    ListItem listItem;
    int numRowsAffected;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         
        }
    }
    
   
    protected void btnInput_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(getConnectionString());
        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO UserData (FirstName, LastName, Permission, Username, Password, Email, PhoneNum) VALUES ('"
            + txtFirst.Text + "','" + txtLast.Text + "','" + txtPermission .Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "')";
        try
        {
            numRowsAffected = cmd.ExecuteNonQuery();
            if (numRowsAffected == 1)
            {
                lblStatus.Text = "Inserted OK";
                sdsUserName.Insert();
                txtFirst.Text = "";
                txtLast.Text = "";
                txtPermission.Text = "";
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
            }
            else
            {
                lblStatus.Text = "Not inserted";
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Not Inserted1";
        }

        conn.Close();
        
    }
    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ClientData"].ConnectionString;
    } // end of getConnectionString

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to delete. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Delete failed. Someone else changed or deleted this major.";
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.SelectedIndex = -1;
    }

    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to update. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Update failed. Someone else changed or deleted this user.";
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView1.SelectedIndex = -1;
    }

    protected void sdsUserName_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to delete. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Delete failed. Someone else changed or deleted this user.";
        }
    }
}
