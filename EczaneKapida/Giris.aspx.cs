using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace EczaneKapida
{
    public partial class Giris : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(txtTCKN.Text))
            {
                var receteListesi = context.Hasta.Where(x => x.TCKN == txtTCKN.Text);
                if (receteListesi == null || receteListesi.Count()<=0)
                {
                    lblHata.Text = "Sistemde reçeteniz bulunmamaktadır!";
                }
                else
                {
                    Session["HastaId"] = receteListesi.FirstOrDefault().Id;
                    Response.Redirect("/Recete.aspx");
                }
            }
            else
            {
                lblHata.Text = "Güvenlik kodunu kontrol ediniz!";
                //Response.Write("<script> alert('Güvenlik kodunu kontrol ediniz')</script>");
            }
        }
    }
}