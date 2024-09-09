User.create(username: 'doctor', password: '1234')
User.create(username: 'admin', password: 'admin')

Patient.create(
    nombre: 'Juan',
    apellido: 'Pérez',
    fecha_nacimiento: '1985-06-15',
    tipo_documento: 'Cédula Ciudadanía',
    numero_documento: '12345678',
    direccion: 'Carrera 1 # 10-20',
    ciudad: 'Bogotá',
    telefono: '555-1234',
    estado_civil: 'Soltero/a',
    sexo: 'Masculino',
    raza: 'Mestizo',
    tipo_sangre: 'O+',
    ocupacion: 'Ingeniero',
    eps: 'EPS Salud',
    alergias: 'Ninguna',
    cirugias: 'Ninguna',
    emergency_nombre: 'Ana Pérez',
    emergency_direccion: 'Carrera 2 # 15-30',
    emergency_ciudad: 'Bogotá',
    emergency_telefono: '555-5678',
    emergency_relacion: 'Hermana'
)

Patient.create(
    nombre: 'María',
    apellido: 'Gómez',
    fecha_nacimiento: '1990-11-22',
    tipo_documento: 'Tarjeta De Identidad',
    numero_documento: '87654321',
    direccion: 'Avenida 5 # 20-40',
    ciudad: 'Medellín',
    telefono: '555-6789',
    estado_civil: 'Casado/a',
    sexo: 'Femenino',
    raza: 'Blanco',
    tipo_sangre: 'A+',
    ocupacion: 'Docente',
    eps: 'EPS Salud',
    alergias: 'Polen',
    cirugias: 'Apendicitis',
    emergency_nombre: 'Pedro Gómez',
    emergency_direccion: 'Avenida 6 # 25-50',
    emergency_ciudad: 'Medellín',
    emergency_telefono: '555-9876',
    emergency_relacion: 'Cónyuge'
)
puts "Seeding data..."
