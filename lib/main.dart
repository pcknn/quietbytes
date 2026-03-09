import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.4279, -122.0857),
    zoom: 14,
  );

  Widget activityButton(String iconPath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF302433),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA9A5B3), // light purple border color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Stack(
            children: [
                Positioned(
                  top: 200,   // pushes the map down
                  left: 0,
                  right: 0,
                  bottom: 180,
                  child: GoogleMap(
                    initialCameraPosition: _initialPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),

              Positioned(
                top: 0,
                left: 20,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF302433),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Activities Around You",
                    style: GoogleFonts.jersey20(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Positioned(
                top: 95,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    activityButton("assets/icons/Coffee.png"),
                    activityButton("assets/icons/Burger.png"),
                    activityButton("assets/icons/Sushi.png"),
                  ],
                ),
              ),

              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Sample Event Card",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}