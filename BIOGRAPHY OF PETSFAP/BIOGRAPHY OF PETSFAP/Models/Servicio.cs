//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BIOGRAPHY_OF_PETSFAP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Servicio
    {
        public Servicio()
        {
            this.Detalle_Servicio = new HashSet<Detalle_Servicio>();
        }
    
        public int Id_Servicio { get; set; }
        public string Nombre { get; set; }
        public string Detalle { get; set; }
        public int Costo { get; set; }
        public double Tiempo { get; set; }
        public int Id_Estado { get; set; }
    
        public virtual ICollection<Detalle_Servicio> Detalle_Servicio { get; set; }
        public virtual Estado Estado { get; set; }
    }
}
