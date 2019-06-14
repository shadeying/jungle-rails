class OrderMailerPreview < ActionMailer::Preview

  def order_receipt
    OrderMailer.order_receipt(Order.first)
  end

end