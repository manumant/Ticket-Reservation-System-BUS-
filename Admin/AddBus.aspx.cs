using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AddBus : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mainConn"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into tbl_bus(bus_no,bus_type,seat_capacity,bus_name,model_no,driverid,routeid)values(@bno,@btype,@seatcapacity,@bname,@modelno,@ddldriverid,@ddlrouteid)";
        cmd.Parameters.AddWithValue("@bno", txtbusno.Text);
        cmd.Parameters.AddWithValue("@btype", txtbustype.Text);
        cmd.Parameters.AddWithValue("@seatcapacity", txtseatcapacity.Text);
        cmd.Parameters.AddWithValue("@bname", txtbusname.Text);
        cmd.Parameters.AddWithValue("@modelno", txtmodelno.Text);
        cmd.Parameters.AddWithValue("@ddldriverid", ddldriverid.SelectedValue);
        cmd.Parameters.AddWithValue("@ddlrouteid", ddlrouteid.SelectedValue);
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        Response.Redirect("~/Admin/ManageBus.aspx");
    }
}