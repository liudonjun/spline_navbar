# Spline Navbar

![Flutter](https://img.shields.io/badge/Flutter-3.32.1%2B-blue?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart&logoColor=white)
![HarmonyOS](https://img.shields.io/badge/HarmonyOS-Next-orange)

[English README](README.md) · 中文文档

## 简介

Spline Navbar 是一个 Flutter 底部导航栏组件，提供圆角底条、凹槽、徽章与多种过渡动画（无动画/滑动/渐隐/弹性）。支持使用资产路径或自定义 Widget 作为图标，方便在不同设计风格下快速落地。

## 特性

- 凹槽 + 徽章动效，可选滑动、弹性或透明过渡
- 资产图标与任意 Widget 图标均可配置
- 参数化的高度、徽章尺寸、左右内边距与颜色
- 提供可运行的 `example` 示例与基础组件测试

## 环境要求

- Flutter ≥ 3.24
- Dart ≥ 3.8

## 安装

通过 pub.dev 安装：

```yaml
dependencies:
  spline_navbar: ^0.1.0
```

从 Git 仓库引用：

```yaml
dependencies:
  spline_navbar:
    git:
      url: https://github.com/liudonjun/spline_navbar
      ref: main
```

使用本地路径（示例已配置）：

```yaml
dependencies:
  spline_navbar:
    path: ..
```

## 使用示例

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

更多完整用法见 `example/lib/main.dart`。

## 截图 / 演示

- 将你的 GIF/PNG 放到 `screenshots/` 目录，并在此处引用。
- 建议：录制 2~3 个标签切换的凹槽/徽章动效短 GIF。
- 动画枚举占位（替换为实际图片）：
  - 无动画  
    ![500](screenshots/README.zh/file-20251207120030341.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.none,
    );
    ```
  - 滑动  
    ![500](screenshots/README.zh/file-20251207120049844.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.slide,
    );
    ```
  - 渐隐  
    ![500](screenshots/README.zh/file-20251207120101605.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.fade,
    );
    ```
  - 弹性  
    ![500](screenshots/README.zh/file-20251207120113256.gif)  
    ```dart
    SplineNavbar(
      // ...
      animation: SplineNavbarAnimation.spring,
    );
    ```

## Star & 赞赏

- 如果这个组件对你有帮助，请点个 ⭐ 支持。
- 欢迎提交 issue/PR 交流改进，或在仓库讨论区分享你的使用案例。

## Star 趋势

[![Star History](https://api.star-history.com/svg?repos=liudonjun/spline_navbar&type=Date)](https://star-history.com/#liudonjun/spline_navbar)

## 请作者喝杯咖啡

- 如果你喜欢这个项目，欢迎访问我的博客：https://blog.ygjoon.cn/
