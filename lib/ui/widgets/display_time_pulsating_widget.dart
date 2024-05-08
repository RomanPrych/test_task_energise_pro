import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayTimePulsatingWidget extends StatefulWidget {
  const DisplayTimePulsatingWidget({
    super.key,
    required this.isWorking,
    required this.child,
  });

  final bool isWorking;
  final Widget child;

  @override
  State<DisplayTimePulsatingWidget> createState() =>
      _DisplayTimePulsatingWidgetState();
}

class _DisplayTimePulsatingWidgetState extends State<DisplayTimePulsatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {
    _controller = _createAnimationController();
    _tween = _createTween();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DisplayTimePulsatingWidget oldWidget) {
    widget.isWorking ? _controller.repeat(reverse: true) : _controller.reset();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return ScaleTransition(
            scale: _controller.drive(_tween),
            child: widget.child,
          );
        });
  }

  AnimationController _createAnimationController() {
    return AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  Tween<double> _createTween() {
    final tween = Tween<double>(begin: .8, end: 1);
    tween.chain(
      CurveTween(curve: Curves.bounceInOut),
    );
    return tween;
  }
}
