class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_receipt
    @order = params[:order]
    @line_items = params[:line_items]
    mail(to: @order.email, subject: 'Order Receipt for #{@order.id}')
  end

end
