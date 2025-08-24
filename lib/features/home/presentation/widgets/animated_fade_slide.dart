import 'package:flutter/material.dart';

/// Wrapper de animación simple: aparece con fade + slide hacia arriba.
class AnimatedFadeSlide extends StatelessWidget {
  final bool visible;
  final Widget child;
  final Duration duration;
  final double dy;

  const AnimatedFadeSlide({
    super.key,
    required this.visible,
    required this.child,
    this.duration = const Duration(milliseconds: 350),
    this.dy = .06, // desplaza 6% de la altura
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: duration,
      curve: Curves.easeOut,
      offset: visible ? Offset.zero : Offset(0, dy),
      child: AnimatedOpacity(
        duration: duration,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }
}
