class UserMailer < ApplicationMailer
  default :from => 'aquenzitech@gmail.com'

  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def receipt_email(user, receipt, cart)
    @user = user
    @receipt = receipt
    @cart = cart
    @url  = 'https://darknet2.herokuapp.com/'
    mail( :to => @user.email,
    :subject => 'Thanks for shopping at our amazing app' )
  end

  def welcome_email(user)
    @user = user
    @url  = 'https://darknet2.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
