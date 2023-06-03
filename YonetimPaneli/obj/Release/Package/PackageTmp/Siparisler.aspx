<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici.Master" AutoEventWireup="true" CodeBehind="Siparisler.aspx.cs" Inherits="YonetimPaneli.Siparisler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphAdmin" runat="server">

    <div class="Otable">
        <div class="Otable-title">
            <h4>Sipariş Listesi</h4>

        </div>
        <div class="Otable-body">
            <table class="table-hover table-condensed">
                <thead>
                    <tr>
                        <td colspan="12">Siparişler</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablo-alt">
                        <td> <b>Sipariş No</b></td>
                        <td><b>Ad</b></td>
                        <td><b>Soyad</b></td>
                        <td><b>Ürün Adı</b></td>
                        <td><b>Ürün Fiyatı</b></td>
                        <td><b>Ürün Kargo</b></td>
                        <td><b>Ürün Adeti</b></td>
                        <td><b>Ürün Toplam</b></td>
                        <td><b>Ödeme Tipi</b></td>
                        <td><b>Sipariş Durumu</b></td>
                        <td><b>Oluşturma Tarihi</b></td>
                        <td></td>
                    </tr>
                    <asp:Repeater ID="dtSiparis" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSiparisdetayId" runat="server" Text='<%# Eval("SiparisDetayId") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblSiparisId" runat="server" Text='<%# Eval("SiparisId") %>' Visible="false"></asp:Label>
                                    <%# Eval("SiparisNo") %>
                                </td>
                                <td>
                                    <%#Eval("Ad") %>
                                </td>
                                <td>
                                    <%# Eval("Soyad") %>
                                </td>
                                <td>
                                    <%# Eval("UrunAd") %>
                                </td>
                                <td>
                                    <%# Eval("UrunFiyat", "{0:N}") %>
                                </td>
                                <td>
                                    <%# Eval("UrunKargo", "{0:N}") %> 
                                </td>
                                <td>
                                    <%# Eval("UrunAdet", "{0:N}") %> 
                                </td>
                                <td>
                                    <%# Eval("UrunToplam", "{0:N}") %> 
                                </td>
                                 <td>
                                    <%# Eval("OdemeTipi") %>
                                </td>
                                <td>
                                    <%# Eval("SiparisDurumu") %>
                                </td>
                                <td>
                                    <%# Eval("OlusturmaTarihi") %> 
                                </td>
                                <td>
                                    <div class="logout">
                                        <asp:Button ID="btnSiparisDetay" runat="server" Text="Detay" OnClick="btnSiparisDetay_Click" />
                                    </div>
                                 </td>
                               
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
