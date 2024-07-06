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
      body: Obx(
        () {
          return FlutterMap(
            options: MapOptions(
              initialCenter: controller.currentLocation.value,
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
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: controller.currentLocation.value,
                    child: const Icon(
                      Icons.my_location,
                      color: AppColors.lightGreen,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
