# 🎬 MovieAppSwiftUI

MovieApp is a simple iOS application that demonstrate the usage of Swift and Combine framework with SwiftUI, following the MVVM architecture. The app allows users to search for movies using a public API.

## 🚀 Features

- Search for movies by title
- Display movie details
- Smooth UI
- Follows MVVM architecture
- Unit and UI tests with XCTest and XCUITest

## 📱 Screenshots

![LandingScreen](https://github.com/user-attachments/assets/1a3f5a43-a301-49a2-b340-505049c8b822)
![MoviesListScreen](https://github.com/user-attachments/assets/fbc3c39d-2d61-4ea0-9acd-54570ff46182)

## 🛠 Technologies Used

- **Swift** – Core programming language
- **SwiftUI** – SwiftUI framework
- **Combine** – Handling reactive programming
- **XCTest & XCUITest** – Unit and UI testing framework

## 📂 Project Structure

```plaintext
MovieApp/
│-- MovieApp/
│   ├── Models/            # Data models
│   ├── ViewModels/        # Business logic (MVVM)
│   ├── Views/   # UI components
│   ├── Clients/           # API calls using HTTPClient
│   ├── Extensions/        # Extension files
│-- MovieAppTests/         # Unit tests
│-- MovieAppUITests/       # UI tests
```

## 🔧 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/jigaroza287/MovieAppSwiftUI.git
   ```
2. Open `MovieApp.xcodeproj` in Xcode.
3. Build and run the app using an iPhone simulator or device.

## 🧪 Running Tests

To execute **unit and UI tests**, run the following command in **Xcode**:

```bash
⌘ + U
```

## 🏗 Architecture

The app follows the **MVVM** (Model-View-ViewModel) architecture for better separation of concerns:

- **Model**: Defines movie data structure.
- **ViewModel**: Handles business logic and API interactions.
- **View**: UI components using SwiftUI.

## 📜 Unit & UI Tests

### ✅ Unit Tests

- **MoviesViewModelTests**: Ensures movie fetching works correctly.
- **HTTPClientTests**: Mocks API responses.

### 🎭 UI Tests

- **Search functionality**
- **Handling empty results**
- **Validating movie list display**

## 🤝 Contributing

1. Fork the project.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your branch and submit a pull request.

## 📄 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

## 📬 Contact

For any issues, please create an **Issue** on GitHub or contact the repository owner.

---

💡 *Happy Coding!* 🎥🍿

