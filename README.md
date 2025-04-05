# WeatherApp

A Flutter test project for ProjectMark.

## Getting Started

### Project requirements

- Android SDK 35 (Download [Android Studio](https://developer.android.com/studio) for an easy installation)
- iOS 17.0 (Download [Xcode](https://developer.apple.com/xcode/) and install the iOS simulator)
- [Flutter](https://docs.flutter.dev/get-started/install)

### How to start

- Clone the repository
- Create a file called `.env` in the root directory of the project
- Add the following line to the `.env` file:
  ```env
  OWM_API_KEY=your_api_key
  ```
- Replace `your_api_key` with your actual API key from [OpenWeatherMap](https://openweathermap.org/api)
- Run the following commands to get the dependencies:
  ```bash
  flutter pub get
  dart run build_runner build --delete-conflicting-outputs
  ```
- Run the app using the following command:
  ```bash
  flutter run
    ```
- (Optional) If you wish to run tests, use the following command:
  ```bash
  flutter test
  ```
  
## Project structure

This application is structured in a way that separates the different layers of the application using the Model View ViewModel (MVVM) architecture. The project is divided into the following folders:
- `lib`: Contains the main application code.
  - `constants`: Contains the constants used.
  - `core`: Contains the core functionality of the application.
  - `data`: Contains the data layer _(Model)_.
    - `model`: Contains the data models used in the application.
    - `repository`: Contains the repository classes that handle data fetching and caching.
    - `services`: Contains the services that handle API calls.
  - `view`: Contains the view layer _(View)_ and consists of pages (screens) and widgets.
    - `widget`: Contains the reusable widgets used in the application.
  - `viewmodel`: Contains the view model layer _(ViewModel)_ and consists of the view models that handle the business logic of the application.
  - `main.dart`: The entry point of the application.
  - `env.dart`: The environment variables used in the application.
- `test`: Contains the test files for the application.
  - `mocks`: Contains the mocked classes for testing.

### Libraries used
- `GetX`: A powerful and lightweight solution for state management, dependency injection, and route management in Flutter.
- `svg`: A library for rendering SVG images in Flutter.
- `envied`: A library for managing environment variables in Flutter applications.
- `mockito`: A library for creating mock objects in Dart and Flutter applications.
- `flutter_test`: A library for testing Flutter applications.
- `http`: A library for making HTTP requests in Dart and Flutter applications.
- `skeletonizer`: A library for creating skeleton loaders in Flutter applications.
- `intl`: A library for internationalization and localization in Dart and Flutter applications.

