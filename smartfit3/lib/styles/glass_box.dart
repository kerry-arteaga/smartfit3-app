import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

final _borderRadius = BorderRadius.circular(15);

class GlassBox extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final dynamic child;

  const GlassBox({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            //blur
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(),
            ),
            //gradient
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: _borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            //child
            Container(
              child: child,
              alignment: const Alignment(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
