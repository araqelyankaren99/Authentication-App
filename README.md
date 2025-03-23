# flutter_authentication_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

We have crated a simple flutter application to login and sing up users . 
I used get_it as a service locator , and I register all the application's dependencies there.
I created MainNavigation to describe there all the application's screens and routes (I we want migrate from navigation 2.0 we will need to change only this file)
I used mobX as a state management
I used objectBox because I needed to use one of the no sql databases and I choose objectBox (I use abstract base class for my application and if we want to use another database no sql or sql we just will change one file (we will be able to create another implementation and use that one))
Also I added theme extension to support dark and light theme . Also i have declared all the colors and text in one file to will be able to add or changed colors very easily.

# Flutter Authentication App

## Overview
A mobile authentication app built for the Flutter Challenge, featuring login and signup functionality with MobX state management and ObjectBox local storage.

## Features
- **Registration**: Users register with username, email, and password, stored in ObjectBox.
- **Login**: Users log in with username and password.
- **Form Animation**: Buttons change style based on login/signup mode (animation-ready).
- **Error Handling**: Displays errors for invalid inputs or duplicate users.
- **Persistence**: Local storage implemented (login persistence WIP).

## Architecture
- **State Management**: MobX (`lib/src/presentation/store/login_store.dart`).
- **Local Storage**: ObjectBox (`lib/objectbox.dart`, `lib/src/domain/entity/user.dart`).
- **Repository Pattern**: `UserRepository` and `UserRepositoryImpl` (`lib/src/domain/repository`, `lib/src/data/repository`).
- **Dependency Injection**: GetIt (`lib/di.dart`).
- **Theming**: Custom `AppThemeExtension` for light/dark modes (`lib/src/presentation/theme/app_theme_extension.dart`).
- **UI**: Modular widgets in `LoginScreen` (`lib/src/presentation/screen/login_screen.dart`).

## Bonus Points: Advanced Techniques
- **ObjectBox**: High-performance NoSQL database for local storage.
- **GetIt**: Dependency injection for scalable architecture.
- **ThemeExtension**: Custom theme system supporting light/dark modes.
- **MobX**: Reactive state management with `Observer` widgets.
- **Repository Pattern**: Decouples data access from business logic.
- **Modular Design**: Widgets use a closure-based store accessor, avoiding context lookups.

## Setup
1. Clone the repo: `git clone <repo-url>`
2. Install dependencies: `flutter pub get`
3. Run: `flutter run`

## TODO
- Add animations for form transitions (e.g., `AnimatedSwitcher`).
- Implement login persistence with `ObjectBox`.

## Notes
- Design and prototype links are placeholders; replace with actual URLs if provided.
- Documentation is inline; expand with a separate doc if needed.




