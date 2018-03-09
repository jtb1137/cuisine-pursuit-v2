# README
CUISINE PURSUIT V2

Plan ahead for your next big trip with CUISINE PURSUIT, a web application built with Ruby-on-Rails, 
designed to crowdsource the best hidden gems to eat at within a given city.

Bootstrap, Devise, Omniauth, Omniauth-facebook, Omniauth-twitter, Paperclip

- Sortable by Category (fancy, fast-food, steakhouse, etc), location (NYC, Boston, etc)
- Follow/subscribe/add restaurant to trip

Future Ideas:
    User Reviews/Likes
    Comments
    (Improved social interaction)
    Yelp API

0. Bootstrap 
    - Create navbar
1. Establish CRUD capabilities for Cities
    - restaurant controller, routes, model
        - add image -> Paperclip
    - Potential inclusions:
        - include facebook feed or some other way to keep up with events
        - include yelp scores
        - include google maps location
2. Implement Restaurant -> Nested within city
    - add image -> Paperclip
3. Implement Devise User with Omniauth
    - Add ability to save restaurant to a trip (list of related restaurants)
        - Create nested routes for Trips
        - Establish CRUB capabilities for Trips
    - Needs a User page
    - Potential inclusions:
        - Google sign-in
        - Trip dashboard with Facebook-style news feed for saved restaurants to keep up-to-date
4. Implement Category and sorting




Restaurant  <-> Category (Join Table) = restaurant_categories
            <-> City (Join Table) = city_restaurants (Not a has_many, through relation atm)

**** Don't forget to add validations!!!!!
**** Figure out how to manage addresses
**** Better format images
**** Add the user_id to restaurant if they created it?

