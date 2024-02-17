part of '../last_focused_listview.dart';

class ShaderBox extends StatelessWidget {
  const ShaderBox({
    super.key,
    required this.child,
    this.stops,
    this.colors,
  });
  final Widget child;
  final List<double>? stops;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    /// Default Setting
    final List<double> defaultStops = [0.0, 0.02, 0.98, 1.0];
    final List<Color> defaultColors = [
      Colors.transparent,
      Colors.white,
      Colors.white,
      Colors.transparent,
    ];

    return ShaderMask(
      shaderCallback: (Rect rect) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: stops ?? defaultStops,
        colors: colors ?? defaultColors,
      ).createShader(rect),
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
