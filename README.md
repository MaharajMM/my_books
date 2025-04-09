# 📚 My Books App

A Flutter application to browse, view, and manage your favorite books using Open Library APIs. Users can mark books as favorites, view book details, and store their favorite list locally using Hive.

## 🚀 Features
- 🔍 Browse books using Open Library API
- ❤️ Add/remove books from Favorites
- 🧠 Favorite state managed with Riverpod
- 💾 Persistent local storage via Hive
- 🌄 Cached book cover images
- ✨ Smooth transitions with Hero animations
- 🎯 Responsive and intuitive UI

## 🛠️ Tech Stack
- **Flutter** (Frontend UI)
- **Dio** (For API calls)
- **Riverpod** (State management)
- **Hive** (For session management)
- **API Integration** (For api call & books data retrieval)


## 🔧 Installation & Setup
To get started, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/MaharajMM/my_books.git
```

2. Navigate to the project directory:
```bash
cd my_books
```
3. Install dependencies:
```bash
flutter pub get
```
4. Build the project with build_runner
```bash
dart run build_runner build --delete-conflicting-outputs
```
**Note :** Go to ```Run & Debug``` tab and select ```Launch normal```

5. Run the app:
```bash
flutter run
```
## 🌍 API Configuration

- The project relies on a backend API for authentication and stock data.
- Update the API base URL by creating a ```.env``` file in root prject directory

```bash
DEVELOPMENT_BASE_URL = "https://your-api-url.com"
```

## 🧱 Project Architecture
The app follows a clean and modular architecture using Riverpod and Hive.

➤ State Management: Riverpod
- All state logic (e.g., favorite books) is managed via StateNotifier.
- FavoriteBooksNotifier handles toggling and checking favorite status.

➤ Local Storage: Hive
- Book favorites are stored in local storage for persistence.
- A custom CartDbService-like class is used to save/retrieve data using keys.

➤ Image Caching
- Book cover images are cached using a custom CacheNetworkImageWidget.

➤ Reusable Widgets
- BookImageWidget handles image rendering with optional Hero animations.
- Supports context-aware tagSuffix to prevent duplicate Hero tag errors.

## 📝 Design Decisions
- Used Riverpod instead of Provider or Bloc for simpler reactive state.
- Used Hive over SharedPreferences for storing complex models (Book).
- Added tagSuffix in Hero to avoid duplicate tag issues across screens.
- Decoupled image widget for caching and reusability.

## 🧑‍💻 Author
Made with ❤️ by Maharaj Madan Mohan Behera

## 🖼️ UI Screen shots
<img width="303" alt="Screenshot 2025-04-09 at 12 20 39 PM" src="https://github.com/user-attachments/assets/ec1a4f70-3383-42a3-a38b-334f82a64d0b" />
<img width="303" alt="Screenshot 2025-04-09 at 12 21 12 PM" src="https://github.com/user-attachments/assets/19aa32f3-5654-4bee-8879-9f481e4f2694" />
<img width="301" alt="Screenshot 2025-04-09 at 12 20 55 PM" src="https://github.com/user-attachments/assets/4e0a449b-677e-4ac3-9fd6-f1298ebbde9b" />

## 📄 License
This project is licensed under the MIT License.
