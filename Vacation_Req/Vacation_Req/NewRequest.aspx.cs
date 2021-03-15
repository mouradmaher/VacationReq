using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Vacation_Req
{
    public partial class Contact : Page
    {
        private bool buttonSubWasClicked = false;

        Boolean valerror;
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
            if (!this.IsPostBack)
            {

                string today = DateTime.Now.ToShortDateString();
                Today.Text = today;
                TotalDays.Text = "0 days";

                FillDepartmentddl();
                ResetValidation();

            }
            else 
            {

                ResetValidation();
               // FormValidation();
              

            }
            

        }
        public void SubButton_Click(object sender, EventArgs e)
        {
            buttonSubWasClicked = true;


            ResetValidation();
            //btnSubmit.Click += new EventHandler(this.buttonSubWasClicked=true);

            if (!FormValidation())
            {
                // sending to DB
                if (buttonSubWasClicked)
                {
                    CreateEmp();
                }

            }

        }
        public Boolean FormValidation()
        {
           valerror = false;

            if (ddlDepartment.Text == "--Select--")
            {
                this.ErrorDep.Visible = true;
                valerror = true;
            }
            if (this.EmpFullName.Text == "")
            {
                this.ErrorName.Visible = true;
                valerror = true;

            }
            if (this.Jobtitle.Text == "")
            {
                this.ErrorTitle.Visible = true;
                valerror = true;


            }
            if (this.DateTo.Text == "")
            {
                this.ErrorToDate.Visible = true;
                valerror = true;

            }

            if (this.DateFrom.Text == "")
            {
                this.ErrorFromDate.Visible = true;
                valerror = true;

            }
            if (this.ReturningDate.Text == "")
            {
                this.ErrorReturnDate.Visible = true;
                valerror = true;


            }
            return valerror;

        }
        public void FillDepartmentddl()
        {
            

            using (Requests_DBEntities reqDB = new Requests_DBEntities())
            {
                var depp = from c in reqDB.DepartmentTBs select new { c.Dep_ID, c.Dep_Name };
                
                ddlDepartment.DataSource = depp.ToList();
                ddlDepartment.DataValueField = "Dep_ID";
                ddlDepartment.DataTextField = "Dep_Name";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, "--Select--");



            }


        }
        public void CreateEmp ()
        {
            long EmpID;
            using (Requests_DBEntities reqDB = new Requests_DBEntities())
            {
                EmployeeTB emp = new EmployeeTB
                {
                    Emp_Name = EmpFullName.Text,
                    Dep_ID = ddlDepartment.SelectedIndex,
                    Emp_Title = Jobtitle.Text




                };

                reqDB.EmployeeTBs.Add(emp);
                reqDB.SaveChanges();
                EmpID = emp.Emp_ID;

            }


            SaveToDB(EmpID);
        }
            public void SaveToDB(long EmpID)
        {
           

            using (Requests_DBEntities reqDB = new Requests_DBEntities())
            {
                DateTime d_to = Convert.ToDateTime(DateTo.Text);
                DateTime d_from = Convert.ToDateTime(DateFrom.Text);

                TimeSpan ts = d_to - d_from;
                int daysNum = ts.Days;

                RequestsTB rqts = new RequestsTB
                {
                    DateOfSub = DateTime.Now.Date,
                    Notes = txtNotes.Text,
                    Returning_Date = Convert.ToDateTime(ReturningDate.Text),
                    Date_From = Convert.ToDateTime(DateFrom.Text),
                    Date_To = Convert.ToDateTime(DateTo.Text),
                    TotalDays = daysNum,
                    Emp_ID = EmpID


                };

                reqDB.RequestsTBs.Add(rqts);
               reqDB.SaveChanges();


            }

            Response.Redirect("Default.aspx");



        }

        protected void BackBtnclk(object sender, EventArgs e)
        {

            Response.Redirect("Default.aspx");
        }



        public void ResetValidation()
        {
            this.ErrorDep.Visible = false;
            this.ErrorName.Visible = false;
            this.ErrorTitle.Visible = false;
            this.ErrorToDate.Visible = false;
            this.ErrorFromDate.Visible = false;
            this.ErrorReturnDate.Visible = false;
            this.LessFromError.Visible = false;
            this.ToFromError.Visible = false;
            this.TO_return.Visible = false;

        }

        public void DateFromVal()
        {
            DateTime today = DateTime.Now.Date;

            this.LessFromError.Visible = false;

            DateTime d_from = Convert.ToDateTime(DateFrom.Text);

            TimeSpan ts = d_from - today;

            if (ts.Days<0) {
                this.LessFromError.Visible = true;

            }


        }

        public void DateTOVal()
        {
            DateTime returndate = Convert.ToDateTime(ReturningDate.Text);
            DateTime d_to = Convert.ToDateTime(DateTo.Text);
            this.TO_return.Visible = false;

            TimeSpan ts =  returndate - d_to;

            if (ts.Days < 0)
            {
                this.TO_return.Visible = true;

            }

        }
            public void NumberOfDays(object sender, EventArgs e)
        {
            try
            {
                if (DateTo.Text!="" && DateFrom.Text!="") {
                    this.ToFromError.Visible = false;

                    DateTime d_to = Convert.ToDateTime(DateTo.Text);
                    DateTime d_from = Convert.ToDateTime(DateFrom.Text);

                    TimeSpan ts = d_to - d_from;
                  int daysNum = ts.Days;

                    if (daysNum < 0) {
                        TotalDays.Text = "0 days";

                        this.ToFromError.Visible = true;
                        valerror = true;
                    }
                    else
                    {
                        TotalDays.Text = daysNum.ToString() + " days";

                    }
                }
                if (DateTo.Text != "" && ReturningDate.Text !="" )
                {
                    DateTOVal();

                }


                if (DateFrom.Text != "") {
                    DateFromVal();
                }


            }

            catch
            {


            }
           
        }

    }
}