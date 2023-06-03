<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EczaneKapida.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrap">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 920px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <div class="item active">
                    <img src="img/karikatur1.jpg" style="width: 920px; height: auto" />
               <%--     <div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
                </div>

                <div class="item">
                    <img src="img/karikatur2.jpg" style="width: 920px; height: auto" />
                 <%--   <div class="carousel-caption">
                        <h3>Chania</h3>
                        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                    </div>--%>
                </div>

                <div class="item">
                    <img src="img/karikatur1.jpg" style="width: 920px; height: auto" />
              <%--      <div class="carousel-caption">
                        <h3>Flowers</h3>
                        <p>Beatiful flowers in Kolymbari, Crete.</p>
                    </div>--%>
                </div>

                <div class="item">
                    <img src="img/karikatur2.jpg" style="width: 920px; height: auto" />
                 <%--   <div class="carousel-caption">
                        <h3>Flowers</h3>
                        <p>Beatiful flowers in Kolymbari, Crete.</p>
                    </div>--%>
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- SOL BANNER -->
        <div class="left-banners">
            <div class="pull-left" <%--style="float: left"--%>>

                <div class="banners">
                    <iframe width="230" height="160" src="https://www.youtube.com/embed/QmQshIelIuo" frameborder="0" allowfullscreen></iframe>
                </div>
                <b>REÇETESİZ İLAÇ KULLANIMI</b>
                           <div class="banners">
                               <iframe width="230" height="160" src="https://www.youtube.com/embed/BwBTte1Dsfk" frameborder="0" allowfullscreen></iframe>
                           </div>
                <b>ÇOK İLAÇ DEĞİL DOĞRU İLAÇ İYİLEŞTİRİR</b>
                          <div class="banners">
                              <iframe width="230" height="160" src="https://www.youtube.com/embed/BmFpuzd1b_w" frameborder="0" allowfullscreen></iframe>
                          </div>
                <b>GEREKSİZ ANTİBİYOTİK KULLANIMI</b>
                            
            </div>
        </div>
        <!-- SOL BANNER -->

        <!--.haberler-->
        <div class="content-news">
            <b>SGK Türkiye’de üret teklifini kabul etmeyen firmaların 54 ilacını ödeme listesinden çıkardı</b><br />

<br/>İthal ilaçların Türkiye’de üretilmesi için başlatılan yerelleşme müzakereleri çetin geçiyor. Müzakerelerin ilk aşamasında, Türkiye’de üretimi kabul edilmeyen ilaçlar Sosyal Güvenlik Kurumu’nun (SGK) ödeme listesinden çıkarılırken; bundan sonraki süreçte de yeni ilaçlar için pazarlık masasına oturulması planlanıyor. SGK’nın ödeme listesinde bulunmak Türkiye’de firmalar için hayati nitelik taşıyor. Türkiye’de ilacın en büyük alıcısı devlettir. Bu nedenle SGK’nın ödeme listesinden çıkarılmak, pazarda büyük darbe almak anlamına geliyor.

<br /><p><b>Eczacılar ve SGK arasında 'ilaç getirme' anlaşmazlığı</b>

<p>Kanser, MS ya da genetik rahatsızlıklar için nadir bulunan ve Türkiye'de ruhsatı olmayan ilaçları, hastalar adına yurt dışından Türk Eczacılar Birliği temin edip getirtiyordu ama artık sistem SGK üzerinden işleyecek. Türk Eczacılar Birliği'ne göre bu uygulama, hastaların ilaçlara daha zor ulaşması demek. SGK ise gerekli tedbirlerin alındığını ve sorun yaşanmayacağını vurguladı.

<br /><p><b>Yorgunluğun Yeni Aracı</b>

<p>Ceviz kemik ve dişleri güçlendirir. Potasyum açısından da oldukça zengindir. Potasyum, sinirlerin uyarımı ve kas dokusunun çalışması için gereklidir.

<p>Bal ile karıştırılıp tüketildiğinde soğuk almış mideye iyi gelir. Damar sertliğini önler. Yorgunluğu giderir. Şeker hastaları için hayati önemi olan insülini artırır. Ceviz yağı, mide ve bağırsakları temizleyerek, yumuşak kalmalarını sağlar.

<br /><p><b>İthal ilaca harcanan para düşürülecek</b>

<p>Yerli yatırımcıya sağlanan destekler sonrasında hem üretim hem AR-GE'ye yatırım yapan ve uluslararası büyük firmalar ile iş birliği içine giren Türk işletmeci sayısının arttığını vurgulayan Nacar, ilaç üretiminin yanı sıra biyobenzer ürün geliştirme ve yeni molekül çalışmalarının da hız kazandığını ifade etti.

<br /><p><b>İlaç nerede saklanır?</b>

<p>Doç. Dr Kumcu, "Çoğu evde ilaç mutfak veya banyo dolaplarında saklanır ancak bu ortamlarda ısı ve nemin evin diğer bölgelerine oranla daha fazla olması sakınca teşkil etmektedir. İlaçların büyük bir çoğunluğu oda ısısında etkinliğini korur. Eğer ilacın üzerinde 'Oda ısısında saklanmalıdır' ibaresi var ise bu ifade oda ısısının 15-250C arasında bulunması gerektiğini belirtir" dedi.
        </div>
         <!--.haberler-->
        <div class="pull-right">
            <%--SAĞ BANNER--%>
            <div class="banners">
                <img src="img/e-logo.jpg" style="width: 144px;margin-left: 39px;"/>
            </div>
            <%--SAĞ BANNER--%>

            <%--REÇETE SATIN AL--%>

            <asp:Button ID="btnReceteSatinal" CssClass="btn btn-danger" runat="server" Text="REÇETEYE GİT" Style="margin-left: 39px; margin-top: 23px; padding: 13px 28px;" OnClick="btnReceteSatinal_Click" />

            <%--REÇETE SATIN AL--%>

            <%--SOSYAL MEDYA--%>
            <div class="social-media">
                <a href="#"><img src="img/facebook.png" height="70" width="70"/></a>
            </div>
            <div class="social-media">
                <a href="#"><img src="img/twitter.png" height="70" width="70"/></a>
            </div>
            <div class="social-media">
                <a href="#"><img src="img/instgram.jpg" height="70" width="70"/></a>
            </div>
            <div class="social-media">
                <a href="#"><img src="img/youtube.jpg" height="70" width="70"/></a>
            </div>
            <%--SOSYAL MEDYA--%>
        </div>

    </div>

    <!--.wrap-->

</asp:Content>
