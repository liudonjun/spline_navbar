## 0.1.4

- Add `animationResolver` to `SplineNavbar` for per-target animation override; resolver result takes priority over `animation`.
- Reduce analyzer warnings by routing opacity tweaks through helper `_withAlpha` (compatibility for Flutter 3.0+).

## 0.1.3

- Restore `withOpacity` for color tweaks to support Flutter 3.0–3.22.
- No API changes; painter shadow/gradient now use `withOpacity`.

## 0.1.2

- Bump version for next pub.dev publish attempt.
- Keep formatting fixes for core library files (`spline_navbar.dart`, `spline_navbar_item.dart`, `spline_navbar_painter.dart`).

## 0.1.1

- Lowered SDK/Flutter constraints to `sdk: ">=3.0.0 <4.0.0"` and `flutter: ">=3.0.0"`.
- Updated docs (README/README.zh) with install via pub.dev, star history, demo GIF slots, and support links.
- Kept spline-style navbar API unchanged.

## 0.1.0

- Added spline-style bottom navigation bar with public exports and example app.
- Icons support either widget-based or asset-based pairs.
- Updated package metadata (description, homepage, repo, issue tracker) and bumped version.

## 0.0.1

- Initial creation.
