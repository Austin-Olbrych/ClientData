﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUser.Text = Convert.ToString(Session["lastName"] + ", " + Session["FirstName"]);
        //lblPerm.Text = Convert.ToString(Session["permission"]);
        if (Session["username"] != null)
        {
            //Response.Write("Username = " + Session["username"]);

        }
        else
        {
            Response.Redirect("Login.aspx", false);
        }
        //Determines Permissions
        if (Convert.ToString(Session["permission"]) == "0")
        {

        }
        if (Convert.ToString(Session["permission"]) == "1")
        {
            hlEditUser.Visible = false;
        }
        if (Convert.ToString(Session["permission"]) == "2")
        {
            hlEditUser.Visible = false;
            hlDataEntry.Visible = false;
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx",false);
    }

    protected void btnDataEntry_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientInfo.aspx", false);
        
    }
}