using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class Admin_Add_State : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from Admin_State where State_Name=@State_Name", sconn);
        cmd1.Parameters.AddWithValue("State_Name", txtstate.Text);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('State Alredy Exit')", true);

        }
        else
        {

            SqlCommand cmd = new SqlCommand("insert into Admin_State(State_Name) values(@State_Name)", sconn);
            cmd.Parameters.AddWithValue("@State_Name", txtstate.Text);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Data Insert')", true);
            txtstate.Text = "";
            GridView1.DataBind();

        }
    }
}