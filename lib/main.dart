import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activities Around You',
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

  final TextEditingController _searchController = TextEditingController();

  bool showEventCard = false;
  int _markerCounter = 0;

  String selectedEventTitle = "New Event";

  final Set<Marker> _markers = {};
  final Map<String, Marker> _eventMarkersByName = {};

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.4279, -122.0857),
    zoom: 14,
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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

  void _addEventMarker(LatLng position) {
    final int markerIdNum = _markerCounter++;
    final String eventName = "Event ${markerIdNum + 1}";

    final marker = Marker(
      markerId: MarkerId('event_$markerIdNum'),
      position: position,
      infoWindow: InfoWindow(title: eventName),
      onTap: () {
        setState(() {
          selectedEventTitle = eventName;
          showEventCard = true;
        });
      },
    );

    setState(() {
      _markers.add(marker);
      _eventMarkersByName[eventName.toLowerCase()] = marker;
      selectedEventTitle = eventName;
      showEventCard = true;
    });
  }

  Future<void> _searchEventLocation() async {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) return;

    final marker = _eventMarkersByName[query];

    if (marker == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Event not found"),
        ),
      );
      return;
    }

    final GoogleMapController controller = await _controller.future;

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: marker.position,
          zoom: 16,
        ),
      ),
    );

    setState(() {
      selectedEventTitle = marker.infoWindow.title ?? "Event";
      showEventCard = true;
    });
  }

  Widget buildSearchBar() {
    return Positioned(
      top: 95,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                onSubmitted: (_) => _searchEventLocation(),
                decoration: const InputDecoration(
                  hintText: "Search event location...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _searchEventLocation,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomOverlay() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: Column(
        children: [
          if (showEventCard)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2F2233),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Expanded(
                        child: Text(
                          selectedEventTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jersey20(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showEventCard = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PersonBubble(name: "Sehaj"),
                      PersonBubble(name: "Ellie"),
                      PersonBubble(name: "Esther"),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("Join Chat tapped");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD1AF1D),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        "Join Chat",
                        style: GoogleFonts.jersey20(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA9A5B3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Stack(
            children: [
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                bottom: 180,
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  markers: _markers,
                  onTap: (LatLng position) {
                    _addEventMarker(position);
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
              buildSearchBar(),
              Positioned(
                top: 155,
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
              buildBottomOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonBubble extends StatelessWidget {
  final String name;

  const PersonBubble({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.jersey20(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}