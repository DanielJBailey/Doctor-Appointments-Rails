time_frames = [:morning, :afternoon]

5.times do
  doctor = Doctor.create(
    name: Faker::Name.name
  )
  100.times do 
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      dob: Faker::Date.birthday(18, 100),
      age: nil
    )
    2.times do
      Appointment.create(
        date: Faker::Date.forward(60).to_date,
        time: Faker::Time.forward(2, :morning),
        patient_id: patient.id,
        doctor_id: doctor.id
      )
    end
  end
end

@patients = Patient.all
@patients.each do |p|
    age = (Time.current.year - p.dob.year)
    p.update(age: age)
end
