using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Veritabani.Entity;
using EczaneKapida.Model;

namespace EczaneKapida
{
    public partial class Sepetim : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["HastaId"] != null)
            {
                bool sepetKontrol=SepetGetir();
                //SEPETTE ÜRÜN YOKSA SEPET SAYFASI YERİNE REÇETE SAYFASINA YÖNLENDİRİYOR VE HATA VERİYOR
                if (!sepetKontrol)
                {
                    Session["SepetKontrol"] = false;
                    Response.Redirect("/Recete.aspx");
                }
            }

        }

        public bool SepetGetir()
        {
            bool kontrol = false;
            int sepetToplam = 0;
            List<ReceteModel> receteListesi = new List<ReceteModel>();
            
            int hastaId = Convert.ToInt32(Session["HastaId"]);
            var sepet = context.Sepet.Where(x => x.HastaId == hastaId).ToList();
            if (sepet.Count()>0)
            {
                foreach (var item in sepet)
                {
                    var receteModel = new ReceteModel();
                    var ilac = context.Ilac.Where(x => x.Id == item.IlacId).FirstOrDefault();
                    var recete = context.Recete.Where(x => x.Id == item.ReceteId).FirstOrDefault();
                    receteModel.Id = item.Id;
                    receteModel.HastaId = hastaId;
                    receteModel.ReceteId = recete.Id;
                    receteModel.IlacId = ilac.Id;
                    receteModel.UrunResim = ilac.Resim;
                    receteModel.UrunAd = ilac.Ad;
                    receteModel.UrunAdet = (int)item.UrunAdet;
                    receteModel.UrunFiyat = (double)ilac.Fiyat;
                    if (item.UrunAdet > 1)
                    {
                        receteModel.UrunKargo = (double)ilac.KargoFiyati + (1 * (int)item.UrunAdet);
                    }
                    else
                    {
                        receteModel.UrunKargo = (double)ilac.KargoFiyati;
                    }
                    
                    receteModel.UrunToplam = (double)(ilac.Fiyat * item.UrunAdet + (int)receteModel.UrunKargo) ;
                    receteListesi.Add(receteModel);

                    sepetToplam = sepetToplam + (int)(ilac.Fiyat * item.UrunAdet + (int)receteModel.UrunKargo);
                }

                lblToplam.Text = sepetToplam.ToString("0.0.0");
                dtSepet.DataSource = receteListesi;
                dtSepet.DataBind();
                kontrol = true;
            }
            else
            {
                kontrol = false;
            }
            
            return kontrol;
        }

        protected void btnSepettenSil_Click(object sender, EventArgs e)
        {
            Button buton = ((Button)(sender));
            RepeaterItem rp1 = ((RepeaterItem)(buton.NamingContainer));
            Label lblReceteId = (Label)rp1.FindControl("lblReceteId");

            int receteId = Convert.ToInt32(lblReceteId.Text);

            var sepet = context.Sepet.Where(x => x.ReceteId == receteId).FirstOrDefault();
            var recete = context.Recete.Where(x => x.Id == sepet.ReceteId).FirstOrDefault();

            recete.SepettekiAdet = recete.SepettekiAdet - sepet.UrunAdet;

            context.Sepet.Remove(sepet);
            context.SaveChanges();
            bool sepetKontrol = SepetGetir();
            if (sepetKontrol == false)
                Response.Redirect("/Recete.aspx");
        }

        protected void btnDevam_Click(object sender, EventArgs e)
        {


            int hastaId = Convert.ToInt32(Session["HastaId"]);
            string odemeTipi = "";
            string queryString = "/sepetim.aspx";
            string odemeTipiAdi = "";

            List<int> receteId = new List<int>();
            foreach (RepeaterItem item in dtSepet.Items)
            {
                var recete = (Label)item.FindControl("lblReceteId");
                receteId.Add(Convert.ToInt32(recete.Text));
                
            }

            if (rdHavale.Checked == true)
            {
                odemeTipi = "1";
                queryString = "~/odeme.aspx?odemeTipi=1";
                odemeTipiAdi = "Havale";
            }
            else if (rdKrediKarti.Checked == true)
            {
                odemeTipi = "2";
                queryString = "~/odeme.aspx?odemeTipi=2";
                odemeTipiAdi = "Kredi Karti";
            }
            else if (rdKapida.Checked == true)
            {
                odemeTipi = "3";
                queryString = "~/odeme.aspx?odemeTipi=3";
                odemeTipiAdi = "Kapıda Ödeme";
            }

            if (txtAd.Text == "" || txtAdres.Text == "" || txtEmail.Text == "" || txtGsm.Text == "" || txtIlce.Text == "" || txtTC.Text == "" || ddlIl.SelectedValue == "Seçiniz")
            {
                lblHata.Text = "* ile belirtilen alanları zorunlu giriniz! ";
            }
            else if (odemeTipi == "")
            {
                lblHata.Text = "Lütfen ödeme tipini seçin.";
            }
            else
            {

                var siparis = new Siparis();
                // bir siparişin birden çok sipariş detayı olabilir,,, sipariş numarası = 1  sipariş detay = n
                var siparisDetay = new List<SiparisDetay>();
                int siparisNo = GenerateRandom(0, 9999);
                // üretilen sipariş numarasını veritabanında aratır, sipariş numarası yoksa işleme devam eder
                var siparisNoKontrol = context.Siparis.Where(x => x.SiparisNo == siparisNo).Any();
                if (siparisNoKontrol)
                {
                    siparisNo = GenerateRandom(0, 9999);
                }
                // ilk sipariş bu kısımda oluşur , ödeme kullanıcı tarafından alınmadığından dolayı siparişin ilk durumu pasif, ödeme gerçekleşince siparişin durumu aktif olur
                siparis.SiparisNo = siparisNo;
                siparis.HastaId = hastaId;
                siparis.ToplamTutar = (int)Convert.ToDouble(lblToplam.Text);
                siparis.Ad = txtAd.Text;
                siparis.Soyad = txtSoyad.Text;
                siparis.Adres = txtAdres.Text;
                siparis.Email = txtEmail.Text;
                siparis.Gsm = txtGsm.Text;
                siparis.Tc = txtTC.Text;
                siparis.Il = ddlIl.SelectedItem.Text;
                siparis.Ilce = txtIlce.Text;
                siparis.VergiDairesi = txtVergiDairesi.Text;
                siparis.PostaKodu = txtPostaCode.Text;
                siparis.OdemeTipi = odemeTipiAdi;
                siparis.Durum = false;

                Session["Siparis"] = siparis;

                // kullanıcının sepetindeki ürünlerin kargo fiyatını kontrol ediliyor
                var sepet = context.Sepet.Where(x => x.HastaId == hastaId).ToList();
                int kargo = 0;
                foreach (var item in sepet)
                {
                    var ilac = context.Ilac.Where(x => x.Id == item.IlacId).FirstOrDefault();
                    var recete = context.Recete.Where(x => x.Id == item.ReceteId).FirstOrDefault();
                    if (item.UrunAdet > 1)
                    {
                        kargo = (int)(ilac.KargoFiyati + (1 *item.UrunAdet));
                    }
                    else
                    {
                        kargo = (int)ilac.KargoFiyati;
                    }
                    // siparişin sipariş detayını oluşturuyoruz
                    // sipariş bir numaradır , siparişin detayları önemlidir
                    siparisDetay.Add(new SiparisDetay
                    {
                        IlacId = (int)item.IlacId,
                        SiparisId = siparis.Id,
                        ReceteId = recete.Id,
                        UrunAdet = item.UrunAdet,
                        UrunFiyat = ilac.Fiyat,
                        UrunKargo= kargo,
                        SiparisDurumu ="Onay Bekliyor",
                        UrunToplam = ilac.Fiyat  * item.UrunAdet + kargo,
                        OlusturmaTarihi = DateTime.Now
                    });
                }
                // oluşan sipariş detayını sessiona atıyoruz 
                Session["SiparisDetay"] = siparisDetay;
                Response.Redirect(queryString);
            }
        }
        public int GenerateRandom(int min, int max)
        {
            var seed = Convert.ToInt32(Regex.Match(Guid.NewGuid().ToString(), @"\d+").Value);
            return new Random(seed).Next(min, max);
        }
    }
}
