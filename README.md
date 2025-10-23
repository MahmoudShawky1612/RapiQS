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
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 45" src="https://github.com/user-attachments/assets/7ea4f6bb-badf-4471-9a20-08eb71c34bef" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 34" src="https://github.com/user-attachments/assets/f6250e21-77f4-4720-bb01-093bb5e79a1e" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 27" src="https://github.com/user-attachments/assets/39bac4aa-8daa-46ea-8163-02e8ef7f7898" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 20" src="https://github.com/user-attachments/assets/ea9593b1-5383-4c72-a72e-96906e712ac1" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 08" src="https://github.com/user-attachments/assets/bdfff7b6-40d9-4268-bacc-54765f597a49" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-23 at 06 36 02" src="https://github.com/user-attachments/assets/54dca628-9aa0-4367-a1e1-35ef5ac2f246" />



---

## 🚀 Getting Started

### Prerequisites
- macOS with **Xcode 15 or later**
- iOS 17+ device or simulator

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MahmoudShawky1612/RapiQS.git
