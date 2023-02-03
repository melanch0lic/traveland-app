import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _LocationMarker(_animationController);
  }
}

class _LocationMarker extends AnimatedWidget {
  const _LocationMarker(Animation<double> animation, {Key? key}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final value = (listenable as Animation<double>).value;
    const size = 50.0;
    return Stack(children: [
      Center(
        child: Container(
          width: size * value,
          height: size * value,
          decoration: BoxDecoration(
            color: theme.highlightColor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: Colors.red, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
        ),
      ),
    ]);
  }
}
