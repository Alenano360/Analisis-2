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
    using System.ComponentModel.DataAnnotations;
    
    public partial class Detalle_Factura
    {
        public int Id_Detalle { get; set; }
        public int Numero_Factura { get; set; }
        //[Required(ErrorMessage = "El campo de Producto es requerido")]
        //[Display(Name = "Producto")]  
        public int Id_Producto { get; set; }
        //[Required(ErrorMessage = "El campo de Cantidad es requerido")]
        //[Display(Name = "Cantidad")]  
        public int Cantidad { get; set; }
        //[Required(ErrorMessage = "El campo de Precio Total Producto es requerido")]
        //[Display(Name = "Precio_Total_Producto")] 
        public int Precio_Total_Producto { get; set; }
        //[Required(ErrorMessage = "El campo de Precio Unitario es requerido")]
        //[Display(Name = "Precio_Unitario")] 
        public int Precio_Unitario { get; set; }
    
        public virtual Factura Factura { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
