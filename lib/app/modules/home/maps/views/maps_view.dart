import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/utils/helper/zoom_button_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: controller.center,
          minZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          const FlutterMapZoomButtons(
            alignment: Alignment.bottomRight,
            zoomInColor: AppColors.mediumGreen,
            zoomOutColor: AppColors.mediumGreen,
            zoomInColorIcon: AppColors.white,
            zoomOutColorIcon: AppColors.white,
          ),
         // CircleLayer(circles: circles),
        ],
      ),
    );
  }
}
