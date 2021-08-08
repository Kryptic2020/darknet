# README


## Table of Contents: 

[Links](#links)  
[Setup Instructions & Logins](#setup)  
[Problem](#problem)   
[App Overview](#overview)  
[User Stories](#userstories)  
[Target Audience](#targetaudience)   
[Tech Stack](#techstack)   
[Planning & Project Management](#projectmgnt)   
[Wireframes & Sitemap](#wireframes)  
[schema](#schema)   
[Entity Relationships](#relations)  
[Third Party Services](#thirdparty)  

--- 
<a name="links"/></a>

# R7	Identification of the problem you are trying to solve by building this particular marketplace app.

# R8	Why is it a problem that needs solving?

# R9 Visit Darknet website at:  	
### https://darknet2.herokuapp.com/  


# R10	Visit GitHub repository (repo) at:  
### https://github.com/Kryptic2020/darknet  


<a name="links"/></a>  

# R11	Darknet app description:    

 ### Purpose
   Darknet aim to reach a global e-commerce scale, connecting millions of buyers and sellers from all markets. Darknet provides economic opportunity to every individuals with no exception, it includes entrepreneurs, businesses and organizations, does not matter how big or small size they are.
 ### Functionality / features:
 - Local authentication  - Register, Login, Forgot password and Update password.
 - View listing - Search and filtering by categories, price ascending and descending, name ascending and descending.
 - Message Seller.  
 - View product details.  
 - Add prodcut to or remove from favorite list.  
 - View favorite list.  
 - Add product to a cart.  
 - View carts, view cart, view cart-items.  
 - Delete or update cart, delete or update cart-items.  
 - Add or edit shipping information.  
 - Process a cart payment using credit card with stripe.  
 - Access any current and previous carts and its details such as receipt, quantity, amount, title, description and much more.  
 - Receive a sign up welcome email.  
 - Receive a payment receipt by email.  
 - Add or remove a selling product.  
 - See a list of your selling products.  
 - See and update your selling products.  
 - See a dashboard with performance of your selling products, such as total revenue, total sold, total available.  
 - See an inbox of queries for your products from potential or current buyers, only unanswered client will be listed on your inbox.  
 - Message back your clients.   


  - 
 ## Sitemap 
 ![SITEMAP](./app/assets/images/darknet-Sitemap.png)
 
 ## Landing Page  
 ![LANDING](./app/assets/images/Landing!.png)  
 ## Listing Page  
 ![Listings](./app/assets/images/Listings!.png)    
 ![Listings2](./app/assets/images/Listings!!.png)  
 ## Show Product Page  
 ![ShowProduct](./app/assets/images/ShowProduct!.png)  
 ![ShowProduct2](./app/assets/images/ShowProduct!!.png)  
 ## Carts Page  
 ![Carts](./app/assets/images/Carts!.png)  
 ## Cart Page  
 ![Cart](./app/assets/images/Cart!.png)  
 ## Cart-Items Page  
 ![CartItem](./app/assets/images/CartItem!.png)  
 ## Message Seller Page  
 ![MessageSeller](./app/assets/images/MessageSeller!.png)  
 ## Favorites Page  
 ![Favorites](./app/assets/images/Favorites!.png)  
 ## Shipping Page  
 ![Shipping](./app/assets/images/Shipping!.png)  
 ## Payment Page  
 ![Stripe](./app/assets/images/Stripe.png)  
 ## Payment Confirmation Page  
 ![Success](./app/assets/images/Success!.png)  
 ## Receipt Page  
 ![Receipt](./app/assets/images/Receipt!.png)  
 ## Selling List Page  
 ![SellingList](./app/assets/images/SellingList!.png)  
 ## Selling Product Page  
 ![SellingProduct](./app/assets/images/SellingProduct!.png)
 ![SellingProduct2](./app/assets/images/SellingProduct!!.png)  
 ## Dashboard Page  
 ![Dashboard](./app/assets/images/Dashboard!.png)  
 ## Replying Page  
 ![Replying](./app/assets/images/Replying!.png)  

 ### Target audience
  - For any individual, entrepreneurs, businesses and organizations to buy or sell brand new and second hand products literally in general, anything!  


 ### Tech Stack
- HTML: front end content
- Bootstrap SASS Framework: front end design 
- JavaScript: front end toggle functions, submit and instant message refresher, event listener for stripe. 
- Ruby on Rails: front end erb embedded code and back end functional code.
- Postgres Database: relational database model.
- Heroku: deployment platform.
- Sendgrid: Email API smtp.
- Stripe: Payment Gatway API.
- AWS S3: Cloud storage for images.
- Git version control: 16 branches and more than 50 commits.

# R12	User stories for your app  

### ***As a Visitor***
- I want to view listings with nice image and details.
- I want to search for specific products using partial words, filtering by categories, prices and product names.

### ***As a Seller***
- I want to create listings with product details such as photo, description, category, Shipping location, shipping time frame, quantity available, quantity sold and price.
- I want to edit my listings as much as needed, having fully access to edit all the details or even  uploading a photo.
- I want to delete any of my listings.
- I want to receive online payment only, and receive my money daily basis with a safe plataform.
- I want to the perfomance of my sales, also control of my sold and available stock.
- I want to receive queries from my clients by a sort of messaging system.

### ***As a Buyer***
- I want to search for specific products using partial words, filtering by categories, prices and product names.
- I want to message the seller for informations about the product.
- I want to add to or remove products from favorites list/wish list.
- I want to add to, update or remove products from a cart.
- I want to see where the product is shipped from and time frame for delivery.
- I want make payments oline payment and receive receipts of my purchases by email.
- I want to see my previous purchases and access its receipts.



R13	Wireframes for your app  

<a name="ERD"/></a>

# R14	Darknet ERD's Design    
### Initial Version  
* The initial ERD version during the initial development stages, bank details, address and location was considered for all users, but after taking user experience into consideration and time optimization, I decided to go for a more dry solution, replacing those tables with a shipping info table, so before each payment on the wesite the user will be required to provide, confirm or update shipping info. Comparing with the initial design, those changes is far benefitial for this project. The initial version can be found below:  
![ERD1](./app/assets/images/darknet-ERD_v1.png)   
### Final Version  
* In the advanced stages of the development, I identified that the project could have 2 more features and those features could easily implemented and linked to some existing tables, and realised that approach would not risk or cause any harm to the actual code. Then two join tables were added to support Favorites and instant Messaging features. The final result of those implementations can be found below, at the final ERD version:  
![ERD](./app/assets/images/darknet-ERD.png) 



# R15	Darknet High-level components  

**1. Action Controller**  

Darknet uses rails arquitecture and benefit from the use of Action Controller, or "Controllers. Controllers's methods also called actions are linked to the routing, that means each Http request hits an action on the controllers. The controller receive a request and handle views and models. For instance an user try to open a webpage, an HTTP request is sent, an action in the controller's classes and methods is actioned, the controller fetch data with the help of the models, in which manage relations and crud operations, and then the controller send its data to the views (html file embeded on Ruby as (ERB) files, making the magic of allowing embeded ruby code on it) to be rendered back to the browser. Code example:
```ruby

  # Send @Categories and @Products to HTML,  - listing GET  /listing
  def listing    
    @categories = Category.all 
    # Fetching Products with eagle loading, method search at product model       
    @products = Product.search(params[:search],params[:category],params[:filter])
  end
``` 

**2. Active Record**  

Darknet, as mentioned above, also benefit from ActiveRecord by inheritance on models. It has superpowers and allow crud operations to be done with very little effort, with short line of code instead of the long SQL queries. How the magic happen? ActiveRecode library has lots of methods that work under the hoods and translate its syntaxes to the proprer query code. it syntaxes are very simple and easy to use, making the code clean, readable and effective. For instance, lets say we want to fetch all products from a database and order it ascending. In ActiveRecord syntaxe would be: 
```ruby
Products.order(created_at: :asc)
```  
And after translated to the traditional SQL query it would looks like:
```sql
SELECT "products".* FROM "products" ORDER BY "products"."created_at" ASC;
```
That is a very simple example, but complex and very long queries that usually require advanced skills can be done with active record with a few words.  

**3. Active Storage**   

Darknet use Active Storage to manage uploaded images into our app. We do store the a few images into active store such as the landing page image, but all images uploaded by our users are managed by active storage and instead of storing it the images are sent to AWS s3 cloud storage service, the active storage also manage to retrieve it when required. In that way we keep our application light and safe.


**3. Action View**  
The Action View manage all html, email and text templates. It is a framework to handle looking up and rendering of templates, partial templates and layouts. The file extension for a index page for example would look like:  
 ``` index.html.erb ``` 
 Its html embeded in ruby file, in which gives us super powers and flexibility to add ruby code, instance of class variables on it. Darknet takes advantage of it and passes its classes to the html, email and text templates. Below are a few examples:
  * HTML template:  
  ``` ruby
  <%= simple_form_for(@product) do |f| %>
  <%= f.error_notification %>
  <%= f.error_notification message: f.object.errors[:base].to_sentence if f.object.errors[:base].present? %>

  <div class="form-inputs bg-light p-3 mx-auto col-lg-8">      
    <p class="mt-3"><%= f.input :title %></p>
    <p class="mt-3"><%= f.input :description %></p>
    <p class="mt-3"><%= f.input :price %></p>
    <p class="mt-3"><%= f.association :condition %></p>
    <p class="mt-3"><%= f.input :shipped_from %></p>
    <p class="mt-3"><%= f.input :delivery_estimated, label: 'Delivery estimated (Days)' %></p>
    <p class="mt-3"><%= f.input :quantity_available %></p>
    <p class="mt-3"><%= f.association :category %></p>
    <p class="mt-4"><%= f.file_field :picture, accept: 'image/png, image/jpg, image/jpeg' %></p>  
    <%= f.button :submit, class:"btn btn-info btn-lg btn-block mt-5 " %> 
  </div> 
<% end %>  
  ```  
  * Email template:  
  ``` ruby 
   <h3>Welcome to Darknet, <%= @user.username %></h3>   
   ```  
  * Text template:  
  ```ruby 
   your username is: <%= @user.username %>.   
   ```


# R16	Darknet third party services  
[Devise](https://github.com/heartcombo/devise): We are using devise to manage authentications in our app. Devise is the best, fexible and well documented solution for authenticating users, that gem creates sign-up and sign-in forms with user authentication and much more. 

[Heroku](https://id.heroku.com): Darknet is deployed to Heroku. Heroku is a platform as a service (PaaS) that enables developers to build, run, and operate applications entirely in the cloud, its a first-class integration, fast, flexible, and efficient CI/CD.

[Sendgrid](https://sendgrid.com/): We are integrated with SendGrid API for email services, Sendgrid is a leader in trusted email delivery, cloud-based solution that sends transactional and marketing email. A secure API for email service. 

[AWS S3](https://aws.amazon.com/aws/s3) - We are integrated with Amazon S3 API for cloud storage. Amazon is the best cloud storage solution for storing our products uploaded photos.

[Stripe](https://stripe.com/au): We are integrated with Stripe payment API. Stripe is an online payment getway infrastructure, secure and very well documented allow a smooth and safe implementation. Millions of businesses of all sizes use Stripe's software and APIs to accept payments, send payouts, and manage their businesses online.

[Bootstrap](https://getbootstrap.com/): Darknet has quite a lot Bootstrap components such as navbars, buttons, forms. Bootstrap combine HTML, CSS and JavaScript library to implement stylings, it has a huge options for components and is very easy to use its classes for responsive layouts and custom components. 

Some gems included into this project are:
[FIGARO](https://github.com/laserlemon/figaro): Figaro parses a Git-ignored YAML file in your application and loads its values into ENV.Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file.  
[SIMPLEFORMS](https://github.com/heartcombo/simple_form): Simple Form aims to be as flexible as possible while helping with powerful components to create forms.  
[MATERIALICONS](https://github.com/Angelmmiguel/material_icons): All Darknet icons are from Google Fonts/ Material Design Icons, it has +900 set of icons based on Material Design guidelines.  
[ULTRAHOOK](https://www.ultrahook.com/): UltraHook makes it super easy to connect public webhook endpoints with development environments, Ultrahook has been in use to support the stripe callbacks while Darknet is in development environment.  

# R17	Model Relationships/Associations   

## **User : Product**  
This relationship shows a user can have many products and a product belongs to a user. The relationship is created by referencing the user_id in the product model to represent a one-to-many association. I also used "has_one_attached" within the Product model. This allows the product to be saved with an image. 

## **User : Cart**  
This relationship shows a user can have many carts and a cart belongs to a user. The relationship is created by referencing the user_id in the cart model to represent a one-to-many association. 

## **User : Shipping_info**  
This relationship shows a user can have only one shipping_info and a shipping_info belongs to a user. The relationship is created by referencing the user_id in the Shipping_info model to represent a one-to-one association. 

## **Payment : Cart**  
This relationship shows a payment can have only one cart and a cart belongs to a payment. The relationship is created by referencing the payment_id in the Cart model to represent a one-to-one association. 

## **Status : Cart**  
This relationship shows a status can have only one cart and a cart belongs to a status. The relationship is created by referencing the status_id in the Cart model to represent a one-to-one association. 

## **Category : Product**    
This relationship shows a category can have many products and a product belongs to a category. The relationship is created by referencing the category_id in the Product model to represent a one-to-many association. 

## **Conditon : Product**    
This relationship shows a condition can have many products and a product belongs to a condition. The relationship is created by referencing the condition_id in the Product model to represent a one-to-many association. 

## **Picture : Product**    
This relationship shows a picture can have many products and a product belongs to a picture. The relationship is created by referencing the picture_id in the Product model to represent a one-to-many association. 

## **Product : Cart : Cart_Items**    
This relationship shows a product can have many carts through cart_items join table and a cart can have many products through cart_items join table. The cart_items join table belongs to product table and also belongs to cart table. The relationship is created by referencing the product_id and cart_id in the Cart_Items model to represent a many-to-many association. 

## **Product : User : Favorite**  
This relationship shows a product can have many users through favorite join table and a user can have many products through favorite join table. The favorite join table belongs to product table and also belongs to user table. The relationship is created by referencing the product_id and user_id in the Favorite model to represent a many-to-many association. 

## **Product : User : Message**    
This relationship shows a product can have many users through message join table and a user can have many products through message join table. The message join table belongs to product table and also belongs to user table. The relationship is created by referencing the product_id and user_id in the Message model to represent a many-to-many association.  



# R18	Discuss the database relations to be implemented in your application 

 To support the features and functionalities designed for Darknet, the following relations was implemented: 
 - Product 
 - Category
 - Status
 - Condition
 - Picture 
 - Shipping_info
 - User
 - Message (join table)
 - Favorite (join table)  
 - Cart_items (join table)
 - Cart 
 - Payment 
 - Picture  

 Product, Category, Condition and Picture were all one single table with a bunch of attributes before been submitted to the first and second normalization steps.   
 Below is the result of normalization and its attributes required to support the app Listings and its features:  
  ![ProductN](./app/assets/images/ProductN.png)  

  To support Favorite list of products, a join table called Favorite has been created to link users to its favorite products, for that case only foreign key and primary key are holded on this table.   
  A similar approach was adopted to support and display Messages between the user(buyer) and the user of a product(seller), where a join table called message was created, for that case two attributes were added to this join table: "message" and "muted" to support the feature funtionalities, as below:   
  ![FavotireMessage](./app/assets/images/favorite_message.png) 

  To support carts list, cart, cart-items and payments, a join table called Cart-items has been created to link products to its carts and after first and second form of normalization, two more tables complete the set to support the its features and functionalities, as below:   
  ![Cart](./app/assets/images/cart_items_payments.png)    

  Finally, to support the Shipping Info feature, we have the Shipping info table linked to user tables, as below:  
  ![Shipping](./app/assets/images/Shipping_user.png)    





<a name="schema"/></a>  

# R19	Database schema design  
''' ruby

  Table "picture"{  
    pk "id"  
    string "name"  
    string "url"  
    fk "product_id"  
  }

  Table "cart_items"{  
    pk "id"  
    integer "quantity"  
    float "price"  
    fk "product_id"  
    fk "cart_id"  
  }

  Table "cart"{  
    pk "id"  
    float "total_amount"  
    fk "user_id"  
    fk "status_id"  
    fk "payment_id"   
  }

  Table "category"{  
    pk "id"  
    string "name"  
  }

  Table "condition"{  
    pk "id"  
    string "name"  
  }

  Table "favorite"{  
    pk "id"  
    fk "user_id"  
    fk "product_id"  
  }

  Table "message"{  
    pk "id"  
    fk "user_id"  
    fk "product_id"  
    text "message"  
    boolean "muted"  
  }

  Table "payment"{  
    pk "id"  
    string "payment_intent_id"  
    string "receipt_url"  
  }

  Table "product"{  
    pk "id"  
    string "title"  
    text "description"  
    float "price"  
    string "shipped_from"  
    integer "delivery_estimated"  
    integer "quantity_available"  
    integer "sold"  
    fk "user_id"  
    fk "category_id"  
    fk "condition_id"  
  }

  Table "shipping_info"{  
    pk "id"  
    integer "street_number"  
    string "unit"  
    string "street_name"  
    string "suburb"  
    integer "phone"  
    integer "postcode"  
    fk "user_id"  
  }

  Table "status"{  
    pk "id"  
    string "name"  
  }

  Table "user" {  
    pk "id"  
    string "username"  
    string "email"  
    string "password"  
  } 
  



'''

# R20	Describe the way tasks are allocated and tracked in your project

I had applied the Agile project management concepts to this marketplace project by using a Trello board.

At the commencement of this project, I spent an entire day to make a plan and make to do lists on my Trello board. 

Once I had established my MVP for the app, I started to write user stories, draw a sitemap and wireframes, and then set milestones to implement my desired features.

I then started to code and once I completed implementing a feature, I drag the task card to the 'Done' list. 

I had followed my estimated time frame to ensure MVP are implemented before the delivery date. I also reviewed my progress constantly to mark off tasks and reschedule my plans if needed. 

Trello Board Link: 

![T1](./app/assets/images/Trello!1.png)  
![T2](./app/assets/images/Trello!2.png)  
![T3](./app/assets/images/Trello!3.png)  




