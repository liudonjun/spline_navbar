import 'package:flutter/widgets.dart';

/// Definition for a single navigation item.
/// You can provide either asset paths or widget icons for normal/active states.
class SplineNavbarItem {
  final String? asset;
  final String? activeAsset;
  final Widget? icon;
  final Widget? activeIcon;

  const SplineNavbarItem({
    this.asset,
    this.activeAsset,
    this.icon,
    this.activeIcon,
  }) : assert(
          (asset != null && activeAsset != null) ||
              (icon != null && activeIcon != null),
          'Provide either a pair of asset paths or a pair of Widget icons.',
        );
}
