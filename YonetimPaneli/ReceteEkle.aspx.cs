using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace YonetimPaneli
{
    public partial class ReceteEkle : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IlacListeleme();
            }
            
        }

        protected void btnReceteEkle_Click(object sender, EventArgs e)
        {
            // sessiondaki kullanıcı idsini alıyoruz 
            string hastaTC = txtTCKN.Text;
            int doktorId = 1;//Convert.ToInt32(Session["yoneticiId"].ToString());
            var hasta = context.Hasta.Where(x => x.TCKN == hastaTC).FirstOrDefault();
            // dropboxtaki seçili değerin adını alıyoruz.
            var ilacAd = ddlIlaclar.SelectedValue;
            // ilacın idsini buluyoruz
            var ilacId = context.Ilac.Where(x => x.Ad == ilacAd).FirstOrDefault();

            // ilaç seçiniz kontrol ediyor 
            if (ddlIlaclar.SelectedValue != "0")
            {
                if (hasta != null)
                {
                    HastaReceteEkle(doktorId, hasta.Id,ilacId.Id);
                }
                else
                {
                    var yeniHasta = new Hasta();
                    yeniHasta.TCKN = hastaTC;

                    var eklenenUye = context.Hasta.Add(yeniHasta);
                    context.SaveChanges();
                    HastaReceteEkle(doktorId, eklenenUye.Id,ilacId.Id);
                }
            }
            else
                lblHata.Text = "İlaç Seçiniz!";
        }

        
        public void HastaReceteEkle(int doktorId,int hastaId, int ilacId)
        {
            // hastaya aynı ilaç yazılmış mı kontrolü yapılıyor, eğer aynı ilaç yazıldıysa adetini yükseltiyor
            var ilacKontrol = context.Recete.Where(x => x.HastaId == hastaId && x.IlacId == ilacId).FirstOrDefault();
            if (ilacKontrol==null)
            {
                context.Recete.Add(new Recete
                {
                    DoktorId = doktorId,//sessiondan gelecek
                    HastaId = hastaId,//yazılan tc kimlik no
                    IlacId = ilacId,// dropdowndan gelecek
                    Adet = Convert.ToInt32(txtAdet.Text),
                    SepettekiAdet = 0,
                    AlinanAdet = 0,
                    OlusturmaTarihi=DateTime.Now,
                    // değişen yer3 durum kaldırıldı
                });

            }
            else
            {
                ilacKontrol.Adet += 1;
            }
            txtAdet.Text = null;
            txtTCKN.Text = null;
            ddlIlaclar.SelectedIndex = 0;
            lblHata.Text = "Reçete başarıyla eklendi!";
           
            context.SaveChanges();
        }
        //aktif olan ilaçları listeyip dropdown basıyor
        public void IlacListeleme()
        {
            var ilaclar = context.Ilac.ToList();
            foreach (var item in ilaclar)
            {
                ddlIlaclar.Items.Add(item.Ad);
            }
            
        }

    }
}