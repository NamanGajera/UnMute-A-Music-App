import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: lightColor1,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Music Name',
                      style: TextStyle(
                        color: darkColor,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Artist Name',
                      style: TextStyle(
                        color: darkColor.withOpacity(0.6),
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          '0:0',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: 0.5,
                            onChanged: (value) {},
                            thumbColor: primaryColor3,
                            inactiveColor: primaryColor1,
                            activeColor: primaryColor3,
                          ),
                        ),
                        Text(
                          '4:0',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            size: 50,
                          ),
                        ),
                        // const SizedBox(width: 15),
                        // const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_circle,
                            size: 60,
                          ),
                        ),
                        // const Spacer(),

                        // const SizedBox(width: 15),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_rounded,
                            size: 50,
                          ),
                        ),
                        // const SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
