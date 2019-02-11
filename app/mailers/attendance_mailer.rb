class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'

	def confirmation_email(admin_id)
		@admin = admin_id


		@url = 'http://monsite.fr/login'

		mail(to: @admin, subject: 'Participation enregistrée!')
	end
end


