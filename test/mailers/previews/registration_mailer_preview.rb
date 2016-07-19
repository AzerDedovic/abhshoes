# Preview all emails at http://localhost:3000/rails/mailers/registration_mailer
class RegistrationMailerPreview < ActionMailer::Preview
def registration_mail_preview
    RegistrationMailer.registration_email(User.first)
  end
end
