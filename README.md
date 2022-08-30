# FlutterCAT

Flutter APP that consumes the CAAS https://cataas.com/cat.

Architecture: MVP Model-View-Presenter with repository pattern.

Azumo Inc assessment test.

## System Requirements

- Flutter 3.0.5 or later
- Dart 2.17.6 or later
- DevTools 2.12.2 or later
- XCODE 13.0 or later
- Android SDK 30 or later

## Get the Source Code

git clone https://github.com/dms-code/flutter_cat.git
cd flutter_cat
flutter pub get

## Running from Command-Line

# Build and Running for IOS:

* Create IOS Emulator (MAC environment is required):

- Run xcrun simctl list devicetypes:

Iphone 13 (com.apple.CoreSimulator.SimDeviceType.iPhone-13)

- Run xcrun simctl create my-ios com.apple.CoreSimulator.SimDeviceType.iPhone-13

BB244AEC-FDA5-443B-AECE-34986F782B1C

- Run /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator -CurrentDeviceUDID  REPLACE EMULATOR ID HERE &

* Build and Running

- Run flutter build ios lib/ui/view/main.dart
- Run flutter run lib/ui/view/main.dart my-ios

# Build and Running for ANDROID:

* Create Android Emulator:

- Run flutter emulator --create --name my-android
- Run flutter emulators --launch my-android

* Build and Running

- Run flutter run lib/ui/view/main.dart -d my-android

# Running Tests

- Run flutter test.

## Running from VSCODE

- Open the VSCODE.
- Install the Flutter plugin and Restart.
- Go to menu View -> Source Control -> Clone Repository. Add the repo URL to download the source code.
- Go to menu Terminal -> Run Task -> Pub Get.
- Go to menu Run -> Start Debugging
- Choose the emulator IOS or Android






