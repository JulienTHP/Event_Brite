class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@vive-rspec.fr'
 
  def new_attendant(event)
    @event = event 
    @url  = 'http://amortlestests.fr/login' 

    mail(to: @event.admin.email, subject: 'Il y a un nouvel inscrit') 
  end
end