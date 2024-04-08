## Exercise 3
### Author
Von Michael B. Arellano
### Student Number
2020-07263
### Section
U3L

### Application Description
This is a simple application that implements a provider to manage state.

### Things done in the code
The `lib` folder has been subdivided into different subfolders:
`Model`: Handles objects and models (e.g., Item).
`Provider`: Manages the provider, in this case, shopping_cart.
`Screen`: Manages the different screens of the system.
`Main.dart`: Where everything is called and routes are declared.

### Challenges experienced
The main challenge I encountered was related to handling the values to appear in the `checkout.dart` screen. 
I was able to solve it upon understanding that the same provider can still be used to display the items.