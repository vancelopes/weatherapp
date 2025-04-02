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
- Add the following lines to the `.env` file:
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