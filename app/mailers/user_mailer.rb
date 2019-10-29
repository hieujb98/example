class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: I18n.t("user_mailer.account.activation")
  end

  def password_reset
    @user = user
    mail to: user.email, subject: I18n.t("user_mailer.account.password_reset")
  end
end
