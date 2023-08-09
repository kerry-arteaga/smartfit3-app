//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:smartfit3/pages/pallete.dart';
import 'package:smartfit3/styles/glass_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: const Alignment(0, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/smartfitlogotransparent.png'),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  GlassBox(
                    height: 60.0,
                    width: 60.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.house_outlined),
                      iconSize: 40,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(width: 200),
                  GlassBox(
                    height: 60.0,
                    width: 60.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      iconSize: 40,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            const GlassBox(
              height: 350.0,
              width: 320.0,
              child: Center(
                child: Image(
                  image: AssetImage('images/weights.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlassBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.fitness_center_outlined),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                GlassBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dining_outlined),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                GlassBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month_outlined),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                GlassBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message_outlined),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
