# Spline Navbar

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart&logoColor=white)
![HarmonyOS](https://img.shields.io/badge/HarmonyOS-Next-orange)

English README · [中文文档](README.zh.md)

## Introduction

Spline Navbar is a Flutter bottom navigation bar with rounded rail, notch, badge, and multiple transitions (none / slide / fade / spring). It supports both asset icons and arbitrary widget icons, making it easy to adapt to different visual styles.

## Features

- Notch + badge animation with slide, spring, or fade transitions
- Accepts either asset paths or custom widgets for icons
- Width-aware scaling based on a 390 design width (clamped to avoid extremes)
- Tunable height, badge size, horizontal inset, and colors
- Comes with a runnable `example` app and basic widget test

## Requirements

- Flutter ≥ 3.0.0
- Dart ≥ 3.0.0

## Installation

Install via pub.dev:

```yaml
dependencies:
  spline_navbar: ^0.1.1
```

Using the Git repo:

```yaml
dependencies:
  spline_navbar:
    git:
      url: https://github.com/liudonjun/spline_navbar
      ref: main
```

Local path (as in the bundled example):

```yaml
dependencies:
  spline_navbar:
    path: ..
```

## Usage

```dart
import 'package:spline_navbar/spline_navbar.dart';

SplineNavbar(
  items: const [
    SplineNavbarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
    ),
    SplineNavbarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search_rounded),
    ),
    SplineNavbarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
    ),
  ],
  selectedIndex: 0,
  onTap: (index) {},
  backgroundColor: Colors.white,
  borderColor: const Color(0xFF6E7CFF),
  shadowColor: Colors.black12,
  animation: SplineNavbarAnimation.spring,
);
```

See `example/lib/main.dart` for the full demo.

## Screenshots / Demos

  - None  
    ![500](screenshots/README/file-20251207115822951.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.none,
    );
    ```
  - Slide  
    ![500](screenshots/README/file-20251207115919958.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.slide,
    );
    ```
  - Fade  
    ![500](screenshots/README/file-20251207115913238.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.fade,
    );
    ```
  - Spring  
    ![500](screenshots/README/file-20251207115843694.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.spring,
    );
    ```
## Star & Support

- If this package helps you, please give it a ⭐.
- PRs/issues are welcome; share your usage or ideas in discussions.

## Star History

[![Star History](https://api.star-history.com/svg?repos=liudonjun/spline_navbar&type=Date)](https://star-history.com/#liudonjun/spline_navbar)

## Buy Me a Coffee

- If you like this project, feel free to visit my blog: https://blog.ygjoon.cn/
