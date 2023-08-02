class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation_email
    @user = params[:user]
    @order = params[:order]
    message = mail(to: @user.email, subject: "Order Processed - Jungle - OrderID ##{@order.id}")
  end
end
