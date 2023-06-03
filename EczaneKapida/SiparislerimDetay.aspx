<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SiparislerimDetay.aspx.cs" Inherits="EczaneKapida.SiparislerimDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .tablee td {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td>Sipariş Detayı</td>
                </tr>
            </table>

        </div>

        <div class="wrap">
            <div class="alert alert-warning" id="divErrorInformation" runat="server" visible="false" style="text-align: center;"></div>
            <div class="urun-detay">

                <a href="siparislerim.aspx" class="alt-bas">
                    <img src="img/arrow-prev.png" style="width: 12px; position: relative; bottom: 1px;" />
                    Siparişlerim Sayfasına Dön</a>
                <hr />
                <div class="container sepet">
                    <p>
                        Sipariş No: <b>
                            <asp:Label ID="lblSiparisNo" runat="server"></asp:Label></b>
                    </p>
                    <p>
                        Tarih: <b>
                            <asp:Label ID="lblSiparisTarihi" runat="server"></asp:Label></b>
                    </p>
                    <p>
                        Sipariş Durumu: <b>
                            <asp:Label ID="lblSiparisDurumu" runat="server"></asp:Label></b>
                    </p>
                    <br />

                    <table>
                        <thead>
                            <tr>
                                <td colspan="5">Ürünler</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tablo-alt">
                                <td>Ürün Adı</td>
                                <td>Fiyatı</td>
                                <td>Kargo</td>
                                <td>Adet</td>
                                <td>Toplam</td>
                            </tr>
                            <asp:Repeater ID="dtSiparis" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <img src="/IlacResimleri/<%#Eval("UrunResim") %>" />
                                            <%#Eval("UrunAd") %>
                                        </td>
                                        <td>
                                            <%# Eval("UrunFiyat", "{0:N}") %> TL
                                        </td>
                                        <td>
                                            <%# Eval("UrunKargo", "{0:N}") %> TL
                                        </td>
                                        <td><%#Eval("UrunAdet") %></td>
                                        <td><%#Eval("UrunToplam", "{0:N}") %> TL</td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                    <br />
                    <br />

                    <table>
                        <thead>
                            <tr>
                                <td colspan="2">Teslimat Bilgileri</td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="dtBilgi" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><b>İsim - Soyisim</b></td>
                                        <td>
                                            <%#Eval("Ad") %>  <%#Eval("Soyad") %> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Vergi No / TC Kimlik No</b></td>
                                        <td>
                                            <%#Eval("Tc") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Adres</b></td>
                                        <td>
                                            <%#Eval("Adres") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>İlçe</b></td>
                                        <td>
                                            <%#Eval("Ilce") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>İl</b></td>
                                        <td>
                                            <%#Eval("Il") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Telefon</b></td>
                                        <td>
                                            <%#Eval("Gsm") %>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td><b>Email</b></td>
                                        <td>
                                            <%#Eval("Email") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
