natura = Salon.create(horario: '09:30-15-30', localizacion: 'Granada', nombre: 'Natura')
barbershop = Salon.create(horario: '09:30-18-30', localizacion: 'Sevilla', nombre: 'BarberShop')
oche = Salon.create(horario: '10:00-19:00', localizacion: 'Cadiz', nombre: 'Oche')
hair_dresser = Salon.create(horario: '10:00-20:00', localizacion: 'Almeria', nombre: 'HairDresser')

Appointment.create(persona: 'Pablo Rodriguez',fecha: '07/06/2021', hora: '09:30', telefono: 123456789, salon: natura)
Appointment.create(persona: 'Miguel Medina',fecha: '07/06/2021', hora: '10:30', telefono: 123456389, salon: oche)
Appointment.create(persona: 'Jose Escribano',fecha: '07/06/2021', hora: '10:00', telefono: 123424789, salon: hair_dresser)