//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Veritabani.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Recete
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Recete()
        {
            this.Sepet = new HashSet<Sepet>();
        }
    
        public int Id { get; set; }
        public Nullable<int> DoktorId { get; set; }
        public Nullable<int> IlacId { get; set; }
        public Nullable<int> HastaId { get; set; }
        public Nullable<int> Adet { get; set; }
        public Nullable<int> SepettekiAdet { get; set; }
        public Nullable<int> AlinanAdet { get; set; }
        public Nullable<System.DateTime> OlusturmaTarihi { get; set; }
    
        public virtual Hasta Hasta { get; set; }
        public virtual Ilac Ilac { get; set; }
        public virtual Yonetici Yonetici { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sepet> Sepet { get; set; }
    }
}
