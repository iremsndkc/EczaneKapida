<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Hakkimizda.aspx.cs" Inherits="EczaneKapida.Hakkimizda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        p {
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td><a href="hakkimizda.aspx">Hakkımızda</a></td>
                </tr>
            </table>
        </div>

        <div class="wrap">
            <div class="urun-detay">
                <div style="width: 800px;">
                    <h3 style="line-height: 34px;">İlaç Hediye Sistemi.</h3>
                    <p>
                        Biz sektörde daha yeni bir firmayız. Yeni olmamıza rağmen eczacılık sektöründe iş hayatını kolaylaştırıp verimliliği arttıracağımız kanaatindeyiz. Rakiplerimizin aksine çok kolay ulaşılabilir bir firmayız. Kargo dağıtımı açısından ülkemizin her yerine gün içinde anında teslim yapıyoruz. Yaşadığımız şehrin en büyükşehirler arasında yer almasına rağmen adımızı duyuracağımıza inanıyoruz. Reçetesi olan hastaların TC kimlik numaralarıyla sisteme giriş yaparak reçetesinde yer alan ilaçların internet üzerinden eczaneye gitmeden ilaçlarını 7/24 temin edebilmeleridir. Böylece nöbetçi eczane devrine son verilecektir. Bizi tercih ettiğiniz için teşekkür ederiz
                    </p>
                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>

