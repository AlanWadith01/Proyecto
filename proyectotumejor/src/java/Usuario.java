package Modelo;

import java.util.Date;

public class Usuario {
    private String tipoId; // C.C, T.I, C.E
    private int id;
    private String nombres;
    private String apellidos;
    private Date fechaNacimiento;
    private int edad;
    private String tipoSangre; // A+, A-, B+, B-, O+, O-, AB+, AB-
    private String sexo; // Masculino, Femenino
    private String estadoCivil; // Solter@, Casad@, Divorciad@, Viud@
    private String razaEtnica; // Meztizo, Afrodescendiente, Blanco, Indígena, Mulato, Asiático, Otro
    private String direccion;
    private String ciudad;
    private String telefono;
    private String ocupacion;
    private String eps;
    private String alergias;
    private String cirugias;
    private String email;
    private String nombreContactoEmer;
    private String apellidoConEmer;
    private String telefonoContacto;
    private String direccionContacto;
    private String relacion;
    private String usuario;
    private String contrasena;
    private String tipo; // Tipo de usuario

    // Constructor
    public Usuario() {}

    // Getters and Setters
    public String getTipoId() {
        return tipoId;
    }

    public void setTipoId(String tipoId) {
        this.tipoId = tipoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getRazaEtnica() {
        return razaEtnica;
    }

    public void setRazaEtnica(String razaEtnica) {
        this.razaEtnica = razaEtnica;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getEps() {
        return eps;
    }

    public void setEps(String eps) {
        this.eps = eps;
    }

    public String getAlergias() {
        return alergias;
    }

    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    public String getCirugias() {
        return cirugias;
    }

    public void setCirugias(String cirugias) {
        this.cirugias = cirugias;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombreContactoEmer() {
        return nombreContactoEmer;
    }

    public void setNombreContactoEmer(String nombreContactoEmer) {
        this.nombreContactoEmer = nombreContactoEmer;
    }

    public String getApellidoConEmer() {
        return apellidoConEmer;
    }

    public void setApellidoConEmer(String apellidoConEmer) {
        this.apellidoConEmer = apellidoConEmer;
    }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getDireccionContacto() {
        return direccionContacto;
    }

    public void setDireccionContacto(String direccionContacto) {
        this.direccionContacto = direccionContacto;
    }

    public String getRelacion() {
        return relacion;
    }

    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}