class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: "kaleidliner.illyasviel@gmail.com", subject: "お問い合わせについて【自動送信】"
  end

end
