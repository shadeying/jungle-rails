class OrderMailerPreview < ActionMailer::Preview

  def order_receipt
    OrderMailer.with(order: Order.first, line_items: Order.first.line_items).order_receipt
  end

end