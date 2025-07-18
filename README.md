# Foodie App (Firebase Edition)

A Flutter-based mobile application for browsing restaurant menus, adding items to a cart, and simulating a food order checkout process. This project utilizes Firebase for backend services including authentication, real-time menu data from Firestore, and potentially user data storage.

## Features

*   **User Authentication (Firebase Auth):**
    *   Sign Up with Email & Password
    *   Sign In with Email & Password
    *   Sign Out
*   **Dynamic Menu Browsing (Firestore & Provider):**
    *   Real-time display of available food items fetched from Firestore.
    *   View details for each food item (name, description, price, image, addons).
    *   Categorization of food items (e.g., Burgers, Salads, Sides, Desserts, Drinks) displayed in a TabBar.
    *   **Skeleton UI/Shimmer Effect:** Smooth loading experience while menu data is being fetched.
*   **Interactive Shopping Cart:**
    *   Add items to the cart with customizable addons and quantity.
    *   View items in the cart with detailed breakdown.
    *   **Slidable delete action** to easily remove items from the cart.
    *   Increment/decrement item quantity directly in the cart.
    *   Clear all items from the cart.
    *   Dynamic calculation and display of subtotal, delivery fee, and total amount.
*   **Order Simulation & Receipt:**
    *   Proceed to a payment page (simulated payment process).
    *   Display a generated receipt upon (simulated) order completion.
*   **User Profile & Settings:**
    *   View/Update delivery address.
    *   Toggle app settings (e.g., dark mode - *confirm if fully implemented or planned*).
*   **Navigation:**
    *   User-friendly drawer navigation for easy access to Home, Profile, Cart, and Settings.
    *   Responsive UI for various screen sizes.

## Screenshots

*(It's highly recommended to add a few screenshots of your app here. Good examples include:)*

| Login Page                                     | Home Page (with Skeleton Loading)             | Home Page (Menu Loaded)                     |
| :---------------------------------------------: | :-------------------------------------------: | :-----------------------------------------: |
| ![Login Page](screenshots/login_page.png)       | ![Home Loading](screenshots/home_loading.png) | ![Home Menu](screenshots/home_menu.png)     |

| Food Item Detail Page                        | Cart Page                                    | Settings Page                               |
| :-------------------------------------------: | :------------------------------------------: | :-----------------------------------------: |
| ![Food Detail](screenshots/food_detail.png)   | ![Cart Page](screenshots/cart_page.png)       | ![Settings Page](screenshots/settings.png) |

*(Create a `screenshots` folder in your project root and add your images there. Update the paths above accordingly.)*

## Tech Stack & Architecture

*   **Frontend:** Flutter (Dart)
    *   **UI:** Material Design, Custom Components
    *   **State Management:** `provider` (for managing restaurant data, cart state, and theme)
*   **Backend:** Firebase
    *   **Authentication:** `firebase_auth` (Email/Password)
    *   **Database:** `cloud_firestore` (for storing and retrieving restaurant menu, food items, categories, and potentially user profiles/orders)
    *   **Storage:** `firebase_storage` (*confirm if used for storing images like food pictures, or if using asset images*)
*   **Key Packages Used:**
    *   `firebase_core`: For initializing Firebase.
    *   `firebase_auth`: For authentication.
    *   `cloud_firestore`: For database interaction.
    *   `provider`: For state management.
    *   `flutter_slidable`: For the swipe-to-delete functionality in the cart.
    *   `intl`: For date and currency formatting (e.g., on receipts).
    *   `shimmer`: For the skeleton loading UI effect.
    *   *(Add any other significant packages: e.g., `image_picker`, `url_launcher` if used)*
*   **Architecture Notes:**
    *   The app utilizes a service-oriented approach with the `Restaurant` model acting as a central hub for business logic related to menu and cart operations.
    *   Clear separation of UI (Widgets), State (Provider models), and Services (Firebase interactions).

## Project Structure (Simplified Overview)

