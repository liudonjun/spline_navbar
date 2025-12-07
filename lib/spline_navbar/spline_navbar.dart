import 'package:flutter/material.dart';

import 'spline_navbar_animation.dart';
import 'spline_navbar_item.dart';
import 'spline_navbar_badge.dart';
import 'spline_navbar_painter.dart';

/// Spline-styled bottom navigation bar with rounded rail, notch, and badge.
/// - Supports custom widgets or asset paths for icons
/// - Multiple animation modes (slide/fade/spring/none)
/// - Scales layout by screen width to keep proportions across devices
class SplineNavbar extends StatelessWidget {
  final List<SplineNavbarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double barHeight;
  final double badgeSize;
  final double horizontalInset;
  final SplineNavbarAnimation animation;

  const SplineNavbar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    this.barHeight = 66,
    this.badgeSize = 40,
    this.horizontalInset = 25,
    this.animation = SplineNavbarAnimation.none,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final scale = _scale(mediaQuery.size);
    final safeBottom = mediaQuery.padding.bottom;
    final height = barHeight * scale + safeBottom;
    final notchRadius = badgeSize * scale * 0.65;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: switch (animation) {
              SplineNavbarAnimation.slide => TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                tween: Tween<double>(
                  begin: selectedIndex.toDouble(),
                  end: selectedIndex.toDouble(),
                ),
                builder: (_, animIndex, __) {
                  return CustomPaint(
                    painter: SplineNavbarPainter(
                      itemCount: items.length,
                      selectedIndex: selectedIndex,
                      animatedIndex: animIndex,
                      backgroundColor: backgroundColor,
                      borderColor: borderColor,
                      shadowColor: shadowColor,
                      notchRadius: notchRadius,
                      depth: 0.07,
                      horizontalInset: horizontalInset * scale,
                    ),
                  );
                },
              ),
              SplineNavbarAnimation.spring => TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOutBack,
                tween: Tween<double>(
                  begin: selectedIndex.toDouble(),
                  end: selectedIndex.toDouble(),
                ),
                builder: (_, animIndex, __) {
                  return CustomPaint(
                    painter: SplineNavbarPainter(
                      itemCount: items.length,
                      selectedIndex: selectedIndex,
                      animatedIndex: animIndex,
                      backgroundColor: backgroundColor,
                      borderColor: borderColor,
                      shadowColor: shadowColor,
                      notchRadius: notchRadius,
                      depth: 0.07,
                      horizontalInset: horizontalInset * scale,
                    ),
                  );
                },
              ),
              SplineNavbarAnimation.fade => AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: CustomPaint(
                  key: ValueKey(selectedIndex),
                  painter: SplineNavbarPainter(
                    itemCount: items.length,
                    selectedIndex: selectedIndex,
                    animatedIndex: selectedIndex.toDouble(),
                    backgroundColor: backgroundColor,
                    borderColor: borderColor,
                    shadowColor: shadowColor,
                    notchRadius: notchRadius,
                    depth: 0.07,
                    horizontalInset: horizontalInset * scale,
                  ),
                ),
              ),
              SplineNavbarAnimation.none => CustomPaint(
                painter: SplineNavbarPainter(
                  itemCount: items.length,
                  selectedIndex: selectedIndex,
                  animatedIndex: selectedIndex.toDouble(),
                  backgroundColor: backgroundColor,
                  borderColor: borderColor,
                  shadowColor: shadowColor,
                  notchRadius: notchRadius,
                  depth: 0.07,
                  horizontalInset: horizontalInset * scale,
                ),
              ),
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: safeBottom,
            top: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalInset * scale,
              ),
              child: Row(
                children: List.generate(items.length, (index) {
                  final isActive = index == selectedIndex;
                  final iconSize = (isActive ? 45 : 40) * scale;
                  final item = items[index];
                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => onTap(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        padding: EdgeInsets.only(
                          top: (isActive ? 4 : 18) * scale,
                        ),
                        alignment: Alignment.topCenter,
                        child: isActive
                            ? SplineNavbarBadge(
                                size: iconSize,
                                backgroundColor: borderColor,
                                strokeColor: borderColor,
                                child: _buildIcon(
                                  item: item,
                                  isActive: true,
                                  iconSize: 22 * scale,
                                ),
                              )
                            : SizedBox(
                                height: 35 * scale,
                                width: 50 * scale,
                                child: Center(
                                  child: _buildIcon(
                                    item: item,
                                    isActive: false,
                                    iconSize: 22 * scale,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required SplineNavbarItem item,
    required bool isActive,
    required double iconSize,
  }) {
    final customIcon = isActive ? item.activeIcon : item.icon;
    if (customIcon != null) {
      return IconTheme.merge(
        data: IconThemeData(size: iconSize),
        child: customIcon,
      );
    }

    final assetPath = isActive ? item.activeAsset : item.asset;
    if (assetPath == null) {
      return const SizedBox.shrink();
    }

    return Image.asset(
      assetPath,
      width: iconSize,
      height: iconSize,
      colorBlendMode: BlendMode.srcIn,
    );
  }
}

double _scale(Size size) {
  const baseWidth = 390.0;
  return (size.width / baseWidth).clamp(0.85, 1.2);
}
