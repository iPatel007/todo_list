# todo_app

A new Flutter project with name "TODO LIST".

What we covered.

- App icon
- Splash Screen
- Manage screen with `No Data Found + Image` when no task/item added initially
- List of tasks/items
- Swipe to delete task/item
- Add task/item
- Update Task/item

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/iPatel007/todo_list.git
   ```
2. Navigate to the project directory:
   ```bash
   cd todo_app
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## State Management

This application uses the [`stacked`](https://pub.dev/packages/stacked) package for state management. The `TodoViewModel and TodoDetailsViewModel` classes handles the business logic and state of the application, which is consumed by the UI using `ViewModelBuilder`.

## Basic Structures of the project

https://github.com/iPatel007/todo_list/blob/main/assets/images/readme/imgStructure.png

1. core 
   ```bash
    - models : List of model class that we have used
    - services : List of services database_service.dart and navigation_servcie.dart
    - viewmodels : todo_detail_viewmodel.dart and todo_viewmodel.dart (contain business logic of the app)
   ```
2. pages
   ```bash
    - This is UI part and contain screens. We have three screens with name Splash, Todo List and Todod Details
   ```

3. utilities
   ```bash
    - `utilities` containes constans, helper funcitions, routes, paths, themes and etc
   ```

## Assumptions

- The application does not require user authentication.
- The Todo items consist of a title, detail and completion status only.
- The local database is sufficient for storing Todo items.
- To store data locally we have use `sqflite` package.
```
