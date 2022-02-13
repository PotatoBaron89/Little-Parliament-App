# README


##Endpoints

<hr>

####*Server Status*
`/status`

###*Sessions*

- #### Login / Create a Session
`/session` > `POST`

Requires `email` and `password` parameters, `optional:` `password_confirmation`

- #### Check session status
`/logged_in?` > `GET`

- #### Logout / End session
`/log_out` > `DELETE`


### *Registration*
Public Endpoint, anyone can create an account. Will have the lowest level of access rights by default.

- #### Create new users

`/registrations` > `POST`
Requires `email` and `password` parameters


### *Users*

***Admin only*** endpoint, can perform CRUD actions on any user.

- #### Create new users

`/users` > `POST` 
Requires `email` and `password` parameters

- #### Edit user
**nb, currently does not ask you to check against current password if you change it.**

`/users` > `PATCH`
Requires `email` and `password` parameters

- #### Edit user
**Use with caution.**

`/users/user_id.json` > `DELETE`

- #### Show user
**Use with caution.**

`/users/user_id.json` > `GET`

- #### User Index

`/users` > `GET`


### *Food / Drinks / Products*
*Index and show endpoints are public, the rest require auth.*

#### Food
```json
    "title": Required, must be unique
    "description": optional
    "price": Required, must be positive int
    "image": optional: returns a url, when posting it must be a file, not a url
    "category": default: any breakfast lunch dinner
    "meal_category": vegan vegetarian default: standard
```

#### Drinks
```json
    "title": Required, must be unique
    "description": optional
    "image": optional: returns a url, when posting it must be a file, not a url
    "price": Required, must be positive int
    "category": (optional) cold hold alcholol
```

#### Products
```json
    "title": Required, must be unique
    "description": optional
    "price": Required, must be positive int
    "image": optional: returns a url, when posting it must be a file, not a url
    "featured": (default) false
    "qty": (default, 1)
    "sale_percent": default 0. Must be a whole, eg 30% would be 30, not (.3)
```

#### Index

```
/foods` > 'GET'
/drinks` > 'GET'
/products` > 'GET'
```
#### Show

```
/foods/food_id.json` > 'GET'
/drinks/drink_id.json` > 'GET'
/products/product_id.json` > 'GET'
```

#### Create
```
/foods` > 'POST'
/drinks` > 'POST'
/products` > 'POST'
```
#### Update

```
/foods/food_id.json` > 'PATCH'
/drinks/drink_id.json` > 'PATCH'
/products/product_id.json` > 'PATCH'
```

#### DELETE

```
/foods/food_id` > 'DELETE'
/drinks/drink_id.json` > 'DELETE'
/products/product_id.json` > 'DELETE'
```


## Gems Used

- **PG**
  - The gem for handling postgres database, which handles alll of our storage.
- **Bcrypt**
  - Bcrypt is used to hash / salt passwords and any other senstive data.
- **Rack-cors**
  - Necessary for our API, allows web applications to make cross domain AJAX calls.
- **AWS-SDK-S3**
  - Necessary for file hosting to S3, used in tandem with ActiveRecord. Allows us to easy upload files to an AWS S3 buckeet.
- **Rolify**
  - Used to handle the creation of user roles.  Currently planned to have guests, registered users and admins.  Yet to be fully implemented.
- **Pundit**
  - Used to handle authentication, currently in the process of switching over from a custom setup to the more robust system that Pundit provides.
- **Dotenv-rails**
    - Allows us to use .env files withion our rails app.
- **Better Errors**
  - Provides a far more useful debugging tool, whilst far less useful with an API application it still comes in useful from time to time.
- **Pry**
  - Another debugging tool, similar to `irb` but with more features and capabilities.
- **Amazing Print**
  - Another useful dev tool that is similar to using `puts` but displays far more readable text. Very handy for when you have to parse server logs.
  