using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Vacation_Req
{
    public partial class About : Page
    {
       readonly string ConnectionString = @"data source=DESKTOP-BDQCJLE\SQLEXPRESS;initial catalog=Requests_DB;persist security info=True;user id=mo;password=123456;MultipleActiveResultSets=True;App=EntityFramework&quot;";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection ReqDB = new SqlConnection(ConnectionString))
            {
                
                   SqlDataAdapter sqldA = new SqlDataAdapter("SELECT [Dep_ID],[Emp_ID],[Dep_Name],[Emp_Name],[Date_From],[Date_To] ,[DateOfSub] FROM[Requests_DB].[dbo].[View_allData]", ReqDB);
               DataTable dt = new DataTable();
                sqldA.Fill(dt);

                gvrequests.DataSource = dt;
                gvrequests.DataBind();
            }

               
               
        }

        protected void View_Clicked(object sender, EventArgs e)
        {
            int Emp_ID = Convert.ToInt32((sender as LinkButton).CommandArgument);


            Response.Redirect("EmpReqDetails.aspx?identifier=" + Emp_ID + "");
        }

        protected void BackBtnclk(object sender, EventArgs e)
        {

            Response.Redirect("Default.aspx");
        }

    }

}



