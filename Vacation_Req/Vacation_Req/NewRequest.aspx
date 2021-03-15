<%@ Page Title="Add New Request" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewRequest.aspx.cs" Inherits="Vacation_Req.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <br />
    
        <div>
    <p class="high-lighted">
<label style="font-weight:900;">Submition Date :</label> <asp:Label ID="Today" runat="server" ></asp:Label> <label style="font-weight:900;">(Today)</label>
</p>
    <div class="clear-l2"></div>
            </div>
        <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Employee Name :</label> 
<asp:TextBox runat="server" ID="EmpFullName" CssClass="form-control input-sm" Width="150" placeholder="Full Name"></asp:TextBox>

</p>
<div class="clear-l2"></div>
        </div>
    <asp:Label id="ErrorName" class="text-danger " runat="server" > Full Name is Required</asp:Label>
    <div class="from-group"> 

<p class="high-lighted">
<label style="font-weight:900;">Title :</label> 
<asp:TextBox runat="server" ID="Jobtitle" CssClass="form-control input-sm" Width="150" placeholder="Job Title"></asp:TextBox>
</p>

    <div class="clear-l2"></div>
    </div>
   <asp:Label id="ErrorTitle" runat="server" class="text-danger " >Title is Required </asp:Label>

    <div class="from-group"> 

<p class="high-lighted">
<label style="font-weight:900;">Department :</label> 
 <asp:DropDownList runat="server" CssClass="form-control input-sm" ID="ddlDepartment"  onchange="" ClientIDMode="Static"></asp:DropDownList>

</p>

    <div class="clear-l2"></div>
    </div>
    <asp:Label id="ErrorDep" runat="server" class="text-danger " >Department is Required </asp:Label>

    <div class="from-group"> 
<p class="high-lighted">
<label style="font-weight:900;">Vacation Date From :</label> 
<asp:TextBox runat="server" ID="DateFrom"  textmode="Date" AutoPostBack="True" OnTextChanged="NumberOfDays"  CssClass="form-control input-sm" Width="150" placeholder="Vacation Start Date"></asp:TextBox>

</p>

 <div class="clear-l2"></div>
    </div>
  <asp:Label id="ErrorFromDate" runat="server" class="text-danger " >Vacation Date From is Required </asp:Label>
  <asp:Label id="LessFromError" runat="server" class="text-danger " >Vacation Date From Can't be less than today's date </asp:Label>
    <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Vacation Date To :</label> 
<asp:TextBox runat="server" ID="DateTo" textmode="Date"  AutoPostBack="True" OnTextChanged="NumberOfDays"  CssClass="form-control input-sm" Width="150" placeholder="Vacation End Date"></asp:TextBox>
</p>

     <div class="clear-l2"></div>

    </div>
  <asp:Label id="ErrorToDate" class="text-danger " runat="server" >Vacation Date To is Required </asp:Label>
  <asp:Label id="ToFromError" runat="server" class="text-danger " >Vacation Date To Can't be less than Vacation Date From </asp:Label>

    <div class="from-group"> 
    <p class="high-lighted">
<label style="font-weight:900;">Returning Date :</label> 
<asp:TextBox runat="server" ID="ReturningDate" textmode="Date" AutoPostBack="True" OnTextChanged="NumberOfDays" CssClass="form-control input-sm" Width="150" placeholder="Date of Returning"></asp:TextBox>

</p>
  
     <div class="clear-l2"></div>
    </div>
   <asp:Label id="ErrorReturnDate" class="text-danger " runat="server"  >Returning Date is Required </asp:Label>
   <asp:Label id="TO_return" class="text-danger " runat="server"  >Returning Date Can't be less Vacation Date To</asp:Label>



     <p class="high-lighted">
<label style="font-weight:900;">Total Number of days :</label> <asp:Label ID="TotalDays" runat="server"  style="font-weight:900;"></asp:Label>
</p>
    
<div class="from-group"> 

<div style="font-weight:900;" class="question-row-odd pad-top-bottom question-container">
Notes : 
<div class="clear-l1"></div>
<asp:TextBox runat="server" ID="txtNotes" CssClass="form-control input-sm"  Width="400" TextMode="MultiLine" placeholder="Please write here if you have any notes."></asp:TextBox>
</div>
</div>

<div>   
            <asp:Button runat="server" type="button" class="btn btn-success btn-lg "   ID="btnSubmit" Text="Submit "  OnClick="SubButton_Click" CausesValidation="False" UseSubmitBehavior="False" />
                <asp:Button runat ="server" class="btn btn-primary btn-lg" ID="BackBtn" Text="Back &raquo;"   OnClick="BackBtnclk" ></asp:Button>

</div>



    


<script type="text/javascript">


  


</script>


</asp:Content>

