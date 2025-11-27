# 📱 Flutter Deep-Link Setup (go_router)

A complete, production-ready implementation of deep links in Flutter
using go_router. Includes custom URL schemes, iOS + Android
configuration, normalization, and auth guards.
<br><br>
[![My Skills](https://skillicons.dev/icons?i=flutter,dart,vscode)](https://skillicons.dev)

## Subscribe To Our Youtube Channel:
<a href="https://youtu.be/HOse25HZyLc?si=zpxclXe6n9fSWhZ7">
 <img width="110" height="40"  alt="youtube views" src="https://custom-icon-badges.demolab.com/badge/Youtube-red.svg?logo=youtube&logoSource=feather&logoColor=white]"/>
</a>

<h2>
<a href="https://youtu.be/8VmH9i5ecmM">
 Watch The Full Tutorial From Here
</a>
</h2>

## 🚀 Features

-   Full deep-link support (Android & iOS)
-   Custom URL scheme: astrodevs://profile/123
-   iOS host/path normalization
-   Optional HTTPS deep links
-   Auth redirect (/login?from=...)
-   Clean, layered router setup
-   Minimal example screens for testing

## 📂 Folder Structure

    lib/
     ├─ router/
     │   └─ app_router.dart
     ├─ features/
     │   ├─ home/
     │   ├─ profile/
     │   └─ auth/
     └─ main.dart
    android/
    ios/

## 🧭 Router Overview

The router is built step-by-step:

### ✔️ Step 1 --- Basic route tree

Defines `/`, `/profile/:id`, `/login`.

### ✔️ Step 2 --- Enable diagnostics

Prints routing decisions when debugging deep links.

### ✔️ Step 3 --- Normalize incoming URIs

Fixes formats like: - astrodevs://profile/42 - astrodevs:///profile/42 -
https://astrodevs.app/profile/42 (optional)

### ✔️ Step 4 --- Auth Guard

Redirects unauthenticated users to login and returns them to their deep
link.

## 📱 Platform Setup

### Android

Edit AndroidManifest.xml and add intent filters for: - Custom scheme
(`astrodevs://`) - Optional HTTPS host

#### with Https:
``` xml
<intent-filter android:autoVerify="false">
    <action android:name="android.intent.action.VIEW"/>
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme="astrodevs"/>
</intent-filter>
```
#### without Https:
``` xml
<intent-filter android:autoVerify="false">
    <action android:name="android.intent.action.VIEW"/>
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme="https" android:host="astrodevs.app"/>
</intent-filter>
```
### iOS

Add CFBundleURLTypes in Info.plist to register the custom scheme.

``` c
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>astrodevs</string>
    </array>
  </dict>
</array>
```

## 🧪 Testing

-   Use adb for Android:\
    `adb shell am start -a android.intent.action.VIEW -d "astrodevs://profile/123"`
-   Use Safari on iOS Simulator:\
    `astrodevs://profile/123`

## 📄 License

MIT
