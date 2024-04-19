## Student Information
John Nico T. De Castro  
2022-12523  
U3L  

## Application Description
A sample shopping app that focuses on state management. It has three pages: My Catalog, My Cart, and Checkout.  

## Things you did in the code
Used references from the handouts, mainly the navigation, routes, and state management handouts and the flutter documentations to complete the app. The provider package for better data and state management.  

## Challenges when developing the application
It was difficult to show the no items to checkout when there are no items in the cart. It was resolved by checking if the products list was empty or not and showing the appropriate widgets. Another challenge encountered was popping the screens and showing a payment successful prompt at the snackbar which was eventually resolved by popping each screen and passing the bool from checkout to mycart to mycatalog and displaying the snackbar if it was true (isPaymentSuccessful flag).  