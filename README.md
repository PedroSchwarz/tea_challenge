# Tea Challenge

A Flutter application for tracking daily food and water intake with progress visualization and history management.

## Flutter Version

This project requires **Flutter 3.7.2** or higher. Make sure you have the correct Flutter version installed before running the project.

## Main Packages

The project uses the following key packages:

### Core Dependencies
- **flutter**: SDK framework
- **provider**: State management and dependency injection
- **get_it**: Service locator for dependency injection
- **go_router**: Navigation and routing

### Database & Storage
- **drift**: Type-safe SQLite database with code generation
- **drift_flutter**: Flutter integration for Drift
- **flutter_secure_storage**: Secure storage for sensitive data
- **shared_preferences**: Local storage for app preferences

### UI & Theming
- **google_fonts**: Custom typography
- **flutter_animate**: Smooth animations
- **gap**: Consistent spacing utilities

### Data & Serialization
- **freezed**: Immutable data classes and unions
- **json_annotation**: JSON serialization
- **collection**: Enhanced collection utilities
- **date_utils**: Date manipulation utilities

### Utilities
- **logging**: Structured logging
- **clock**: Time abstraction for testing
- **rxdart**: Reactive programming extensions

## Project Structure

The project follows a clean architecture pattern with feature-based organization:

```
lib/
├── app/                          # App-level configuration
│   ├── configurations/           # Build configurations
│   ├── database/                 # Database setup and tables
│   ├── dependencies/             # Service locator setup
│   ├── storage/                  # Storage abstractions
│   ├── theming/                  # App theme and design system
│   └── ui/                       # App-level UI components
├── features/                     # Feature modules
│   ├── entries/                  # Food and water entry management
│   │   ├── data/                 # Data layer
│   │   │   ├── data_sources/     # Local and remote data sources
│   │   │   ├── models/           # Data models
│   │   │   ├── repositories/     # Repository implementations
│   │   │   └── tables/           # Database table definitions
│   │   ├── domain/               # Domain layer
│   │   │   └── usecases/         # Business logic use cases
│   │   └── ui/                   # Presentation layer
│   │       ├── view_models/      # State management
│   │       └── views/            # UI screens and components
│   ├── home/                     # Home screen and progress tracking
│   ├── history/                  # Historical data and progression
│   └── user/                     # User data management
├── bootstrap.dart                # App initialization
└── main.dart                     # App entry point
```

### Key Features

- **Food & Water Tracking**: Add, edit, and delete food and water entries
- **Progress Visualization**: Circular progress rings for calories and custom cup animation for water
- **History Management**: View progress for the last 3 days with interactive date selection
- **Data Persistence**: Local SQLite database with secure storage
- **Seed Data**: Automatic initialization with sample data for first-time users
- **Responsive UI**: Dynamic text colors and shadows for better readability
- **Responsive UI**: Landscape friendly for future Android 16 requirements
- **Validation**: Comprehensive input validation for numeric fields

### Architecture Patterns

- **Clean Architecture**: Separation of concerns with data, domain, and presentation layers
- **Repository Pattern**: Abstraction of data sources
- **Dependency Injection**: Service locator pattern with GetIt
- **State Management**: Provider pattern for reactive UI updates
- **Code Generation**: Freezed for immutable data classes and Drift for database operations

## Stretch Goals Implementation

This project implements all three stretch goals from the challenge requirements:

### ✅ Local Persistence with Repository Abstraction
- **SQLite Database**: Full local persistence using Drift (type-safe SQLite wrapper)
- **Repository Pattern**: Clean abstraction layer between UI and data sources
- **Secure Storage**: FlutterSecureStorage for sensitive data (user preferences, seed data flags)
- **Data Sources**: Separate local data sources for food records, water records, and user data
- **Migration Support**: Database schema versioning and migration capabilities

### ✅ Undo/Redo for Last Action
- **5-Second Undo Window**: Users can undo the last deleted entry within 5 seconds
- **Visual Feedback**: Snackbar with undo action button
- **State Restoration**: Properly restores progress calculations and UI state
- **Timer Management**: Automatic cleanup of undo state after timeout
- **User Experience**: Smooth transition between delete and undo states

### ✅ JSON Seed Data Import
- **Comprehensive Seed Data**: 10 food records and 10 water records with realistic nutritional data
- **Remote Data Source**: Mocked network request with simulated delay
- **Model Mapping**: Proper JSON serialization/deserialization using json_annotation
- **Auto-Initialization**: Runs automatically on first app launch
- **Data Validation**: Ensures seed data is only loaded once per app installation

## Development Notes

### Caching Implementation

There is an alternative branch that implements caching for the last 3 days of data to improve performance when switching between recent dates. However, this implementation significantly increases code complexity and maintenance overhead, so it was decided to keep the main branch with a simpler, more maintainable approach.

The current implementation loads data on-demand for the selected date, which provides a good balance between performance and code simplicity.

### Getting Started

1. Ensure you have Flutter 3.7.2+ installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter pub run build_runner build` to generate code
5. Run `flutter run` to start the app

### Code Generation

The project uses several code generation tools. After making changes to:
- Freezed models
- Drift database tables
- JSON serializable classes

Run the following command to regenerate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing

Run tests with:
```bash
flutter test
```

### Linting

The project uses `flutter_lints` for code quality. Run linting with:
```bash
flutter analyze
```