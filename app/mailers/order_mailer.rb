class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    @line_items = order.line_items
    mail(to: @order.email, subject: "Order Receipt for ##{@order.id}")
  end

end
