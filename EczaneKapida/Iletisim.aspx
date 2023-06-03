<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="EczaneKapida.Iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="wrap">
        <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d96331.53836923184!2d28.557302884803285!3d41.017366701827356!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x14b55f002484dbb3%3A0x6141a279d7e50fae!2zQ3VtaHVyaXlldCwgxZ5pZmEgRWN6YW5lc2ksIDM0NTIyIELDvHnDvGvDp2VrbWVjZS_EsHN0YW5idWw!3m2!1d41.017387899999996!2d28.627342799999997!5e0!3m2!1str!2str!4v1487849875767" width="920" height="175" frameborder="0" style="border:0" allowfullscreen></iframe>
    </div>
    
    
    <div class="wrap">
        <table class="table-condensed">
            <tbody>
            <tr>
                <td>
                    <p><br /><b>Soru,talep ve önerileriniz için:</b></p><br />
                </td>
            </tr>
            <tr>
                  <td>Eczacı Adı ve Soyadı:</td>
                <td>
        <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Eczane Adı:</td>
            <td>
        <asp:TextBox ID="txtEcAd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                 <td>E-posta adresiniz:</td>
            <td>   
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Konu:</td>
            <td> 
        <asp:TextBox ID="txtKonu" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Mesaj:</td>
            <td>
                       
       <asp:TextBox ID="txtMesaj" runat="server" Height="124px" TextMode="MultiLine" Width="245px"></asp:TextBox>
                </td>
            </tr>

            </tbody> 
        </table>
        <asp:Button ID="btnGönder" runat="server" Text="Gönder" />
   
    <div style="margin-top: -335px;float:right;">
        <table class="table-condensed">
            <tr>
                <td style="color:red"><b>BANKA HESAP BİLGİLERİ</b></td>
            </tr>
            <tr> <td></td></tr>
            <tr> <td></td></tr>
            <tr>
                <td>
                BANKA ADI:<b>İŞ BANKASI</b>
                    </td>
            </tr>
            <tr>
                <td>
                    HESAP ADI:<b>ECZANE KAPIDA</b>
                </td>
            </tr>
            <tr>
                <td>
                    ŞUBE KODU:<b>6601</b>
                </td>
            </tr>
            <tr>
                <td>
                    HESAP KODU:<b>04982164</b>
                </td>
            </tr>
            <tr>
                <td>
                    IBAN NO:<b>TR0000000000000000000000000</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>ÖNEMLİ NOT:</b> <a style="color:red">EFT VEYA HAVALELERİNİZDE 
                   <p>BÖLÜMÜNE "ECZANE" VE "ECZACI ADI" YAZILMASI ÖNEMLE<br />
                    RİCA OLUNUR.</p></a>
                                                        
                </td>
            </tr>
        </table>
    </div>
        </div>
</asp:Content>
