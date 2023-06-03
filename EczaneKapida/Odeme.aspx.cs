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
    public partial class Odeme : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string paymentType=null;
            if (Request.QueryString["odemeTipi"] != null)
            {
                paymentType = Request.QueryString["odemeTipi"];
            }
            if (paymentType == "1" || paymentType == "2" || paymentType == "3")
            {
                if (!IsPostBack )
                    SepetGetir();
                if (Session["HastaId"] == null) 
                    Response.Redirect("/Giris.aspx");

                switch (paymentType)
                {
                    case "1":
                        payment_transfer.Visible = true;
                        break;

                    case "2":
                        payment_creditCard.Visible = true;
                        break;
                    default:
                        break;
                }
            }
            else
            {
                Response.Redirect("/Sepetim.aspx");
            }
        }
        public void SepetGetir()
        {
            int hastaId = Convert.ToInt32(Session["HastaId"]);
            int sepetToplam = 0;
            var sepet = context.Sepet.Where(x => x.HastaId == hastaId).ToList();
            List<ReceteModel> receteListesi = new List<ReceteModel>();

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
                
                receteModel.UrunToplam = (double)(ilac.Fiyat * item.UrunAdet) + (int)receteModel.UrunKargo;
                receteListesi.Add(receteModel);

                sepetToplam = sepetToplam + (int)(ilac.Fiyat  * item.UrunAdet) + (int)receteModel.UrunKargo;
            }

            lblToplam.Text = sepetToplam.ToString("0.0.0");
            dtSepet.DataSource = receteListesi;
            dtSepet.DataBind();
        }

        protected void btnSiparisTamamla_Click(object sender, EventArgs e)
        {
            Siparis siparis = (Siparis)Session["Siparis"];
            List<SiparisDetay> siparisDetay = (List<SiparisDetay>)Session["SiparisDetay"];

            if (siparis != null && siparisDetay != null)
            {
                siparis.Durum = true;
                siparis.OlusturmaTarihi = DateTime.Now;
              
                context.Siparis.Add(siparis);
                context.SiparisDetay.AddRange(siparisDetay);
                foreach (var item in siparisDetay)
                {
                    var recete = context.Recete.Where(x => x.Id == item.ReceteId).FirstOrDefault();
                    recete.AlinanAdet += item.UrunAdet;
                    recete.SepettekiAdet = 0;
                }
                var sepetSil = context.Sepet.Where(x => x.HastaId == siparis.HastaId).ToList();
                context.Sepet.RemoveRange(sepetSil);
                context.SaveChanges();
                Session["SiparisBilgilendirme"] = siparis.SiparisNo + " Numaralı siparişiniz başarıyla tamamlandı.";
            }
            else
            {
                Session["SiparisBilgilendirme"] = "Siparişiniz sırasında hata oluştu lütfen tekrar deneyiniz!";
            }

            Response.Redirect("/Bilgilendirme.aspx");

        }
    }
}