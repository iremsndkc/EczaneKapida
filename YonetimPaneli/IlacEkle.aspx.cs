using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace YonetimPaneli
{
    public partial class IlacEkle : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["yoneticiId"] == null || (bool)Session["yoneticiYetki"] == false)
            {
                Response.Redirect("/Giris.aspx");
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAd.Text)||string.IsNullOrEmpty(txtFiyat.Text)|| string.IsNullOrEmpty(txtKargo.Text))
            {
                lblHata.Text = "Bilgileri eksiksiz giriniz!";             
            }
            else
            {
                string uzanti, resim = "-";
                if (FileUpload1.HasFile == true)
                {
                    uzanti = System.IO.Path.GetExtension(FileUpload1.FileName);
                    if (uzanti == ".jpg" || uzanti == ".jpeg" || uzanti == ".png")
                    {
                        FileUpload1.SaveAs(("C:\\Users\\user\\Desktop\\EczaneKapida\\EczaneKapida\\IlacResimleri\\") + FileUpload1.FileName);
                        resim = FileUpload1.FileName.ToString();
                    }
                }
               context.Ilac.Add(new Ilac
                   {
                       Ad=txtAd.Text,
                       Aciklama=txtAciklama.Text,
                       Fiyat=Convert.ToDecimal(txtFiyat.Text),
                       KargoFiyati = Convert.ToDecimal(txtKargo.Text),
                       Resim=resim,
                       OlusturmaTarihi=DateTime.Now,
                   });
               context.SaveChanges();
               lblHata.Text = "İlaç başarıyla eklendi";
            }
        }
    }
}