using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ClientData : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=silver.mountunion.edu;initial catalog=ClientData; " +
            "Persist Security Info=True; User ID=ClientData; Password=Helium39day";
        con.Open();
        //Response.Write("Username = " + Session["username"]);
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string perm = "-1";
        string username = "";
        string firstName = "";
        string lastName = "";

        cmd.CommandText = "SELECT * FROM UserData WHERE Username ='" + txtUsername.Text + 
            "'and Password='" + txtPassword.Text + "'"; //Select Username and password to login. Also pull permission to load correct session
        cmd.Connection = con;
        da.SelectCommand = cmd;
        da.Fill(ds,"UserData");

        if (ds.Tables[0].Rows.Count > 0)//Test if any rows username and password match. Search through the column and get permission
        {
            perm = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[2]);
            username = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[3]);
            firstName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[0]);
            lastName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[1]);


            //lblTest.Text = "Data is found";
            //lblPermTest.Text = "perm: " + perm;
            //lblUsernameTest.Text = "username: " + username;

            Session["permission"] = perm;
            Session["username"] = username;
            Session["firstName"] = firstName;
            Session["lastName"] = lastName;

            Response.Redirect("MainMenu.aspx", false);
            con.Close();
        }
        else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('Username or Password is incorrect.');</script>");

            //lblTest.Text = "Data is NOT found";
            //lblPermTest.Text = "perm: " + null;
            //lblUsernameTest.Text = "username: " + null;
        }
    }
}