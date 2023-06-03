<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="EczaneKapida.Sepetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td>Sepetim</td>
                </tr>
            </table>

        </div>
    </div>

    <div class="wrap" style="width: 980px">
                <div class="alert alert-warning" id="divHata" visible="false" runat="server" style="text-align: center;"></div>
                <div class="urun-detay">
                    <p class="alt-bas">Sepetim</p>
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
                                    <td>Sepetten Sil</td>
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
                                            <td>
                                                 <asp:Button ID="btnSepettenSil" runat="server" CssClass="delete-icon" Text="" OnClick="btnSepettenSil_Click" Height="46px" Width="60px"  /> 

                                            </td>
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
                                <tr class="tablo-alt">
                                    <td colspan="6">Ödeme Tipini Seçin:<br />
                                        <table class="urun-adi">
                                            <tr>
                                                <td>
                                                    <asp:RadioButton ID="rdHavale" runat="server" GroupName="1" />
                                                    Havale ile ödeme
                                            <!--<input type="radio" name="odeme" /> Havale ile ödeme-->
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdKapida" runat="server" GroupName="1" />
                                                    Kapıda ödeme
                                            <!--<input type="radio" name="odeme" /> Kredi Kartı ile ödeme-->
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdKrediKarti" runat="server" GroupName="1" />
                                                    Kredi Kartı
                                            <!--<input type="radio" name="odeme" /> Havale ile ödeme-->
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <br />
    </div>
    <p class="alt-bas">Adres Bilgilerim</p>
    <hr />
    <div class="container sepet">

        <table class="table">
            <thead>
                <tr>
                    <td colspan="2">Adres Bilgisi</td>
                </tr>
                <tr>
                    <td colspan="2" class="alert alert-warning"style="text-align: center;">
                        <asp:Label ID="lblHata" runat="server" Text="">  </asp:Label>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 260px;">*İsim</td>
                    <td>
                        <asp:TextBox ID="txtAd" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 260px;">*Soyisim</td>
                    <td>
                        <asp:TextBox ID="txtSoyad" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*Adres</td>
                    <td>
                        <asp:TextBox ID="txtAdres" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*Şehir</td>
                    <td>
                        <asp:DropDownList ID="ddlIl" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Seçiniz" Selected="True">Seçiniz</asp:ListItem>
                            <asp:ListItem Value="01">Adana</asp:ListItem>
                            <asp:ListItem Value="02">Adıyaman</asp:ListItem>
                            <asp:ListItem Value="03">Afyon</asp:ListItem>
                            <asp:ListItem Value="04">Ağrı</asp:ListItem>
                            <asp:ListItem Value="68">Aksaray</asp:ListItem>
                            <asp:ListItem Value="05">Amasya</asp:ListItem>
                            <asp:ListItem Value="06">Ankara</asp:ListItem>
                            <asp:ListItem Value="07">Antalya</asp:ListItem>
                            <asp:ListItem Value="75">Ardahan</asp:ListItem>
                            <asp:ListItem Value="08">Artvin</asp:ListItem>
                            <asp:ListItem Value="09">Aydın</asp:ListItem>
                            <asp:ListItem Value="10">Balıkesir</asp:ListItem>
                            <asp:ListItem Value="74">Bartın</asp:ListItem>
                            <asp:ListItem Value="72">Batman</asp:ListItem>
                            <asp:ListItem Value="69">Bayburt</asp:ListItem>
                            <asp:ListItem Value="11">Bilecik</asp:ListItem>
                            <asp:ListItem Value="12">Bingöl</asp:ListItem>
                            <asp:ListItem Value="13">Bitlis</asp:ListItem>
                            <asp:ListItem Value="14">Bolu</asp:ListItem>
                            <asp:ListItem Value="15">Burdur</asp:ListItem>
                            <asp:ListItem Value="16">Bursa</asp:ListItem>
                            <asp:ListItem Value="17">Çanakkale</asp:ListItem>
                            <asp:ListItem Value="18">Çankırı</asp:ListItem>
                            <asp:ListItem Value="19">Çorum</asp:ListItem>
                            <asp:ListItem Value="20">Denizli</asp:ListItem>
                            <asp:ListItem Value="21">Diyarbakır</asp:ListItem>
                            <asp:ListItem Value="81">Düzce</asp:ListItem>
                            <asp:ListItem Value="22">Edirne</asp:ListItem>
                            <asp:ListItem Value="23">Elazığ</asp:ListItem>
                            <asp:ListItem Value="24">Erzincan</asp:ListItem>
                            <asp:ListItem Value="25">Erzurum</asp:ListItem>
                            <asp:ListItem Value="26">Eskişehir</asp:ListItem>
                            <asp:ListItem Value="27">Gaziantep</asp:ListItem>
                            <asp:ListItem Value="28">Giresun</asp:ListItem>
                            <asp:ListItem Value="29">Gümüşhane</asp:ListItem>
                            <asp:ListItem Value="30">Hakkari</asp:ListItem>
                            <asp:ListItem Value="31">Hatay</asp:ListItem>
                            <asp:ListItem Value="76">Iğdır</asp:ListItem>
                            <asp:ListItem Value="32">Isparta</asp:ListItem>
                            <asp:ListItem Value="33">İçel</asp:ListItem>
                            <asp:ListItem Value="34">İstanbul</asp:ListItem>
                            <asp:ListItem Value="35">İzmir</asp:ListItem>
                            <asp:ListItem Value="46">Kahramanmaraş</asp:ListItem>
                            <asp:ListItem Value="78">Karabük</asp:ListItem>
                            <asp:ListItem Value="70">Karaman</asp:ListItem>
                            <asp:ListItem Value="36">Kars</asp:ListItem>
                            <asp:ListItem Value="37">Kastamonu</asp:ListItem>
                            <asp:ListItem Value="38">Kayseri</asp:ListItem>
                            <asp:ListItem Value="71">Kırıkkale</asp:ListItem>
                            <asp:ListItem Value="39">Kırklareli</asp:ListItem>
                            <asp:ListItem Value="40">Kırşehir</asp:ListItem>
                            <asp:ListItem Value="79">Kilis</asp:ListItem>
                            <asp:ListItem Value="41">Kocaeli</asp:ListItem>
                            <asp:ListItem Value="42">Konya</asp:ListItem>
                            <asp:ListItem Value="43">Kütahya</asp:ListItem>
                            <asp:ListItem Value="44">Malatya</asp:ListItem>
                            <asp:ListItem Value="45">Manisa</asp:ListItem>
                            <asp:ListItem Value="47">Mardin</asp:ListItem>
                            <asp:ListItem Value="48">Muğla</asp:ListItem>
                            <asp:ListItem Value="49">Muş</asp:ListItem>
                            <asp:ListItem Value="50">Nevşehir</asp:ListItem>
                            <asp:ListItem Value="51">Niğde</asp:ListItem>
                            <asp:ListItem Value="52">Ordu</asp:ListItem>
                            <asp:ListItem Value="80">Osmaniye</asp:ListItem>
                            <asp:ListItem Value="53">Rize</asp:ListItem>
                            <asp:ListItem Value="54">Sakarya</asp:ListItem>
                            <asp:ListItem Value="55">Samsun</asp:ListItem>
                            <asp:ListItem Value="56">Siirt</asp:ListItem>
                            <asp:ListItem Value="57">Sinop</asp:ListItem>
                            <asp:ListItem Value="58">Sivas</asp:ListItem>
                            <asp:ListItem Value="63">Şanlıurfa</asp:ListItem>
                            <asp:ListItem Value="73">Şırnak</asp:ListItem>
                            <asp:ListItem Value="59">Tekirdağ</asp:ListItem>
                            <asp:ListItem Value="60">Tokat</asp:ListItem>
                            <asp:ListItem Value="61">Trabzon</asp:ListItem>
                            <asp:ListItem Value="62">Tunceli</asp:ListItem>
                            <asp:ListItem Value="64">Uşak</asp:ListItem>
                            <asp:ListItem Value="65">Van</asp:ListItem>
                            <asp:ListItem Value="77">Yalova</asp:ListItem>
                            <asp:ListItem Value="66">Yozgat</asp:ListItem>
                            <asp:ListItem Value="67">Zonguldak</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>*İlçe</td>
                    <td>
                        <asp:TextBox ID="txtIlce" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Posta Kodu</td>
                    <td>
                        <asp:TextBox ID="txtPostaCode" CssClass="form-control" onkeypress="return numbersonly(this, event)" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*GSM</td>
                    <td>
                        <asp:TextBox ID="txtGsm" CssClass="form-control" runat="server" onkeypress="return numbersonly(this, event)" MaxLength="11" TextMode="Phone"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*Vergi No / TC Kimlik No</td>
                    <td>
                        <asp:TextBox ID="txtTC" CssClass="form-control" runat="server" MaxLength="11"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Vergi Dairesi</td>
                    <td>
                        <asp:TextBox ID="txtVergiDairesi" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnDevam" runat="server" Text="Devam" CssClass="btn btn-danger" OnClick="btnDevam_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
       NOT:* ile belirtilen alanları zorunlu giriniz ! 
   </div>


    </div>
    </div>
</asp:Content>
