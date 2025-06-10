# 📚 Book Store App

A modern mobile app for discovering and exploring books, featuring:

✨ Personalized recommendations

🆕 Newest releases

📖 Detailed book information

## 🎨 Screens

⚡ Splash: App logo + loading animation

🏠 Home	Sections: "For You" (personalized books) + "Newest Books"

📖 Details	Full book info: cover, title, author, description, price, preview button

## 🛠️ Tech Stack

📱 Frontend
- Framework: Flutter
- State Management: Bloc

🌐 Backend
- API: [Rest API]

📦 Dependencies
- flutter_bloc / font_awesome_flutter / get_it / go_router / google_fonts / url_launcher

## 🏗️ Project Architecture

```
lib/
│
├── core/
│   ├── utils/                # App-wide utilities (router, styles, service locator, etc.)
│   ├── widgets/              # Shared/reusable widgets (loading, error, etc.)
│
├── features/
│   ├── home/
│   │   ├── data/             # Data layer: models, repositories, data sources
│   │   │   ├── models/
│   │   │   │   └── book_model/
│   │   │   │       └── book_model.dart
│   │   │   └── repos/
│   │   │       └── home_repo_implement.dart
│   │   ├── presentation/     # UI layer: cubits, views, widgets
│   │   │   ├── manager/
│   │   │   │   ├── featured_books_cubit/
│   │   │   │   │   └── featured_books_cubit.dart
│   │   │   │   └── newest_books_cubit/
│   │   │   │       └── newest_books_cubit.dart
│   │   │   ├── views/
│   │   │   │   └── home_view.dart
│   │   │   └── widgets/
│   │   │       ├── custom_app_bar.dart
│   │   │       ├── custom_book_image.dart
│   │   │       ├── newest_books_list_view_item.dart
│   │   │       └── newest_book_list_view.dart
│   │
│   ├── details/
│   │   └── presentation/
│   │       ├── views/
│   │       │   └── details_view.dart
│   │       └── widgets/
│   │           └── details_view_body.dart
│   │
│   ├── search/
│   │   ├── data/
│   │   │   └── repos/
│   │   │       └── search_repo_implement.dart
│   │   └── presentation/
│   │       ├── manager/
│   │       │   └── search_book_cubit/
│   │       │       └── search_book_cubit.dart
│   │       ├── views/
│   │       │   └── search_view.dart
│   │       └── widgets/
│   │           ├── search_result_list_view.dart
│   │           └── search_result_list_view_item.dart
│   │
│   └── splash/
│       └── presentation/
│           └── views/
│               └── splash_view.dart
│
├── main.dart                 # App entry point
│
assets/
└── images/                   # App images and icons
    └── Frame.png
```

**Key Points:**
- **core/**: Common utilities and widgets used across features.
- **features/**: Each feature is isolated with its own data and presentation layers.
- **presentation/manager/**: State management (Cubit/BLoC).
- **presentation/views/**: Screens/pages.
- **presentation/widgets/**: UI components for each feature.
- **assets/**: Static resources.

This structure is scalable and easy to maintain as your app grows.
