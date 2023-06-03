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
    public partial class Recete : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["HastaId"] != null)
            {
                // HASTAYA AİT SATIN ALINMAYAN REÇETELERİ LİSTELER
                ReceteGetir();
                // SEPETTE ÜRÜN YOKKEN SEPETE GİTMESİNİ ENGELLİYOR
                var sepetKontrol = Session["SepetKontrol"] == null ? true : false;
                if (!sepetKontrol)
                {
                    lblHata.Text = "Sepetinizde ürün bulunmamaktadır!";
                }
            }
        }

        public void ReceteGetir(int? adet = 0, int? receteId = 0)
        {

            List<ReceteModel> receteListesi = new List<ReceteModel>();
            int hastaId = Convert.ToInt32(Session["HastaId"]);
            //hastaya ait olan reçetedeki ilaçları listeler.
            var hastaRecete = context.Recete.Where(x => x.Hasta.Id == hastaId && (x.Adet > (x.SepettekiAdet + x.AlinanAdet) && adet >= 0)).ToList();
            foreach (var item in hastaRecete)
            {

                var receteModel = new ReceteModel();
                int sepetAdet = (int)item.Adet - (int)(item.SepettekiAdet + item.AlinanAdet);
                var ilac = context.Ilac.Where(x => x.Id == item.IlacId).FirstOrDefault();
                receteModel.HastaId = hastaId;
                receteModel.ReceteId = item.Id;
                receteModel.IlacId = ilac.Id;
                if (receteId == item.Id)
                {
                    sepetAdet = (int)adet;
                }
                receteModel.UrunAd = ilac.Ad;
                receteModel.UrunResim = ilac.Resim;
                receteModel.UrunAdet = sepetAdet;
                receteModel.UrunFiyat = (double)ilac.Fiyat;
                if (sepetAdet > 1) // birden fazla aynı üründe kargo fiyatı değiştirildi
                {
                    receteModel.UrunKargo = (double)ilac.KargoFiyati+(1*sepetAdet);
                }
                else
                {
                    receteModel.UrunKargo = (double)ilac.KargoFiyati;
                }
                
                receteModel.UrunToplam = (double)(ilac.Fiyat * sepetAdet + (int)receteModel.UrunKargo);
                receteListesi.Add(receteModel);
            }

            dtRecete.DataSource = receteListesi;
            dtRecete.DataBind();
        }


        /*protected void txtAdet_TextChanged(object sender, EventArgs e)
        {
            // İLACIN ÜRÜN FİYATI - KARGOSU VE TOPLAM MİKTARI DEĞİŞİYOR
            TextBox tbquant = ((TextBox)(sender));
            RepeaterItem rp1 = ((RepeaterItem)(tbquant.NamingContainer));
            int yeniAdet = Convert.ToInt32(tbquant.Text);

            // değiştirmek istenilen ilacın reçete idsini alıyoruz
            Label lbId = (Label)rp1.FindControl("lblId");

            int receteId = Convert.ToInt32(lbId.Text);

            var recete = context.Recete.Where(x => x.Id == receteId).FirstOrDefault();
            if ((recete.Adet - (recete.SepettekiAdet + recete.AlinanAdet)) >= yeniAdet && yeniAdet > 0)
            {
                ReceteGetir(yeniAdet, receteId);
            }
            else
            {
                if (yeniAdet > 0)
                    lblHata.Text = "Reçetedeki adetten fazla ilaç alamazsınız!";
                else
                    lblHata.Text = "0 adet ilaç alamazsınız!";

                ReceteGetir();
            }
            context.SaveChanges();
        }*/

        protected void btnSepeteEkle_Click(object sender, EventArgs e)
        {
            Button buton = ((Button)(sender));
            RepeaterItem rp1 = ((RepeaterItem)(buton.NamingContainer));
            Label lbId = (Label)rp1.FindControl("lblId");
            TextBox txtAdet = (TextBox)rp1.FindControl("txtAdet");

            int hastaId = Convert.ToInt32(Session["HastaId"]);
            int adet = Convert.ToInt32(txtAdet.Text);
            int receteId = Convert.ToInt32(lbId.Text);

            var receteBul = context.Recete.Where(x => x.Id == receteId && x.HastaId == hastaId).FirstOrDefault();
            var ilacBul = context.Ilac.Where(x => x.Id == receteBul.IlacId).FirstOrDefault();

            var sepet = new Sepet();
            var sepetKontrol = context.Sepet.Where(x => x.ReceteId == receteBul.Id).FirstOrDefault();
            if (sepetKontrol != null)
            {
                sepetKontrol.UrunAdet = sepetKontrol.UrunAdet + adet;
                //sepetKontrol.UrunToplam = sepetKontrol.UrunToplam + ((ilacBul.Fiyat + ilacBul.KargoFiyati) * adet);
            }
            else
            {
                sepet.HastaId = hastaId;
                sepet.ReceteId = receteBul.Id;
                sepet.IlacId = ilacBul.Id;
                sepet.UrunAdet = adet;
                /*sepet.UrunAd = ilacBul.Ad;
                sepet.UrunResim = "~\\TESTIMG\\minoset.png";//ilac.Resim;
                sepet.UrunFiyat = ilacBul.Fiyat;
                sepet.UrunKargo = ilacBul.KargoFiyati;
                sepet.UrunToplam = (ilacBul.Fiyat + ilacBul.KargoFiyati) * adet;*/
                sepet.OlusturmaTarihi = DateTime.Now;

                context.Sepet.Add(sepet);
            }

            receteBul.SepettekiAdet += adet;
            context.SaveChanges();
            lblHata.Text = null;
            ReceteGetir();

        }

        protected void btnSepeteGit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Sepetim.aspx");
        }
    }
}