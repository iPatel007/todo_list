# todo_app

A new Flutter project with name "TODO LIST".


## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
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

This application uses the `stacked` package for state management. The `TodoViewModel` class handles the business logic and state of the application, which is consumed by the UI using `ViewModelBuilder`.

## Assumptions

- The application does not require user authentication.
- The Todo items consist of a title, detail and completion status only.
- The local database is sufficient for storing Todo items.
- To store data locally we have use `sqflite` package.
```

This implementation meets the project requirements, including local database integration, state management with `stacked`, and a user-friendly interface. You can now follow the setup instructions in the `README.md` to run the project.
