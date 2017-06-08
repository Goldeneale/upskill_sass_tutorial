class ContactMailer < ActionMailer::Base
    default to: 'goldenwing42@gmail.com'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subect: 'Contact Form Message')
    end
end