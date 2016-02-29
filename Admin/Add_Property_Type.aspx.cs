using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Add_Property_Type : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (txtspace.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Fill Up All Details');", true);
            txtspace.Text = "";
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("select * from Admin_Proprty where Proparty='" + txtspace.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            da.Fill(ds, "Admin_Proprty");
            if (ds.Tables["Admin_Proprty"].Rows.Count > 0)
            {

                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert(' Already Exit ');", true);

            }
            else
            {
                string s = txtspace.Text;
                s = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(s.ToLower());
                txtspace.Text = s.ToString();

                SqlCommand cmd = new SqlCommand("insert into Admin_Proprty(Proparty)values(@Proparty)", con);
                cmd.Parameters.AddWithValue("@Proparty", txtspace.Text);
                cmd.ExecuteNonQuery();
                txtspace.Text = "";

                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('  Insert Prperty Successfully ');", true);
                GridView1.DataBind();
                con.Close();
            }
        }
    }
}
