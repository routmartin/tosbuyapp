import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../controller/new_address_controller.dart';

class NewAddressMapSection extends StatelessWidget {
  final NewAddressController controller;

  const NewAddressMapSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.location,
              zoom: 16,
            ),
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (mapController) {
              controller.mapController = mapController;
            },
            onCameraIdle: () => controller.onCameraMoved(),
          ),
          Positioned(
            width: 50.sp,
            height: 50.sp,
            child: SvgPicture.asset(AppIcons.googleMapPin),
          ),
        ],
      ),
    );
  }
}
