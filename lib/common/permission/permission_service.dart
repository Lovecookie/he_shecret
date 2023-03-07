import 'package:shipcret/common/widgets/app_alert_dialog.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class FPermissionService {
  Future requestPhotosPermission();
  Future requestCameraPermission();

  Future<bool> handlePhotoPermission();
  Future<bool> handleCameraPermission();
}

class FPermissionHandlerPermissionService implements FPermissionService {
  @override
  Future requestPhotosPermission() async {
    return await Permission.camera.request();
  }

  @override
  Future requestCameraPermission() async {
    return await Permission.photos.request();
  }

  @override
  Future<bool> handlePhotoPermission() async {
    PermissionStatus status = await requestPhotosPermission();

    if (status != PermissionStatus.granted) {
      //print('😰 😰 😰 😰 😰 😰 Permission to photos not granted! 😰 😰 😰 😰 😰 😰');
      return false;
    }

    return true;
  }

  @override
  Future<bool> handleCameraPermission() async {
    PermissionStatus status = await requestPhotosPermission();

    if (status != PermissionStatus.granted) {
      //print('😰 😰 😰 😰 😰 😰 Permission to camera not granted! 😰 😰 😰 😰 😰 😰');
      return false;
    }

    return true;
  }

  Future<void> showAlertDialog({required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (_) => AppAlertDialog(
        onConfirm: () => openAppSettings(),
        title: '권한 허용',
        subtitle: '권한을 허용해야 사용할 수 있습니다.',
      ),
    );
  }
}
