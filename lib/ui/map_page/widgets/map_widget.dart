import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, this.coordinates, required this.mapController});
  final LatLng? coordinates;
   final MapController? mapController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: coordinates?? const LatLng(50.418328, 30.608194),
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          if(coordinates != null)
          MarkerLayer(
            rotate: true,
            markers: [
                Marker(
                  width: 22,
                  height: 22,
                  point: coordinates!,
                  child: ClipOval(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.3),
                        borderRadius: BorderRadius.circular(8.33),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.circle,
                        size: 15,
                        color:  Colors.red,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
