<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Bilgilendirme.aspx.cs" Inherits="EczaneKapida.Bilgilendirme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
          <div class="alert alert-warning" id="divHata" visible="true" runat="server" style="text-align: center; width: 94%;">
              <asp:Label ID="lblSipariSonuc" runat="server" Text=""></asp:Label>
          </div>
        
    </div>
    
</asp:Content>
