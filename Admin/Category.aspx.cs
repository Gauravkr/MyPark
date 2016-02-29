using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Category : System.Web.UI.Page
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
        if (txtcategory.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Fill Up All Details');", true);
            txtcategory.Text = "";
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("select * from Admin_Category where Category='" + txtcategory.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            da.Fill(ds, "Admin_Category");
            if (ds.Tables["Admin_Category"].Rows.Count > 0)
            {

                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert(' Already Exit ');", true);

            }
            else
            {
                string s = txtcategory.Text;
                s = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(s.ToLower());
                txtcategory.Text = s.ToString();

                SqlCommand cmd = new SqlCommand("insert into Admin_Category(Category)values(@Category)", con);
                cmd.Parameters.AddWithValue("@Category", txtcategory.Text);
                cmd.ExecuteNonQuery();
                txtcategory.Text = "";

                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert(' Date Insert Successfully ');", true);
                GridView1.DataBind();
                con.Close();
            }
        }
    }
}