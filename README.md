# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Photo examples

![Reviews can be made and deleted by same user](https://github.com/char55/jungle-rails/blob/master/public/readme_pics/reviews.png)

![basic HTML authorization needed for access to admin pages](https://github.com/char55/jungle-rails/blob/master/public/readme_pics/basicAutho.png)

![after a purchase is made - user can view their order (email is also sent)](https://github.com/char55/jungle-rails/blob/master/public/readme_pics/order.png)


## Features

* User can look over catalogue of items
  * add them to cart with a button click adding the item to the cart
* Cart is located top right corner
  * user can increase quantity of each item in their cart
  * user can delete any item they no longer desire from their cart
* Each product has
  * a name
  * a description
  * a price
  * a catagory
  * reviews
    * a numbered rating and a review description
    * All visitors can view reviews
    * Users must be logged in to post reviews
    * Users can delete a review they previously wrote


* Admin control
  * requires basic HTML authorization to access
  * can create/add a new category
  * can delete any new category
  * can create/add a new product
  * can delete any a new product

