package Modelo;

public class Paciente {
    private int id;
    private String nombre;
    private String apellido;
    private String fechaNacimiento;
    private String tipoId;
    private String numeroDocumento;
    private String direccion;
    private String ciudad;
    private String telefono;
    private String estadoCivil;
    private String sexo;
    private String raza;
    private String tipoSangre;
    private String ocupacion;
    private String eps;
    private String alergias;
    private String cirugias;
    private String emergencyNombre;
    private String emergencyDireccion;
    private String emergencyCiudad;
    private String emergencyTelefono;
    private String emergencyRelacion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public Paciente() {
    }

    public Paciente(int id, String nombre, String apellido, String fechaNacimiento, String tipoId, String numeroDocumento, String direccion, String ciudad, String telefono, String estadoCivil, String sexo, String raza, String tipoSangre, String ocupacion, String eps, String alergias, String cirugias, String emergencyNombre, String emergencyDireccion, String emergencyCiudad, String emergencyTelefono, String emergencyRelacion) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.tipoId = tipoId;
        this.numeroDocumento = numeroDocumento;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.telefono = telefono;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.raza = raza;
        this.tipoSangre = tipoSangre;
        this.ocupacion = ocupacion;
        this.eps = eps;
        this.alergias = alergias;
        this.cirugias = cirugias;
        this.emergencyNombre = emergencyNombre;
        this.emergencyDireccion = emergencyDireccion;
        this.emergencyCiudad = emergencyCiudad;
        this.emergencyTelefono = emergencyTelefono;
        this.emergencyRelacion = emergencyRelacion;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTipoId() {
        return tipoId;
    }

    public void setTipoId(String tipoId) {
        this.tipoId = tipoId;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
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

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
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

    public String getEmergencyNombre() {
        return emergencyNombre;
    }

    public void setEmergencyNombre(String emergencyNombre) {
        this.emergencyNombre = emergencyNombre;
    }

    public String getEmergencyDireccion() {
        return emergencyDireccion;
    }

    public void setEmergencyDireccion(String emergencyDireccion) {
        this.emergencyDireccion = emergencyDireccion;
    }

    public String getEmergencyCiudad() {
        return emergencyCiudad;
    }

    public void setEmergencyCiudad(String emergencyCiudad) {
        this.emergencyCiudad = emergencyCiudad;
    }

    public String getEmergencyTelefono() {
        return emergencyTelefono;
    }

    public void setEmergencyTelefono(String emergencyTelefono) {
        this.emergencyTelefono = emergencyTelefono;
    }

    public String getEmergencyRelacion() {
        return emergencyRelacion;
    }

    public void setEmergencyRelacion(String emergencyRelacion) {
        this.emergencyRelacion = emergencyRelacion;
    }
}