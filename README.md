# Foodie App (Firebase Edition)

A Flutter-based mobile application for browsing restaurant menus, adding items to a cart, and simulating a food order checkout process. This project utilizes Firebase for backend services like authentication and potentially database storage for menu items and user data.

## Features

*   **User Authentication:**
    *   Sign Up
    *   Sign In
    *   Sign Out
*   **Menu Browsing:**
    *   Display list of available food items.
    *   View details for each food item (name, description, price, image).
    *   Categorization of food items (e.g., Burgers, Pizza, Drinks - *if implemented*).
*   **Shopping Cart:**
    *   Add items to the cart with selected addons and quantity.
    *   View items in the cart.
    *   **Slidable delete action** to remove items from the cart.
    *   Clear all items from the cart.
    *   Display subtotal, delivery fee, and total amount.
*   **Order Simulation:**
    *   Proceed to a payment page (simulated).
*   **Settings:**
    *   Toggle app settings (e.g., dark mode - *if implemented*).
*   **Navigation:**
    *   User-friendly drawer navigation for easy access to Home, Cart, and Settings.

## Screenshots

*(It's highly recommended to add a few screenshots of your app here. For example:)*

| Login Page                               | Home/Menu Page                             | Cart Page                                  |
| :---------------------------------------: | :------------------------------------------: | :----------------------------------------: |
| ![Login Page](path/to/login_screenshot.png) | ![Menu Page](path/to/menu_screenshot.png) | ![Cart Page](path/to/cart_screenshot.png) |

*(Replace `path/to/your_screenshot.png` with actual paths to your screenshot files. You might want to create a folder like `screenshots` in your project root to store these images.)*

## Tech Stack

*   **Frontend:** Flutter (Dart)
*   **Backend:** Firebase
    *   Firebase Authentication (for user login/signup)
    *   Firestore Database (likely for storing menu items, user profiles, orders - *specify if used*)
    *   Firebase Storage (optional, for storing images like food pictures - *specify if used*)
*   **State Management:** Provider (as seen in `CartPage` and likely `Restaurant` model)
*   **Key Packages Used:**
    *   `firebase_core`
    *   `firebase_auth`
    *   `cloud_firestore` (*if used*)
    *   `provider`
    *   `flutter_slidable` (for cart item deletion)
    *   `intl` (for currency formatting)
    *   *(Add any other significant packages you've used)*

## Project Structure (Simplified Overview)




    