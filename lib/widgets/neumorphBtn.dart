import 'package:flutter/material.dart';

import '../consts/colors.dart';

class NeumorphismBtn extends StatelessWidget {
  const NeumorphismBtn(
      {super.key,
      required this.size,
      required this.child,
      this.blur = 20,
      this.distance = 10,
      this.onPress,
      this.colors});

  final double size;
  final Widget child;
  final VoidCallback? onPress;
  final double blur;
  final double distance;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors == null ? bgColor : colors![1],
        boxShadow: [
          BoxShadow(
            color: white,
            blurRadius: blur,
            offset: Offset(-distance, -distance),
          ),
          BoxShadow(
            color: whiteDark,
            blurRadius: 20,
            offset: Offset(distance, distance),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors ??
                  [
                    white,
                    bgDark,
                  ]),
          color: bgColor,
        ),
        child: child,
      ),
    );
  }
}
