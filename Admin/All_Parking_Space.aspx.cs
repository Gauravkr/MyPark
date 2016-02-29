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
using System.Web.Services;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

public partial class Admin_All_Parking_Space : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "app")
        {
            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
            cn.Open();
            string cde = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand("Select * from Admin_Rent_Space where Id='" + cde + "'", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count == 1)
            {

                SqlCommand cmd2 = new SqlCommand("update Admin_Rent_Space SET Approved=@Approved  where Id='" + cde + "'", cn);
                cmd2.Parameters.AddWithValue("@Approved", "1");
                cmd2.ExecuteNonQuery();
                GridView1.DataBind();
            }
        }
        else if (e.CommandName == "Not")
        {
            {
                if (cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }
                cn.Open();
                string cded = e.CommandArgument.ToString();
                SqlCommand cmd1 = new SqlCommand("Select * from Admin_Rent_Space where Id='" + cded + "'", cn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count == 1)
                {

                    SqlCommand cmd2 = new SqlCommand("update Admin_Rent_Space SET Approved=@Approved  where Id='" + cded + "'", cn);
                    cmd2.Parameters.AddWithValue("@Approved", "0");
                    cmd2.ExecuteNonQuery();
                    GridView1.DataBind();
                }


            }
        }
    }
}