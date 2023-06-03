<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici.Master" AutoEventWireup="true" CodeBehind="IlacEkle.aspx.cs" Inherits="YonetimPaneli.IlacEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphAdmin" runat="server">
    <table class="wrapper">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblUyari" runat="server" Text="* ile belirtilen alanları zorunlu giriniz!" Font-Underline="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>*İlaç Adı:</td>
            <td><asp:TextBox ID="txtAd" runat="server" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Açıklama:</td>
            <td><asp:TextBox ID="txtAciklama" runat="server" Text="" Height="59px" TextMode="MultiLine" Width="208px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>*Resim:</td>
            <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        
        <tr>
            <td>*Fiyat:</td>
            <td><asp:TextBox ID="txtFiyat" runat="server" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>*Kargo:</td>
            <td><asp:TextBox ID="txtKargo" runat="server" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        
        <tr>
            <td>&nbsp;</td>
            <td><asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" /></td>
        </tr>
    </table>
    <asp:Label ID="lblHata" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
