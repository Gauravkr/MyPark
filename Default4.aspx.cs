using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

public partial class Default4 : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string ss, xxx, sss, sssss;
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate11();
    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "/" + dt.Month.ToString() + "/" + dt.Year.ToString();
        TextBox1.Text = sss;
        TextBox2.Text = sss;
        return sss;
    }

    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, "--Select Vehical Type--");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, "--Select Vehical Type--");
    }
}