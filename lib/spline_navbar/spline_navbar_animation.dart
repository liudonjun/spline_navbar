/// Animation strategies for the spline-style bottom navigation bar.
/// Controls how the notch, stroke, and badge transition when switching tabs.
enum SplineNavbarAnimation {
  /// No transition; state jumps immediately to the new index.
  none,

  /// Notch and stroke slide horizontally to the new index.
  slide,

  /// Stroke/notch cross-fade between states; good for subtle transitions.
  fade,

  /// Slide with an ease-out-back curve to add a small bounce effect.
  spring,
}
