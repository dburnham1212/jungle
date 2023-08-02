# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

# Screenshots

### Jungle - Home Page (To browse all plants in the collection)

Displays all of the plants currently in the collection and allows you to add plants to your cart for purchase!

!["Screenshot of home page (To browse all plants in the collection)!"](https://github.com/dburnham1212/jungle/blob/master/public/screenshots/Jungle_homepage.png)

### Jungle - Evergreens Category Page (To view products in the Evergreens category)

Evergreens category page, like the home page allows you to add plants to your cart for purchase!

!["Screenshot of evergreens page (display evergreens category)!"](https://github.com/dburnham1212/jungle/blob/master/public/screenshots/Evergreens_page.png)

### Jungle - My Cart Page

My Cart page allows you to check out your purchase and confirm your order

!["My cart page!"](https://github.com/dburnham1212/jungle/blob/master/public/screenshots/My_Cart_Page.png)

### Jungle - Login Page

Simple login page to allow users to use their credentials and login to the app to interact with the site.

!["Screenshot of login page!"](https://github.com/dburnham1212/jungle/blob/master/public/screenshots/Login_Page.png)

### Jungle - Registration Page

Users can create new credentials which will be saved on the server. They can then login and browse plants on the site!

!["Screenshot of registration page!"](https://github.com/dburnham1212/jungle/blob/master/public/screenshots/Signup_page.png)

# Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

# Getting Started

1. Run `bundle install` to install dependencies
4. Run `bin/rails db:reset` to create, load and seed db
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>