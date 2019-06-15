# Jungle :deciduous_tree:

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

## Screenshots
!["Home page"](https://github.com/shadeying/jungle-rails/blob/master/docs/home.png?raw=true)
!["Product show page"](https://github.com/shadeying/jungle-rails/blob/master/docs/product.png?raw=true)
!["Admin authentication"](https://github.com/shadeying/jungle-rails/blob/master/docs/admin.png?raw=true)
!["Cart show page"](https://github.com/shadeying/jungle-rails/blob/master/docs/cart.png?raw=true)
!["User payment page"](https://github.com/shadeying/jungle-rails/blob/master/docs/user-payment.png?raw=true)
!["User order page"](https://github.com/shadeying/jungle-rails/blob/master/docs/user-order.png?raw=true)
!["Order receipt"](https://github.com/shadeying/jungle-rails/blob/master/docs/order-receipt.png?raw=true)
!["Guest payment page"](https://github.com/shadeying/jungle-rails/blob/master/docs/guest-payment.png?raw=true)
!["Guest order page"](https://github.com/shadeying/jungle-rails/blob/master/docs/guest-order.png?raw=true)

## Setup

1. Fork & Clone this repo.
2. Run `bundle install` to install dependencies.
3. Create `config/database.yml` by copying `config/database.example.yml`.
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
5. Run `bin/rake db:reset` to create, load and seed db.
6. Create .env file based on .env.example.
7. Sign up for a Stripe account.
8. Put Stripe (test) keys into appropriate .env vars.
9. Run `bin/rails s -b 0.0.0.0` to start the server.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
