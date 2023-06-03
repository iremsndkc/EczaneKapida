using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YonetimPaneli.Model
{
    public class SiparisModel
    {
        public int SiparisDetayId { get; set; }
        public int HastaId { get; set; }
        public int SiparisId { get; set; }
        public int ReceteId { get; set; }
        public int IlacId { get; set; }
        public int SiparisNo { get; set; }
        public decimal ToplamPuan { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string Email { get; set; }
        public string Gsm { get; set; }
        public string Tc { get; set; }
        public string Adres { get; set; }
        public string Il { get; set; }
        public string Ilce { get; set; }
        public string OdemeTipi { get; set; }
        public string VergiDairesi { get; set; }
        public string PostaKodu { get; set; }
        public string SiparisDurumu { get; set; }
        public string UrunResim { get; set; }
        public string UrunAd { get; set; }
        public decimal UrunFiyat { get; set; }
        public decimal UrunKargo{ get; set; }
        public int UrunAdet { get; set; }
        public decimal UrunToplam { get; set; }
        public DateTime OlusturmaTarihi { get; set; }

    }
}