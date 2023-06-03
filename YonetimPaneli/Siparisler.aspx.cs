using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;
using YonetimPaneli.Model;

namespace YonetimPaneli
{
    public partial class Siparisler : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisGetir();
            }
        }
        public void SiparisGetir()
        {
            try
            {
                DataTable siparisTablosu = new DataTable();
                List<SiparisModel> siparisModelListesi = new List<SiparisModel>();
                var siparisListesi = context.Siparis.Where(x => x.Durum == true).ToList();
                foreach (var siparis in siparisListesi)
                {
                    var siparisDetayListesi = context.SiparisDetay.Where(x => x.SiparisId == siparis.Id).ToList();
                    foreach (var siparisDetay in siparisDetayListesi)
                    {
                        var ilac = context.Ilac.Where(x => x.Id == siparisDetay.IlacId).FirstOrDefault();
                        var siparisModel = new SiparisModel();
                        siparisModel.SiparisDetayId = siparisDetay.Id;
                        siparisModel.HastaId=(int)siparis.HastaId;
                        siparisModel.ReceteId=(int)siparisDetay.ReceteId;
                        siparisModel.IlacId=siparisDetay.IlacId;
                        siparisModel.SiparisNo = (int)siparis.SiparisNo;
                        siparisModel.Ad = siparis.Ad;
                        siparisModel.Soyad = siparis.Soyad;
                        siparisModel.UrunAd = ilac.Ad;
                        siparisModel.UrunFiyat = (decimal)siparisDetay.UrunFiyat;
                        siparisModel.UrunKargo = (decimal)siparisDetay.UrunKargo;
                        siparisModel.UrunAdet = (int)siparisDetay.UrunAdet;
                        siparisModel.UrunToplam = (decimal)siparisDetay.UrunToplam;
                        siparisModel.OdemeTipi = siparis.OdemeTipi;
                        siparisModel.SiparisDurumu = siparisDetay.SiparisDurumu;
                        siparisModel.OlusturmaTarihi = (DateTime)siparisDetay.OlusturmaTarihi;
                        siparisModelListesi.Add(siparisModel);
                    }
                }

                dtSiparis.DataSource = siparisModelListesi.OrderByDescending(x=>x.OlusturmaTarihi);
                dtSiparis.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnSiparisDetay_Click(object sender, EventArgs e)
        {
            Button buton = ((Button)(sender));
            RepeaterItem rp1 = ((RepeaterItem)(buton.NamingContainer));
            Label lblSiparisDetayId = (Label)rp1.FindControl("lblSiparisDetayId");

            Response.Redirect("/SiparisDetay.aspx?detayId=" + lblSiparisDetayId.Text);
        }
    }
}