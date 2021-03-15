<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpReqDetails.aspx.cs" Inherits="Vacation_Req.EmpReqDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <h2><%: Title %>.</h2>
    <br />
    
        <div>
    <p class="high-lighted">
<label style="font-weight:900;">Submition Date :</label> <asp:Label ID="Submitionday" runat="server" CssClass="form-control input-sm" Width="150" ></asp:Label> 
</p>
    <div class="clear-l2"></div>
            </div>
        <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Employee Name :</label> 
<asp:Label runat="server" ID="EmpFullName" CssClass="form-control input-sm" Width="150" placeholder="Full Name"></asp:Label>

</p>
<div class="clear-l2"></div>
        </div>
    <div class="from-group"> 

<p class="high-lighted">
<label style="font-weight:900;">Title :</label> 
<asp:Label runat="server" ID="Jobtitle" CssClass="form-control input-sm" Width="150" placeholder="Job Title"></asp:Label>
</p>

    <div class="clear-l2"></div>
    </div>

    <div class="from-group"> 

<p class="high-lighted">
<label style="font-weight:900;">Department :</label> 
 <asp:Label runat="server" CssClass="form-control input-sm" ID="ddlDepartment" Width="150" ></asp:Label>

</p>

    <div class="clear-l2"></div>
    </div>

    <div class="from-group"> 
<p class="high-lighted">
<label style="font-weight:900;">Vacation Date From :</label> 
<asp:Label runat="server" ID="DateFrom"   AutoPostBack="True" OnTextChanged="NumberOfDays"  CssClass="form-control input-sm" Width="150" ></asp:Label>

</p>

 <div class="clear-l2"></div>
    </div>
  
    <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Vacation Date To :</label> 
<asp:Label runat="server" ID="DateTo"     CssClass="form-control input-sm" Width="150" ></asp:Label>
</p>

     <div class="clear-l2"></div>

    </div>
  
    <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Returning Date :</label> 
<asp:Label runat="server" ID="ReturningDate"   CssClass="form-control input-sm" Width="150" ></asp:Label>

</p>
  
     <div class="clear-l2"></div>
    </div>



     <p class="high-lighted">
<label style="font-weight:900;">Total Number of days :</label> <asp:Label ID="TotalDays" CssClass="form-control input-sm" runat="server" Width="150" style="font-weight:900;"></asp:Label>
</p>
    
<div class="from-group"> 

<div style="font-weight:900;" class="question-row-odd pad-top-bottom question-container">
Notes : 
<div class="clear-l1"></div>
<asp:Label runat="server" ID="txtNotes" CssClass="form-control input-sm"  Width="400" TextMode="MultiLine" ></asp:Label>
</div>
</div>


            <asp:Button runat ="server" class="btn btn-primary" ID="BackBtn" Text="Back"   OnClick="BackBtnclk" ></asp:Button>




</asp:Content>
