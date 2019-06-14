class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_receipt(order, line_items)
    @order = order
    @line_items = line_items
    mail(to: @order.email, subject: "Order Receipt for ##{@order.id}")
  end

end
