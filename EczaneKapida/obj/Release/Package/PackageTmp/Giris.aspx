<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="EczaneKapida.Giris" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<%-- GOOGLE CATPCHA KÜTÜPHANESİ --%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <title>Giriş</title>
</head>
<body <%----%>>

    <form id="form1" runat="server">
        <div class="wrap" style="text-align: center;">
            <p><b>ECZANE KAPIDA </b></p>
            <p><b>İLAÇ ALMA SİSTEMİ</b></p>

            <div class="wrap">
                <div class="login" style="margin: auto; border-style: solid; width: 500px;">
                    <div style="width: 500px; height: 365px; background: #ffffff;">
                        <img src="img/e-logo.jpg" style="width: 80px; height: 55px; margin-left: -176px;" />
                        <span style="margin-left: 100px"><b>GİRİŞ EKRANI</b></span>
                        <hr />
                        <div class="col-xs-6" style="margin: auto; width: 360px;">
                            <div class="alert alert-warning" id="divLoginInformation" runat="server" visible="false"></div>
                            <table>
                                <tr>
                                    <td><b>TCKN:</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtTCKN" runat="server" CssClass="form-control" required></asp:TextBox>
                                    </td>
                                </tr>
<%--                                <tr>
                                    <td>
                                        <b>Güvenlik Kodu:</b>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <%-- HAZIR GOOGLE GÜVENLİK SORUSU CAPTCHA --%>
                                    <td>
                                        <%--<div class="g-recaptcha" id="recaptcha" runat="server" data-sitekey="6Lfu-h0UAAAAAHyoi-_FfSIT2Ps0cyqSsvFcQ9qz"></div>--%>
                                      <%--  <recaptcha:RecaptchaControl ID="recaptcha" runat="server"
                                            PublicKey="6Lfu-h0UAAAAAHyoi-_FfSIT2Ps0cyqSsvFcQ9qz"
                                            PrivateKey="6Lfu-h0UAAAAAJNap7GbDGiSKSufHmUvIGmvVxwy"/>--%>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblHata" runat="server" ForeColor="Red"></asp:Label></td>
                                    <td></td>
                                    <tr>
                                    <td>
                                        <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn btn-default" OnClick="btnLogin_Click" />
                                    </td>
                                        </tr>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
