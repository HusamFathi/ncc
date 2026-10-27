# NCC (National Communication Center / مركز الأمة للتواصل)

Monorepo containing the **NCC Mobile Application** (Flutter) and the **NCC Landing Page** (Next.js).

## Repository Overview

```
.
├── ncc_app/          # Flutter mobile application (Android / iOS)
└── landing_page/     # Next.js promotional & download web application
```

---

## 1. NCC Mobile App (`ncc_app`)

A Flutter application for streaming radio channels and broadcasting content for the National Communication Center. Features background audio playback, multilingual support (Arabic & English with RTL layout), onboarding flow, and custom audio controls.

### Requirements
- **Flutter SDK**: `^3.12.2` (Dart 3.x)
- **Android Studio / Xcode** for mobile builds and emulators

### Setup & Configuration
1. Navigate to the app directory:
   ```bash
   cd ncc_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. (Optional) For release signing on Android, copy the example configuration:
   ```bash
   cp android/key.properties.example android/key.properties
   ```
   Fill in your keystore credentials in `android/key.properties`.

### Running & Testing
- Run locally in debug mode:
  ```bash
  flutter run
  ```
- Run tests:
  ```bash
  flutter test
  ```
- Build Android release APK / App Bundle:
  ```bash
  flutter build apk --release
  flutter build appbundle --release
  ```

---

## 2. NCC Landing Page (`landing_page`)

A Next.js web application built with React 19, TypeScript, and Tailwind CSS. Provides information about the platform, app download links with automatic platform detection, and localized terms and privacy pages.

### Requirements
- **Node.js**: `v20+` or `v24+`
- **npm**, **pnpm**, or **yarn**

### Setup & Configuration
1. Navigate to the landing page directory:
   ```bash
   cd landing_page
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Copy environment configuration:
   ```bash
   cp .env.example .env.local
   ```
   Configure `NEXT_PUBLIC_SITE_URL` if needed.

### Running & Building
- Start development server:
  ```bash
  npm run dev
  ```
- Run linter:
  ```bash
  npm run lint
  ```
- Build production bundle:
  ```bash
  npm run build
  npm run start
  ```

---

## Contributing & Development Guidelines
- Ensure code adheres to Flutter and Next.js linting rules (`flutter analyze` and `npm run lint`).
- Never commit credentials, keystores, `.env` files, or `key.properties` to version control.

