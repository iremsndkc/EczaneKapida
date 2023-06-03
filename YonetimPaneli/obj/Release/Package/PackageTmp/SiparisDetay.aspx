<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici.Master" AutoEventWireup="true" CodeBehind="SiparisDetay.aspx.cs" Inherits="YonetimPaneli.SiparisDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphAdmin" runat="server">

    <div class="Otable-body">
        <h5 class="ordertitle">Sipariş Detayları</h5>
        <table>
            <tr>
                <td>
                    <h5 class="ordertitle">Siparis Numarası:</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblSiparisNo" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Ad</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblAd" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Soyad</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblSoyad" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Gsm</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblGsm" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Email</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">İlaç Adı</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblIlacAd" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">İlaç Fiyatı</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblIlacFiyati" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">İlaç Kargo Fiyatı</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblIlacKargoFiyati" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Adet</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblAdet" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Toplam</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblToplam" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">TC</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblTC" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Posta Kodu</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblPostaKodu" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Vergi Dairesi</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblVergiDairesi" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Adres</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblAdres" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">il</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblIl" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">İlçe</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblIlce" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Ödeme Tipi</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblOdemeTipi" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <h5 class="ordertitle">Sipariş Durumu</h5>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSiparisDurum" runat="server">
                        <asp:ListItem Value="Onay Bekliyor">Onay Bekliyor</asp:ListItem>
                        <asp:ListItem Value="İşleme Alındı">İşleme Alındı</asp:ListItem>
                        <asp:ListItem Value="Tedarik Aşamasında">Tedarik Aşamasında</asp:ListItem>
                        <asp:ListItem Value="Kargoda">Kargoda</asp:ListItem>
                        <asp:ListItem Value="Teslim Edildi">Teslim Edildi</asp:ListItem>
                    </asp:DropDownList>
                    
                </td>
            </tr>
             <tr>
                <td>
                    <h5 class="ordertitle">Oluşturma Tarihi</h5>
                </td>
                <td>
                    <h5 class="ordertitle2">
                        <asp:Label ID="lblOlusturmaTarihi" runat="server" Text=""></asp:Label></h5>
                </td>
            </tr>
            <tr>
            <td><asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" /></td>
              <td><asp:Button ID="btnIptal" runat="server" Text="İptal" OnClick="btnIptal_Click" /></td>
            </tr>
            <tr>
                  <td colspan="2">
        <asp:Label ID="lblHata" runat="server" Text="" ForeColor="Green"></asp:Label>
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
