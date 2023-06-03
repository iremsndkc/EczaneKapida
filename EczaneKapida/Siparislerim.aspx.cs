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
    public partial class Siparislerim : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisGetir();
            }
            if (Session["HastaId"]==null)
            {
                Response.Redirect("/Giris.aspx");
            }
        }
        public void SiparisGetir()
        {
            List<SiparisModel> siparisModelListesi = new List<SiparisModel>();
            int hastaId=Convert.ToInt32(Session["HastaId"].ToString());
            var siparisListesi = context.Siparis.Where(x => x.HastaId == hastaId).ToList();
            foreach (var siparis in siparisListesi)
            {
                var siparisDetayListesi = context.SiparisDetay.Where(x => x.SiparisId == siparis.Id).ToList();

                foreach (var siparisDetay in siparisDetayListesi)
                {
                    var siparisModel = new SiparisModel();
                    siparisModel.Id = siparisDetay.Id;
                    siparisModel.SiparisNo = (int)siparis.SiparisNo;
                    siparisModel.OlusturmaTarihi = (DateTime)siparisDetay.OlusturmaTarihi;
                    siparisModel.SiparisDurumu = siparisDetay.SiparisDurumu;

                    siparisModelListesi.Add(siparisModel);
                }
            }
            dtSiparis.DataSource = siparisModelListesi.OrderByDescending(x=>x.OlusturmaTarihi);
            dtSiparis.DataBind();
        }

        protected void btnSiparisDetay_Click(object sender, EventArgs e)
        {
            LinkButton buton = ((LinkButton)(sender));
            RepeaterItem rp1 = ((RepeaterItem)(buton.NamingContainer));
            Label lblId = (Label)rp1.FindControl("lblId");

            Response.Redirect("/SiparislerimDetay.aspx?DId=" + lblId.Text);
        }
        
    }
}