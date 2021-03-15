using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vacation_Req
{
    public partial class EmpReqDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID;
            ID = Request.QueryString["identifier"];

            GettingData(ID);




        }

        protected void GettingData(string EmpID)
        {
            long valEmpID;
            if (EmpID != null)
            {
                valEmpID = long.Parse(EmpID);

                View_allData alldbReq = new View_allData();

                using (var DB = new Requests_DBEntities())
                {

                    alldbReq = DB.View_allData.Where(x => x.Emp_ID == valEmpID).FirstOrDefault();



                }
                if (alldbReq != null)
                { string SubDate = alldbReq.DateOfSub.ToString();
                    //= alldbReq.Emp_Name;
                    TotalDays.Text = alldbReq.TotalDays.ToString();
                    Submitionday.Text = SubDate.Substring(0, 10);
                    EmpFullName.Text = alldbReq.Emp_Name;
                    Jobtitle.Text = alldbReq.Emp_Title;
                    ddlDepartment.Text = alldbReq.Dep_Name;
                    DateTo.Text = alldbReq.Date_To.ToShortDateString();
                    DateFrom.Text = alldbReq.Date_From.ToShortDateString();
                    ReturningDate.Text = alldbReq.Returning_Date.ToShortDateString();
                    txtNotes.Text = alldbReq.Notes;



                }
            }
        }
        protected void BackBtnclk(object sender, EventArgs e)
        {

            Response.Redirect("VacReqGrid.aspx");
        }
    }
}