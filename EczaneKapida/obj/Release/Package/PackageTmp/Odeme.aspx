<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Odeme.aspx.cs" Inherits="EczaneKapida.Odeme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .glyphicon {
            font-size: 12px;
        }

        .alert {
            width: 280px !important;
            padding: 10px !important;
            font-size: 12px !important;
        }
    </style>
    <script type="text/javascript">
        function numbersonly(myfield, e, dec) {
            var key;
            var keychar;

            if (window.event)
                key = window.event.keyCode;
            else if (e)
                key = e.which;
            else
                return true;
            keychar = String.fromCharCode(key);

            // control keys
            if ((key == null) || (key == 0) || (key == 8) ||
    (key == 9) || (key == 13) || (key == 27))
                return true;

                // numbers
            else if ((("0123456789").indexOf(keychar) > -1))
                return true;

                // decimal point jump
            else if (dec && (keychar == ".")) {
                myfield.form.elements[dec].focus();
                return false;
            }
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td><a href="#">Ödeme</a></td>
                </tr>
            </table>

        </div>
    </div>

    <!-- sepet -->
    <div class="wrap">
        <div class="urun-detay">
            <p class="alt-bas" style="float: left">Sepetim</p>
            <a href="sepetim.aspx" class="alt-bas" style="float: right">
                <img src="img/arrow-prev.png" style="width: 12px; position: relative; bottom: 1px;" />
                Sepet Sayfasına Dön</a>
            <div style="clear: both"></div>
            <hr />
            <div class="container sepet">
                <table>
                    <thead>
                        <tr>
                            <td colspan="6">Ürünler</td>
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
                        <asp:Repeater ID="dtSepet" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <table class="urun-adi">
                                            <tr>
                                                <td>
                                                   <img src="/IlacResimleri/<%#Eval("UrunResim") %>" />
                                                </td>
                                                <td align="left">
                                                    <%#Eval("UrunAd") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <%# Eval("UrunFiyat", "{0:N}") %> TL
                                    </td>
                                     <td>
                                        <%# Eval("UrunKargo", "{0:N}") %> TL
                                    </td>
                                    <td>
                                        <table class="urun-adi">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblReceteId" runat="server" Text='<%# Eval("ReceteId") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblAdet" runat="server" Text='<%# Eval("UrunAdet") %>'></asp:Label>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                    <td><%# Eval("UrunToplam", "{0:N}") %> TL</td>


                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>TOPLAM:</b></td>
                            <td>
                                <asp:Label ID="lblToplam" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <br />

            </div>
        </div>
    </div>
    <!-- sepet 3 -->
    <div class="wrap">
        <div class="urun-detay">
            <p class="alt-bas">Ödeme</p>
            <hr />

            <div class="alert alert-warning" id="divErrorInformation" runat="server" visible="false" style="text-align: center; width: 100% !important"></div>

            <!-- .havale ekranı başlangıç -->
            <div class="container havale" id="payment_transfer" runat="server" visible="false">
                <div class="g-bas">
                    Banka Seçenekleri
                </div>

                <div class="banka">
                    <img src="img/akbank_logo.png" /><br />
                    <br />
                    <table>
                        <tr>
                            <td><b>Banka Şubesi</b></td>
                            <td>:</td>
                            <td>TİCARET. GALATA</td>
                        </tr>
                        <tr>
                            <td><b>Şube Kodu</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>Hesap Numarası</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>IBAN</b></td>
                            <td>:</td>
                            <td>TR00 1111 2222 3333 4444 5555 66</td>
                        </tr>
                    </table>
                </div>

                <div class="banka">
                    <img src="img/garanti-logo.png" /><br />
                    <br />
                    <table>
                        <tr>
                            <td><b>Banka Şubesi</b></td>
                            <td>:</td>
                            <td>KARAKÖY</td>
                        </tr>
                        <tr>
                            <td><b>Şube Kodu</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>Hesap Numarası</b></td>
                            <td>:</td>
                            <td>111111</td>
                        </tr>
                        <tr>
                            <td><b>IBAN</b></td>
                            <td>:</td>
                            <td>TR00 1111 2222 3333 4444 5555 66</td>
                        </tr>
                    </table>
                </div>

                <div class="banka">
                    <img src="img/yapi-kredi.png" /><br />
                    <br />
                    <table>
                        <tr>
                            <td><b>Banka Şubesi</b></td>
                            <td>:</td>
                            <td>KARAKÖY</td>
                        </tr>
                        <tr>
                            <td><b>Şube Kodu</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>Hesap Numarası</b></td>
                            <td>:</td>
                            <td>111111</td>
                        </tr>
                        <tr>
                            <td><b>IBAN</b></td>
                            <td>:</td>
                            <td>TR00 1111 2222 3333 4444 5555 66</td>
                        </tr>
                    </table>
                </div>

                <div class="banka">
                    <img src="img/is_bankası.png" /><br />
                    <br />
                    <table>
                        <tr>
                            <td><b>Banka Şubesi</b></td>
                            <td>:</td>
                            <td>TİC. GALATA</td>
                        </tr>
                        <tr>
                            <td><b>Şube Kodu</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>Hesap Numarası</b></td>
                            <td>:</td>
                            <td>111111</td>
                        </tr>
                        <tr>
                            <td><b>IBAN</b></td>
                            <td>:</td>
                            <td>TR00 1111 2222 3333 4444 5555 66</td>
                        </tr>
                    </table>
                </div>

                <div class="banka">
                    <img src="img/finansbank_logo.png" /><br />
                    <br />
                    <table>
                        <tr>
                            <td><b>Banka Şubesi</b></td>
                            <td>:</td>
                            <td>SEFAKÖY</td>
                        </tr>
                        <tr>
                            <td><b>Şube Kodu</b></td>
                            <td>:</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td><b>Hesap Numarası</b></td>
                            <td>:</td>
                            <td>111111</td>
                        </tr>
                        <tr>
                            <td><b>IBAN</b></td>
                            <td>:</td>
                            <td>TR00 1111 2222 3333 4444 5555 66</td>
                        </tr>
                    </table>
                </div>

                <div class="clearfix"></div>
                <div class="urun-detay-tablo" style="float: left;">
                    <%--<asp:Button ID="btnPayWithTransfer" CssClass="btn btn-danger" runat="server" Text="Siparişi Tamamla" />--%>
                </div>
            </div>
            <!-- .havale ekranı bitiş -->

            <!-- .kredi kartı ödeme ekranı başlangıç -->
            <div class="container kredi-karti" id="payment_creditCard" runat="server" visible="false">
                <div class="g-bas">
                    Kredi Kartı Bilgileri
                </div>
                <p>Ödeme İçin Kredi Kartı Bilgilerinizi Girin</p>
                <div class="col-xs-7">
                    <table class="urun-detay-tablo" style="width: 704px;">
                        <tr>
                            <td><b>Banka</b></td>
                            <td>:</td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlbankasecimi" AutoPostBack="false" DataTextField="Name" DataValueField="Id" CssClass="form-control" Style="width: 170px; float: left;">
                                    <asp:ListItem Value="0">Banka Seçiniz</asp:ListItem>
                                    <asp:ListItem Value="1">Finansbank</asp:ListItem>
                                    <asp:ListItem Value="2">Garanti</asp:ListItem>
                                    <asp:ListItem Value="3">Akbank</asp:ListItem>
                                    <asp:ListItem Value="4">Denizbank</asp:ListItem>
                                    <asp:ListItem Value="5">İş Bankası</asp:ListItem>
                                    <asp:ListItem Value="6">Halkbank</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Taksit</b></td>
                            <td>:</td>
                            <td style="width: 500px">
                                <asp:DropDownList runat="server" ID="ddltaksit" AutoPostBack="false" DataTextField="Taksit" DataValueField="Id" CssClass="form-control" Style="width: 170px; float: left;">
                                    <asp:ListItem Value="0">Taksit Seçiniz</asp:ListItem>
                                    <asp:ListItem Value="1">Tek Çekim</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                </asp:DropDownList>
                                <%-- - Ödenecek Toplam Tutar:
                                <asp:Literal runat="server" ID="ltGuncelTutar"></asp:Literal>
                                TL--%>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Kredi Kart Tipi</b></td>
                            <td>:</td>
                            <td>
                                <asp:DropDownList runat="server" ID="dllkarttip" CssClass="form-control" Style="width: 170px; float: left;">
                                    <asp:ListItem>Kart Tipini Seçiniz </asp:ListItem>
                                    <asp:ListItem Value="MasterCard">Master Card</asp:ListItem>
                                    <asp:ListItem Value="Visa">Visa</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Kredi Kartı Üzerindeki İsim</b></td>
                            <td>:</td>
                            <td>
                                <asp:TextBox ID="tbCardOwnerName" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Kredi Kartı Numarası</b></td>
                            <td>:</td>
                            <td>
                                <asp:TextBox ID="tbCreditCardNumber" runat="server" MaxLength="16" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Son Kullanım Tarihi</b></td>
                            <td>:</td>
                            <td>
                                <asp:DropDownList ID="ddlAy" CssClass="form-control" runat="server" Style="width: 144px; float: left;">
                                    <asp:ListItem>Ay Seçiniz</asp:ListItem>
                                    <asp:ListItem Value="01">01</asp:ListItem>
                                    <asp:ListItem Value="02">02</asp:ListItem>
                                    <asp:ListItem Value="03">03</asp:ListItem>
                                    <asp:ListItem Value="04">04</asp:ListItem>
                                    <asp:ListItem Value="05">05</asp:ListItem>
                                    <asp:ListItem Value="06">06</asp:ListItem>
                                    <asp:ListItem Value="07">07</asp:ListItem>
                                    <asp:ListItem Value="08">08</asp:ListItem>
                                    <asp:ListItem Value="09">09</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="11">11</asp:ListItem>
                                    <asp:ListItem Value="12">12</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server" Style="width: 139px; float: left; margin-left: 10px;">
                                    <asp:ListItem>Yıl Seçiniz</asp:ListItem>
                                    <asp:ListItem Value="17">2017</asp:ListItem>
                                    <asp:ListItem Value="18">2018</asp:ListItem>
                                    <asp:ListItem Value="19">2019</asp:ListItem>
                                    <asp:ListItem Value="20">2020</asp:ListItem>
                                    <asp:ListItem Value="21">2021</asp:ListItem>
                                    <asp:ListItem Value="22">2022</asp:ListItem>
                                    <asp:ListItem Value="23">2023</asp:ListItem>
                                    <asp:ListItem Value="24">2024</asp:ListItem>
                                    <asp:ListItem Value="25">2025</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Güvenlik Numarası</b></td>
                            <td>:</td>
                            <td>
                                <asp:TextBox ID="tbCVV2" runat="server" MaxLength="3" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- .kredi kartı ödeme ekranı bitiş -->


                <asp:Button ID="btnSiparisTamamla" CssClass="btn btn-danger" runat="server" Text="Siparişi Tamamla" OnClick="btnSiparisTamamla_Click" />

        </div>
    </div>
    <asp:HiddenField runat="server" ID="hiddentaksitvarmi" />
    <asp:HiddenField runat="server" ID="hiddentaksitsayisi" />
</asp:Content>
