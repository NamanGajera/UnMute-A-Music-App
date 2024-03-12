import 'package:flutter/material.dart';

import '../consts/colors.dart';

class NeumorphismBtn extends StatelessWidget {
  const NeumorphismBtn({
    super.key,
    required this.size,
    this.child,
    this.blur = 20,
    this.distance = 10,
    this.onPress,
    this.colors,
    this.imageUrl,
    this.padding,
  });

  final double size;
  final Widget? child;
  final VoidCallback? onPress;
  final double blur;
  final double distance;
  final List<Color>? colors;
  final String? imageUrl;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(padding ?? 3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors == null ? lightColor1 : colors![1],
        boxShadow: [
          BoxShadow(
            color: white.withOpacity(0.8),
            blurRadius: blur,
            offset: Offset(-distance, -distance),
          ),
          BoxShadow(
            color: whiteDark.withOpacity(0.8),
            blurRadius: 20,
            offset: Offset(distance, distance),
          ),
        ],
      ),
      child: imageUrl != null
          ? CircleAvatar(
              backgroundImage: AssetImage(imageUrl!),
            )
          : GestureDetector(
              onTap: onPress,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: colors ??
                          [
                            lightColor1,
                            primaryColor1,
                          ]),
                  color: lightColor1,
                ),
                child: child,
              ),
            ),
    );
  }
}
