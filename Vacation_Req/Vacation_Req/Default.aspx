<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vacation_Req._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       
        <p class=" text-center">ASP.NET Vaction Requests.</p>
        <div class="row justify-content-center" style='text-align: center;'>
             <p>        <a href="/NewRequest" class="btn btn-warning btn-lg mr-2"> + New Vacation Request Form &raquo;</a>
                 <a href="VacReqGrid.aspx" class="btn btn-primary btn-lg ">Vacation Requests List &raquo;</a>
             </p>
        </div>
       

    </div>

  
</asp:Content>
