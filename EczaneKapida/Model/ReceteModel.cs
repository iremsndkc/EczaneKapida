using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EczaneKapida.Model
{
    public class ReceteModel
    {
        public int Id { get; set; }
        public int IlacId { get; set; }
        public int HastaId { get; set; }
        public int ReceteId { get; set; }
        public string UrunAd { get; set; }
        public string UrunResim { get; set; }
        public double UrunFiyat { get; set; }
        public double UrunKargo { get; set; }
        public int UrunAdet { get; set; }
        public double UrunToplam { get; set; }
    }
}