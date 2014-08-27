class NoticeMailer < ActionMailer::Base
  default from: "m.kwgch@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    
    @greeting = "Hi"

    mail to:      "ducky19999@hotmail.com", #"to@example.org",
         subject: "新しいコメントが登録されました。"
  end
end
