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

    public partial class Cliente
    {
        public Cliente()
        {
            this.Cita = new HashSet<Cita>();
            this.Factura = new HashSet<Factura>();
            this.Paciente = new HashSet<Paciente>();
        }

        public int Id_Cliente { get; set; }
        public int Id_Persona { get; set; }
        public int Id_Estado { get; set; }
        public string NombreCompleto
        {
            get
            {
                return Persona.Nombre + " " + Persona.Apellidos;
            }
        }
        public virtual ICollection<Cita> Cita { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual ICollection<Factura> Factura { get; set; }
        public virtual ICollection<Paciente> Paciente { get; set; }
        public virtual Persona Persona { get; set; }
    }
}