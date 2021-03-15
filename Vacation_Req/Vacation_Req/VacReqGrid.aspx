<%@ Page Title="Vacation Request List" Language="C#"  AutoEventWireup="true" CodeBehind="VacReqGrid.aspx.cs" Inherits="Vacation_Req.About" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"/>

    <title><%: Title %></title></head>

<body>
   
    <form runat="server" >

          <h2><%: Title %></h2>
    <asp:GridView ID="gvrequests" runat ="server" class="table table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField headertext="#" >
    <ItemTemplate>
        <%# Container.DataItemIndex + 1 %>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField  datafield="DateOfSub" DataFormatString="{0:MM/dd/yyyy}" headertext="Submission Date " />
<asp:BoundField  datafield="Emp_Name" headertext="Employee Name" />
<asp:BoundField  datafield="Dep_Name" headertext="Department" />
<asp:BoundField  datafield="Date_From" DataFormatString="{0:MM/dd/yyyy}" headertext="From" />
<asp:BoundField  datafield="Date_To" DataFormatString="{0:MM/dd/yyyy}" headertext="To" />

      <asp:TemplateField HeaderText="More Info">
          <ItemTemplate> 

        <asp:LinkButton runat ="server" ID="linkview" Text="Link" CommandArgument='<%# Eval("Emp_ID") %>'  OnClick="View_Clicked" ></asp:LinkButton>
       
              </ItemTemplate>

      </asp:TemplateField>      
        </Columns>

    </asp:GridView>
        <div class="container">
                        <asp:Button runat ="server" class="btn btn-primary btn-lg" ID="BackBtn" Text="Back"   OnClick="BackBtnclk" ></asp:Button>
        </div>
       </form>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</body>
</html>