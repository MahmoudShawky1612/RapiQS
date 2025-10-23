# 📱 RapiQS

RapiQS is a **SwiftUI-based quiz game** that challenges users with fast-paced questions across multiple levels.  
It features a **modern UI**, **user login with avatar**, and **persistent progress** using `AppStorage` and `UserDefaults`.

---

## 🧩 Features

- 🎮 **Level-based question system**  
  Each level includes a set of questions with varying difficulty and timer limits.

- 👤 **User Sign-In with Avatar**  
  Users can set a custom username and select a profile image using the native `PhotosPicker`.

- 💾 **Persistent User Data**  
  User information and progress are stored securely using `AppStorage` and `UserDefaults`, so progress is retained across launches.

- ⏱️ **Timed Challenges**  
  Each question has a countdown timer — incorrect or slow answers can cost you points.

- 🏆 **Level Unlocking System**  
  Completing a level successfully unlocks the next one.

- 🌗 **Dynamic Light/Dark Mode Support**  
  The interface adapts beautifully to system appearance.

- ✨ **Smooth Animations**  
  Uses SwiftUI’s native animation APIs for transitions, feedback, and view scaling effects.

---

## 🧠 Architecture Overview

The project follows a simple **MVVM pattern** using SwiftUI’s reactive data flow.

| Layer | Description |
|-------|--------------|
| **Model** | Represents game data, such as `Level`, `Question`, and `Option`. |
| **ViewModel** | Handles app logic — for example, `QSOptionsViewModel` manages question state, scoring, and timers. |
| **View** | SwiftUI screens like `SIgnin`, `GameMap`, `QuestionView`, and `FinishLevelView`. |

---

## 🧰 Technologies Used

- **SwiftUI** – Declarative UI framework for iOS.
- **PhotosUI** – To handle user profile image selection.
- **AppStorage** & **UserDefaults** – For lightweight persistence.
- **Combine** (implicitly) – For state management through `@Published` and `@StateObject`.
- **Xcode** 15+ & **iOS 17 SDK**

---

## 🚀 Getting Started

### Prerequisites
- macOS with **Xcode 15 or later**
- iOS 17+ device or simulator

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MahmoudShawky1612/RapiQS.git
