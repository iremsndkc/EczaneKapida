using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace YonetimPaneli
{
    public partial class SiparisDetay : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisDetayGetir();
            }
            if (Session["yoneticiId"] == null || (bool)Session["yoneticiYetki"] == false || Request.QueryString["detayId"] == null)
            {
                Response.Redirect("/Giris.aspx");
            }
        }

        public void SiparisDetayGetir()
        {
            int detayId = Convert.ToInt32(Request.QueryString["detayId"].ToString());
            var siparisDetay = context.SiparisDetay.Where(x => x.Id == detayId).FirstOrDefault();
            var siparis = context.Siparis.Where(x => x.SiparisNo == siparisDetay.Siparis.SiparisNo).FirstOrDefault();
            var ilac = context.Ilac.Where(x => x.Id == siparisDetay.IlacId).FirstOrDefault();

            lblSiparisNo.Text = siparis.SiparisNo.ToString();
            lblAd.Text = siparis.Ad;
            lblSoyad.Text = siparis.Soyad;
            lblGsm.Text = siparis.Gsm;
            lblEmail.Text = siparis.Email;
            lblAdres.Text = siparis.Adres;
            lblIl.Text = siparis.Il;
            lblIlce.Text = siparis.Ilce;
            lblTC.Text = siparis.Tc;
            lblVergiDairesi.Text=siparis.VergiDairesi;
            lblPostaKodu.Text=siparis.PostaKodu;
            lblIlacAd.Text = ilac.Ad;
            lblIlacFiyati.Text = siparisDetay.UrunFiyat.ToString();
            lblIlacKargoFiyati.Text = siparisDetay.UrunKargo.ToString();
            lblAdet.Text = siparisDetay.UrunAdet.ToString();
            lblToplam.Text = siparisDetay.UrunToplam.ToString();
            lblOdemeTipi.Text = siparis.OdemeTipi;
            lblOlusturmaTarihi.Text = siparisDetay.OlusturmaTarihi.ToString();
            ddlSiparisDurum.SelectedValue = siparisDetay.SiparisDurumu;
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            int detayId = Convert.ToInt32(Request.QueryString["detayId"].ToString());
            var siparisDetay = context.SiparisDetay.Where(x => x.Id == detayId).FirstOrDefault();
            siparisDetay.SiparisDurumu = ddlSiparisDurum.SelectedItem.Text;
            context.SaveChanges();
            Response.Redirect("/Siparisler.aspx");
            //lblHata.Text = "Siparişin durumu başarıyla değiştirildi.";
        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Siparisler.aspx");
        }
    }
}