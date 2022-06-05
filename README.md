# FOOD VISOR 


******************************
App Name: FoodVisor

Authors: Jodi-Ann Francis, Nara U Dewo, Izabela Aranda-Dooley, Betram Lalusha

Year: 2022
******************************



****************************** 
ROLES:
******************************
- Jodi and Izabela: 
     - API 
     - App Icon made in Canva 
     - search functionality
     - Views: HomeView, RestaurantImage View, RestaurantList View, RestaurantDetail View, Rating View,
- Betram: 
     - Firebase, 
     - authentication
     - user sign In and sign up functionality
     - image picker functionality
     - User location sharing
- Nara: 
     - Views: Favorite Button, Animation


****************************** 
APP DESCRIPTION
******************************

Description: FoodVisor is for the foodies. The app suggests restaurants that are nearby a user's location. A user can see list of resturants and click on a resturant to see pcitures of the place and look at that place's reviews on Yelp

******************************
      AUDIENCE AND THEIR NEEDS
******************************

Audience: Our audience would be anyone with a phone. Everyone who likes to explore new places and restaurants. Aka foodies. 

Their needs: We want to develop an app that would give users and easier experience in finding restaurants that they are interested in. Currently, it is
hard to make a decision on what people want to eat due to there being too many options, especially on yelp and google maps. We are trying to give users a solution to this issue. Hence, we came up where we give a minimal information which would lead them to choose a place faster and easier. 

******************************
   TECHNOLOGY HIGHLIGHTS
******************************

API:

Name of API: Yelp-API
Description:   The Yelp Fusion API allows its users to get local content and user reviews from millions of businesses of hospitality and service industries across 32 countries. Using the search end point, you are able to find businesses by keyword, location, category, open now - even price level!

Link to API documentation: https://www.yelp.com/developers/documentation/v3/business_search

FIREBASE:

Firebase was primary used to store user information. Information stored in firebase includes user profile pictures, user names, user emails, and user passwords. Firebase is also used to authenticate users. Although a custom sign in and sign up view was used, users must still have an account and login or sign up to read from the databse. No resturants will be shown if user is not signed or has not signed up.


******************************
     APP FUNCTIONALITY
******************************

1. SignInOrSignUp View
- user has option to sign In or sign Up
- clicking the signIn button opens the signIn view
- clicking the signUp button opens the signUp view

![](aboutMdImages/signUpView.png)

2. Firebase
- user information obtained during sign up is stored in firebase.
- when the user hits submit on the sign up page, validation checks are made to ensure email is valid, passwords match, and no one has already signed up with the entered email.
- user is given feedback if an account with the same email already exists in firebase or the email entered does not match valid email syntax
- Firebase policy:  allow read, write;
     - This was used because no one will be able to write to the database without passing the checks on the front end. Users can also only read from the data base after they have been authenticated during signIn

3. Authentication
- when a user attempts to sign in, a call is made to firebase to check if the user has an account.
- If an account is found, the password stored in firebase is compared to the password entered by the user. Password in firebase must match entered password or user will be denied access to the app and informed they have entered an "incorrect password."
- Only after a user is authenticated can they see the list of restaurants near them.

![](aboutMdImages/singInfeedBack.png)

5. Location 
- Users will be prompted to share their location 
- Users can allow to app to share their location 
![](aboutMdImages/promtLocation.png)

6.  HomeView
- Based on Users location a list of restuarnt names will be listed out
- If user has denied access to their location, a list of restaurants in the USA is shown
  ![](aboutMdImages/Homeview.png)

7. ResturantList View
- Shows the name, and rating of a restuarant
  ![](aboutMdImages/ResturantListView.png)


8. ResturantDetail View
-- Shows the name, rating, number of ratings and picture of food sold at a restuarant
 ![](aboutMdImages/RestaurantDetailView.png)


9. Favorite 
- 
<!-- 8. Search functionality
- [Jodi, Izabela, or Nara]
--- screenshots here --- -->

