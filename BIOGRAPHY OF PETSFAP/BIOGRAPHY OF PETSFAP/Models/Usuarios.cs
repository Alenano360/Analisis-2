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
    
    public partial class Usuarios
    {
        public int Id_Usuario { get; set; }
        [Required]
        [Range(1, 100, ErrorMessage = "El campo de Empleado es requerido")]
        [Display(Name = "Empleado")]
        public int Id_Empleado { get; set; }
        [Required(ErrorMessage = "El campo de Correo es requerido")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Correo")]
        public string Correo { get; set; }
        [Required(ErrorMessage = "El campo de Usuario es requerido")]
        [DataType(DataType.Text)]
        [Display(Name = "Usuario")]
        public string Usuario { get; set; }
        [Required(ErrorMessage = "El campo de Contraseña es requerido")]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Contraseña { get; set; }
        [Required(ErrorMessage = "El campo de Rol es requerido")]
        [Display(Name = "Rol")]
        public int Id_Rol { get; set; }
        public int Id_Estado { get; set; }
    
        public virtual Empleado Empleado { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual Roles Roles { get; set; }
    }
}
