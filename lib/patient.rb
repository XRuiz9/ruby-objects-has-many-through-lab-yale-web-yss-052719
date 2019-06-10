class Patient
	attr_reader :name
	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	def new_appointment(doc, date)
		Appointment.new(date, self, doc)
	end

	def appointments
		Appointment.all.select do |app|
			app.patient == self
		end
	end

	def doctors
		self.appointments.map do |app|
			app.doctor
		end
	end

	def self.all
		@@all
	end
end
