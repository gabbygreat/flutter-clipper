import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StaticHomePage(),
    );
  }
}

class StaticHomePage extends StatelessWidget {
  const StaticHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WavyPath(),
            child: Container(
              color: Colors.blueGrey,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Container(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class WavyPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double offest = 40.0;
    path.lineTo(0, size.height - offest);
    path.cubicTo(
      size.width / 3,
      size.height,
      2 * size.width / 3,
      size.height - 2 * offest,
      size.width,
      size.height - offest,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
