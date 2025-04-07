# 📘 Job Listing App

A modern Flutter app to browse, save, and view job listings with a clean architecture and theming support.

---

## 🚀 Features

- ✅ Fetch job data from API using Dio
- ✅ Save (bookmark) jobs for later viewing
- ✅ View detailed job information
- ✅ Delete saved jobs from bookmark list
- ✅ Light & Dark Theme Toggle
- ✅ Local storage using SharedPreferences
- ✅ BLoC (Cubit) for state management
- ✅ Clean architecture folder structure
- ✅ Custom reusable `AppBar` widget
- ✅ Centralized constants for:
  - Strings (`AppStrings`)
  - Colors (`AppColors`)
  - Text styles (`AppTextStyles`)
- ✅ Routing configured via `AppRouter`

---

## 🛠️ Dependencies Used

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [dio](https://pub.dev/packages/dio)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [freezed](https://pub.dev/packages/freezed)


---

## 📸 Screens

- Home screen: Job list with bookmark icons
- Detail screen: Full job details + bookmark toggle
- Saved screen: List of saved jobs + delete option

---

## 🎨 Theming

- Light & Dark theme support
- Toggle from AppBar
- Custom `AppTheme` class with centralized theme setup
