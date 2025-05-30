# 📚 Bookstore App

A modern mobile app for discovering and exploring books, featuring:

✨ Personalized recommendations

🆕 Newest releases

📖 Detailed book information

## 🎨 Screens

⚡ Splash: App logo + loading animation

🏠 Home	Sections: "For You" (personalized books) + "Newest Books"

📖 Details	Full book info: cover, title, author, rating, description, price, preview button

## 🛠️ Tech Stack

📱 Frontend
- Framework: Flutter
- State Management: Bloc

🌐 Backend
- API: [Rest API]

📦 Dependencies
- flutter_bloc / font_awesome_flutter / get_it / go_router / google_fonts / url_launcher

## 🏗️ Project Structure

```
lib/
│
├── core/
│   ├── utils/
│   │   ├── app_router.dart
│   │   ├── service_locator.dart
│   │   └── styles.dart
│   └── widgets/
│       ├── custom_error_widget.dart
│       └── custom_loading_indicator.dart
│
├── features/
│   ├── details/
│   │   └── presentation/
│   │       ├── views/
│   │       │   └── details_view.dart
│   │       └── widgets/
│   │           └── details_view_body.dart
│   ├── home/
│   │   ├── data/
│   │   │   └── models/
│   │   │       └── book_model/
│   │   │           └── book_model.dart
│   │   │   └── repos/
│   │   │       └── home_repo_implement.dart
│   │   └── presentation/
│   │       ├── manager/
│   │       │   ├── featured_books_cubit/
│   │       │   │   └── featured_books_cubit.dart
│   │       │   └── newest_books_cubit/
│   │       │       └── newest_books_cubit.dart
│   │       └── views/
│   │           └── home_view.dart
│   │       └── widgets/
│   │           ├── custom_app_bar.dart
│   │           ├── custom_book_image.dart
│   │           ├── newest_book_list_view.dart
│   │           └── newest_books_list_view_item.dart
│   └── splash/
│       └── presentation/
│           └── views/
│               └── splash_view.dart
│
├── constants.dart
├── main.dart
│
assets/
└── images/
    └── Frame.png
```

- **core/**: Shared utilities and widgets.
- **features/**: Feature-based folders (details, home, splash) with their own data, presentation, and widgets.
- **assets/**: Images and other static resources.
- **main.dart**: App entry point.

