<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="YonetimPaneli.Giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli Giriş</title>
    <link href="assets/css/landing.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
    <script src="assets/js/jquery.js"></script>

    <script src="assets/js/jquery.validate.js" type="text/javascript"></script>
    <script src="assets/js/functions.js"></script>
    <script src="assets/js/landing.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            CenterElement(".main");
        });

        $(window).resize(function () {
            CenterElement(".main");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div class="main">
                <img class="logo" src="assets/img/logoo.png" />
                <asp:TextBox ID="txtUserName" runat="server" placeholder="Kullanıcı Adı" required></asp:TextBox><br />
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Şifre" TextMode="Password" required></asp:TextBox><br />
                <asp:Button ID="btnLogin" runat="server" Text="GİRİŞ YAP" CssClass="btn btn-info OpenSession" OnClick="btnLogin_Click" />
                <asp:Label ID="lblHata" runat="server" Text=""></asp:Label>

            </div>
            <div class="footer">Copyright © 2017 </div>
        </div>
    </div>
    </form>
</body>
</html>
