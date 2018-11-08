class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt(recipient)
    @products = Product.all
    @account = recipient
    mail(to: recipient[:user], subject: recipient[:order_id])
  end
end
