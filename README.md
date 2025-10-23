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

## 📷 ScreenShots


<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 11 42 AM" src="https://github.com/user-attachments/assets/f2aa1afc-edd3-4648-a363-560720bd772e" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 08 52 AM" src="https://github.com/user-attachments/assets/043fb632-a5e2-40f9-9dbb-948f3b934c73" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 07 39 AM" src="https://github.com/user-attachments/assets/af132a4f-7eed-4615-8be7-32c24689c5cf" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 07 00 AM" src="https://github.com/user-attachments/assets/032ed035-f290-4107-a698-d722124777bc" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 06 43 AM" src="https://github.com/user-attachments/assets/ff81382b-dc7c-4b46-86f8-9fcc46d14a05" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 06 29 AM" src="https://github.com/user-attachments/assets/998b7db8-dfc4-49cf-b23c-442963ecc2fa" />
<img width="437" height="904" alt="Screenshot 2025-10-23 at 6 06 21 AM" src="https://github.com/user-attachments/assets/7c5612ba-be63-4918-b49a-59c10212ef0a" />



---

## 🚀 Getting Started

### Prerequisites
- macOS with **Xcode 15 or later**
- iOS 17+ device or simulator

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MahmoudShawky1612/RapiQS.git
