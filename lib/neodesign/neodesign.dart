import 'package:flutter/material.dart';

class Neodesign extends StatelessWidget {
  const Neodesign({
    super.key,
    this.offset = const Offset(5, 5),
    this.blurRadius = 10.0,
    this.spreadRadius = 1.5,
    required this.borderRadius,
    required this.child,
  });

  final Widget child;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimary,
            offset: -offset,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.onSecondary,
            offset: offset,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
