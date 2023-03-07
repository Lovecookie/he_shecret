import 'package:shipcret/common/route_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

///
/// 사용하기 전에 반드시 수정할 것!
///
class FPermissionCheckWidget extends StatefulWidget {
  const FPermissionCheckWidget({Key? key}) : super(key: key);

  @override
  State<FPermissionCheckWidget> createState() => _FPermissionCheckWidgetState();
}

class _FPermissionCheckWidgetState extends State<FPermissionCheckWidget> with WidgetsBindingObserver {
  // late List<FPermissionObject> _permissions;
  bool _isPermissionGranted = false;
  bool _isRequestState = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // _permissions = [
    //   FPermissionObject(Permission.microphone.value, '마이크 오디오'),
    //   FPermissionObject(Permission.storage.value, '스토리지'),
    //   FPermissionObject(Permission.mediaLibrary.value, '미디어'),
    // ];

    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
  }

  Future<void> _checkPermissions() async {
    final statusMicrophone = await Permission.microphone.status;
    final statusStorage = await Permission.storage.status;
    if (statusMicrophone.isGranted && statusStorage.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
    } else {
      setState(() {
        _isPermissionGranted = false;
      });
      _requestPermissions();
    }
  }

  Future<void> _requestPermissions() async {
    if (_isRequestState) {
      return;
    }

    _isRequestState = true;

    final List<Permission> permissions = [
      Permission.microphone,
      Permission.storage,
    ];
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    if (!statuses[Permission.microphone]!.isGranted || !statuses[Permission.storage]!.isGranted) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('권한 요청'),
          content: const Text('마이크와 저장소 권한이 필요합니다.'),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                // Navigator.of(context).pop();
                SystemNavigator.pop();
                setState(() {
                  _isPermissionGranted = false;
                });
              },
            ),
            TextButton(
              child: const Text('설정'),
              onPressed: () {
                _isRequestState = false;
                openAppSettings();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_isPermissionGranted) {
        FAppRoute.go(context, FRouteName.welcome);
      }
    });

    return Scaffold(
      body: Center(
        child: _isPermissionGranted ? const Text('Permission granted') : const Text('Permission not granted'),
      ),
    );
  }
}

// class MyObserver extends WidgetsBindingObserver {
//   final State<FPermissionCheckWidget> observeredWidgetState;

//   MyObserver(this.observeredWidgetState);

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {}
//   }
// }
