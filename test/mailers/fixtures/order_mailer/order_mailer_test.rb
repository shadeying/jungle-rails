require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "order_receipt" do
    # Send the email, then test that it got queued
    email = OrderMailer.order_receipt(Order.first, Order.first.line_items).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['no-reply@jungle.com'], email.from
    assert_equal ['kvirani@gmail.com'], email.to
    assert_equal 'Order Receipt for #1', email.subject
    assert_equal read_fixture('order_receipt').join, email.body.to_s
  end
end