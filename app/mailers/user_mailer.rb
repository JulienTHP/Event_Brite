class UserMailer < ApplicationMailer
  default from: 'no-reply@vive-rspec.fr'
 
  def welcome_email(user)
    @user = user 
   
    @url  = 'http://amortlestests.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue chez nous ! Faites des tests !') 
  end
end