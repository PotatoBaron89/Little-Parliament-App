# README






## Endpoints

<hr>

#### *Server Status*
`/status`

### *Sessions*

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

- #### Delete user
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
  
  
  

  
    ## Part 2 Planning
    
    ###Breakdown
    
    Sam you are in charge of handling the frontend since you are pretty proficient with Rails and have less experience with React.
    Axel and Tia are colloborating on the frontend, since there is more work to do there and we want to prioritise creating a very high quality product for the user. 
    
    ### Notes
    
    - Breakdown of tasks in https://trello.com/b/1glz1Gcf/t3a2-fullstack, sued for larger scope issues.  Make sure we are tagging each other as necessary and linking to commits with relevant changes so that we can traceback issues if necessary.
    - More detailed tickets are handled on Jira, https://littleparliament.atlassian.net/jira/core/projects/LIT/board

### Screenshots of Planning
![Trello 1](https://user-images.githubusercontent.com/80095448/153744901-7710d1b2-d202-4ea4-87e8-4e48d36a2e67.PNG)
![Trello 2](https://user-images.githubusercontent.com/80095448/153744903-2e1bf311-0063-45cd-bb4d-8f3892235985.PNG)
![Trello 3](https://user-images.githubusercontent.com/80095448/153744905-40ff6761-c0db-42e5-9486-71fb01a201ff.PNG)
![Trello 4](https://user-images.githubusercontent.com/80095448/153744907-4d776190-c132-4385-adee-587223bbc660.PNG)
![Jira 1](https://user-images.githubusercontent.com/80095448/153744982-b2ae1567-6878-4542-8b78-c01d2238440a.png)
![Jira 2](https://user-images.githubusercontent.com/80095448/153744909-328467c4-0ed7-4895-9318-c5388e78d66b.PNG)
  
  
  
  
  
  # T3A2-A Full Stack Application 
# Axel Whitford / Sam O'Donnell / Tia Koenig

# Desciption of Website

## Client

'Little Parliament' and 'Our Store' is a quaint little cafe in Rainbow Beach that doubles up as a souvenir gift shop.
## Purpose and Functionality

Brief - Create a website for a cafe and souvenir store called Little Parliament. This website should act as a landing page for customers who don't know that Little Parliament exists yet. It will showcase the menu, a little bit about the cafe as well as the products that are for sale in the store. As Little Parliament is located in Rainbow Beach, a secluded tourist town, guests to the town like to have an idea of what is available before arriving at the town. This means the content on the website should be clear, concise, and not overwhelming.

The landing page should give a good quick synopsis about the cafe, as well as be alluring enough to make the user explore more of the page. The next page would be an about us page and would showcase more detail about why the cafe exists as well as a little information about the owners. The menu page would showcase the menu in a fun way; instead of just being a static image, it will be an interactive page that has a small description, image, and price of all the items on the menu. The products page would be a static image page that has a list of all current items in stock, with the ability to add these items to a cart, purchase them, and possibly reserve them for pick-up. 

As this will be a website with the possibility of becoming live, the owner of the cafe would like to be able to make changes without having to go through a developer. An admin panel where they can log in and add, update and delete products and menu items as the need arises. 

### Features 

#### Menu showcase 

This website will have an entire page dedicated to the Menu of Little Parliament. The menu will showcase each individual item that is on the menu, as well as a brief description of it, the price of the item, and an image that shows off the final product. The menu will be a free-flowing list with a little bit of animation to draw the attention of the user of the website to the products. The menu will also allow you to click onto each product and open a more detailed version of it. There will be the ability to filter the category of food items (coffee, Breakfast, Lunch), giving the user an easy way to browse the menu. 

#### Products Page/Cart 

As Little Parliament also has a souvenir/gift shop attached to it called 'Our Shop', we are implementing a products page that showcases all the items that are available in-store. The products will be purchasable from this page and will display a price, an image, and a small description. The product can also be clicked on to open a more detailed page that may showcase multiple images, a detailed description, and the ability to add it to a cart. 

The cart system will showcase everything you've added to the cart so far, a total of how much your order has accumulated. As well as give you the option to edit existing products, delete them or check out. 

The checkout system will be integrated with Stripe and allow the user to purchase items that have been first added to the cart. As this is a small beach town, the client doesn't wish to use post, so all users will be notified that their product is ready for pick-up via a mailing system. 


#### Mailing system

This project will implement a mailer system that will automatically email users after certain actions are completed. The most important action that is performed is sending users receipts as well as confirmation when products are purchased. This should be automatic and customizable so that each user gets a unique experience with the email. Users are also able to subscribe to an ongoing email newsletter that gives them updates on Little Parliament and Our Shop. 

#### Admin panel

As the Client wants to make this website live and isn't tech-savvy enough to understand how to implement code, she wants to be able to make changes and update the website. This is why an admin panel will be added, a secret area that lets her input sign-in details, which then takes her to an area that lets her perform certain actions on the website with ease. Actions such as:

- Products
      - Add / Remove / Edit Products
      - Adjust option to make certain products "Featured"
      - Maybe the ability to put items on sale (prob just for products)?
      - Stock tracking
- Menu
      - Ability to add/remove/edit products from the menu (different table to the products she sells)
      - Same deal about featured
      - Set item to sold out
- Newsletter [ Enabled / Disabled ]
      - Mailing list table
      - Some sort of an option to unsubscribe from the mailing list

These actions will be shown on an easy-to-understand UI dashboard that lets her make the changes live to the site. 

#### Stay-up-to-date 

There will be a stay up-to-date section on this website that will portray recent news to the viewers of this website. First and foremost this will be seen with an Instagram integration which will display the 5-6 most recent posts made by Little Parliament. There will also be links on this section that will take the user to the respective social media accounts. This will also be where users can subscribe to the ongoing email newsletter. 

### Additional nice-to-have features

#### Table ordering

A feature that would be nice to have is the ability to get to the menu page from an external QR code. Once there, it would be great if the user could order food from the menu, pay for it through the website and then have the food delivered to the kitchen through the pre-existing till system.

This would simplify the process of taking orders and handling payments but would be entirely dependent on the pre-existing systems within Little Parliament.

#### Reserving Items

Another nice to have feature for the Our Shop section of this website is the ability to put an item on hold. You've browsed the products and really want to pick something up but know you won't be able to get into the shop for another few days. This feature will allow users to have peace of mind that the product they have their eye on won't be sold out by the next time they swing by. 

## Target audience

The target audiences for the café website will include: 
- Current customers 
- Tourists 
- Cafe owner/staff 
- Any other locals in the area who may become repeat customers 
- Anyone looking for souvenirs or other nice products to take home from the cafes beautiful location of Rainbow Beach 
- People with specific dietary requirements as Little Parliament offers a range of dairy-free milk options, locally sourced ingredients and vegan food options. 

As such, the design and styling of the website will take this into account, offering a website that is appropriately themed to take this into account, and provides all of the features such an audience would come to expect such as - 

### Customers 

- Seeing photos and small descriptions of the souvenirs and products the cafe has available to buy 

- Seeing their entire menu with images, descriptions and ingredients so they can easily decide what they would like to eat/drink 

- Seeing the opening hours of the cafe, which will be kept up to date 

### Owner/staff 
- Being able to update the menu photos, descriptions and ingredients 

- Being able to delete menu items 

- Being able to add new menu items 

- Being able to update the opening hours on public holidays

## Tech stack

### Front end 
- React
  - Redux (State Management)
  - Tailwinds (CSS Framework)
  - Flow (Static Typescripting)
  - React Router (Routing)

### Back end 
- Rails
  - Sorbet (Type enforment)
  - ActiveRecord (ORM)
  - Devise + Bcrypt (for secure admin access)
  - Cancancan (Roles and permissions)

- PostgreSQL (Database)
- AWS S3  (External Data storage)

### Third-party
- Stripe (Payment)
- Heroku (Backend Hosting)
- Netlify (Frontend Hosting)
- AWS S3 (External Storage)

##	Dataflow Diagram

![Admin DFD](https://user-images.githubusercontent.com/80095448/151633448-bbf2b1ad-eee3-41ca-881d-441f916068b1.png)

![Customer DFD](https://user-images.githubusercontent.com/80095448/151636318-c2dd1144-fff7-48b6-b4de-ce78db87a14d.png)


##	Application Architecture Diagram

- Front-end hosted on Netlify
- Backend Hosted on Heroku
- External Data stored on AWS S3

![Little Parliament Application Architecture Diagram(2)](https://user-images.githubusercontent.com/80095448/151133886-39fabfe1-fc43-49a2-971c-60163a00cfe1.jpeg)

##	User Stories

### Version 1

#### User 

- As a user, I want to be able to read the writing on the website 

- As a user, I want to be able to see what products and souvenirs the cafe sells 

- As a user, I want to be able to see what kind of food and drinks the cafe sells so that i can decide if i want to eat there

- As a user, I want to see photos of their products and souvenirs 

- As a user, I want to see a description of each menu item so that customers can read what the item is

 #### Admin 

- As an admin, I want to be able to update the menu with new products and souvenirs 

- As an admin, I want to be able to delete items on the menu 

- As an admin, I want to be able to update/edit menu items so that i can add new items and edit items if they change ingredients

### Version 2

#### User 

- As a user, I want to be able to see what products and souvenirs the cafe sells 

- As a user, I want to be able to see what kind of food and drinks the cafe sells 

- As a user, I want to see what the cafe's opening hours are 

- As a user, I want to see photos of their products and souvenirs 

- As a user, I want to see photos of their menu items 

- As a user, I want to see the ingredient list of their menu items 

- As a user, I want to see a description of each menu item 
#### Admin 

- As an admin, I want to be able to update the menu with new products and souvenirs 

- As an admin, I want to be able to delete items on the menu 

- As an admin, I want to be able to update/edit menu items 

- As an admin, I want to be able to update/edit opening hours 

- As an admin, I want to be able to update/edit photos of menu items and products

### Final Version

#### User 

- As a user, I want to be able to see what products and souvenirs the cafe sells so that I can see if there is anything that interests me 

- As a user, I want to be able to see what kind of food and drinks the cafe sells so that I can see if they have something I would like to drink or eat for breakfast/lunch/dinner 

- As a user, I want to see what the cafe's opening hours are so that I know when they open and close before I go there 

- As a user, I want to see photos of their products and souvenirs so that I can clearly see what the product is 

- As a user, I want to see photos of their menu items so that I can decide if it looks like something I would like to eat 

- As a user, I want to see the ingredient list of their menu items so that I can make sure I like all of the ingredients 

- As a user, I want to see a description of each menu item so that I can decide if it is described as something I would like to eat

#### Admin 

- As an admin, I want to be able to update the menu with new products and souvenirs so that customers see exactly what we have to sell 

- As an admin, I want to be able to delete items on the menu so that if an item is unavailable, a customer can see it is not on the menu 

- As an admin, I want to be able to update/edit menu items so that if a substitution in the menu is needed, customers can still see an up to date menu 

- As an admin, I want to be able to update/edit opening hours so that customers won't have to travel and find we are closed, and so opening hours can be changed for holiday periods 

- As an admin, I want to be able to update/edit photos of menu items and products so that customers can see what each item will look like when they order it


##	Wireframes
### Sitemap
![Sitemap](https://github.com/Shadakai/Little-Parliament/raw/main/docs/Sitemap.png)
### Landing Page   
![Landing Page](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/landing/landing.png)
### About us page Desktop
![Abous us Desktop](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/about/About_us_-_Desktop.png)
### About us page Tablet
![About us Tablet](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/about/About_us_-_Tablet.png)
### About us page Mobile 
![About us Mobile](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/about/About_us_-_Mobile.png)
### Menu Page Catergories Desktop
![menu Desktop](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/Menu_page_-_Desktop1.png)
### Menu Page Catergory Display Desktop
![menu Desktop](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/Menu_page_-_Desktop1-page2.png)
### Menu Page Catergories Tablet
![menu Tablet](https://github.com/Shadakai/Little-Parliament/blob/main/docs/WireFrames/menu/Menu_page_-_Tablet1.png)
### Menu Page Catergory Display Tablet
![menu Tablet](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/Menu_page_-_Tablet1-page2.png)
### Menu Page Catergories Mobile
![menu Mobile](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/Menu_page_-_Mobile1.png)
### Menu Page Catergory Display Mobile
![menu Mobile](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/Menu_page_-_Mobile1-page2.png)
### Menu Item Detail page
![menu detailed](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/menu/menu_detailed.png)
### Products page
![products page](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/product/productView.png)
### Products Detail page
![products detailed](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/product/productDetailed.png)
### Cart
![cart](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/cart/cart.png)
### Checkout
![checkout](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/cart/checkout:stripe.png)
### Admin Panel login
![admin login](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/admin/adminlogin.png)
### Admin Panel
![admin panel](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/admin/adminpanel.png)
### Admin Panel item edit
![admin edit](https://github.com/Shadakai/Little-Parliament/raw/main/docs/WireFrames/admin/adminEdit.png)
##	Screenshots of Project Management
### Design 
![Trello Design stage](https://github.com/Shadakai/Little-Parliament/raw/main/docs/Trello/Design.png)
### Initial setup
![Trello Develop setup stage](https://github.com/Shadakai/Little-Parliament/raw/main/docs/Trello/Initial_dev_setup.png)

