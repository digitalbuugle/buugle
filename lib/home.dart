// Dart Program to add 3D objects to your project

// importing material.dart
import 'package:flutter/material.dart';

// importing flutter cube package
import 'package:flutter_cube/flutter_cube.dart';

// creating class of stateful widget
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Zoom = 10;
// adding necessary objects
  late Object earth;
  late Object astro;
  late Object material;
  @override
  void initState() {
    // assigning name to the objects and providing the
    // object's file path (obj file)
    earth = Object(fileName: "assets/earth/earth_ball.obj");
    astro = Object(fileName: "assets/Astronaut/Astronaut.obj");
    material = Object(fileName: "assets/material/model.obj");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // creating appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "3D AR Model ",
          style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        // providing linear gradient to the
        // background with two colours
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: [
            Expanded(
              // adding the cube function to
              // create the scene of our object
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(material);
                  scene.camera.zoom = 10;
                },
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            // adding the earth object
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(earth);
                  scene.camera.zoom = 10;
                },
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            // adding the astro object
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(astro);
                  scene.camera.zoom = 10;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
