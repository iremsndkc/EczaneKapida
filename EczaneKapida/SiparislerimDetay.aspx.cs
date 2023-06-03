using EczaneKapida.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace EczaneKapida
{
    public partial class SiparislerimDetay : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisDetayGetir();
            }
            if (Session["HastaId"] == null)
            {
                Response.Redirect("/Giris.aspx");
            }
            if (Request.QueryString["DId"] == null)
            {
                Response.Redirect("/Siparislerim.aspx");
            }
        }
        public void SiparisDetayGetir()
        {
            int siparisDetayId = Convert.ToInt32(Request.QueryString["DId"].ToString());
            var siparisDetay = context.SiparisDetay.Where(x => x.Id == siparisDetayId).FirstOrDefault();
            var siparis = context.Siparis.Where(x => x.Id == siparisDetay.SiparisId).FirstOrDefault();
            var ilac = context.Ilac.Where(x => x.Id == siparisDetay.IlacId).FirstOrDefault();

            List<SiparisModel> siparisModelListesi = new List<SiparisModel>();
            var siparisModel = new SiparisModel();
            siparisModel.SiparisNo = (int)siparis.SiparisNo;
            siparisModel.Ad = siparis.Ad;
            siparisModel.Soyad = siparis.Soyad;
            siparisModel.Gsm = siparis.Gsm;
            siparisModel.Email = siparis.Email;
            siparisModel.Adres = siparis.Adres;
            siparisModel.Il = siparis.Il;
            siparisModel.Ilce = siparis.Ilce;
            siparisModel.Tc = siparis.Tc;
            siparisModel.VergiDairesi = siparis.VergiDairesi;
            siparisModel.UrunResim = ilac.Resim;
            siparisModel.UrunAd = ilac.Ad;
            siparisModel.UrunFiyat = (decimal)siparisDetay.UrunFiyat;
            siparisModel.UrunKargo = (decimal)siparisDetay.UrunKargo;
            siparisModel.UrunAdet = (int)siparisDetay.UrunAdet;
            siparisModel.UrunToplam = (decimal)siparisDetay.UrunToplam;
            siparisModel.OdemeTipi = siparis.OdemeTipi;
            siparisModel.OlusturmaTarihi = (DateTime)siparisDetay.OlusturmaTarihi;
            siparisModel.SiparisDurumu = siparisDetay.SiparisDurumu;

            siparisModelListesi.Add(siparisModel);
            dtSiparis.DataSource = siparisModelListesi;
            dtSiparis.DataBind();

            dtBilgi.DataSource = siparisModelListesi;
            dtBilgi.DataBind();


            lblSiparisNo.Text = siparis.SiparisNo.ToString();
            lblSiparisTarihi.Text = siparisDetay.OlusturmaTarihi.ToString();
            lblSiparisDurumu.Text = siparisDetay.SiparisDurumu;


        }
    }
}