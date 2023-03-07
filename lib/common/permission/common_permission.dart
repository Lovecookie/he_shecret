import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FPermissionObject extends Equatable {
  final int id;
  final String name;
  // final Future<PermissionStatus> Function() onStatus;
  bool isGranted = false;

  FPermissionObject(
    this.id,
    this.name,
    /*this.onStatus*/
  );

  @override
  List<Object?> get props => [id, name, /*onStatus,*/ isGranted];
}

///
/// This code was written by ChatGPT
///
// class FCommonPermission {
//   static final Map<int, FPermissionObject> _permissionObjByKeys = <int, FPermissionObject>{
//     Permission.microphone.value: FPermissionObject('마이크', () async => await Permission.microphone.status),
//     Permission.storage.value: FPermissionObject('오디오', () async => await Permission.storage.status),
//   };

//   Future<bool> checkPermissionStatus() async {
//     final microPhoneStatus = await Permission.microphone.status;
//     final storageStatus = await Permission.storage.status;

//     _permissionObjByKeys.forEach((key, value) {
//       final status = value.onStatus();

//       value.isGranted = await status.isGranted;
//     });
//     // _permissionObjByKeys[Permission.microphone.value]
//     // _isPermissionMicroPhone = microPhoneStatus.isGranted;
//     // _isPermissionStorage = storageStatus.isGranted;
//   }

//   Future<void> requestPermission(
//     BuildContext context,
//     Permission permission,
//   ) async {
//     final permissionStatus = await permission.request();

//     if (permissionStatus.isGranted) {
//       _permissionObjByKeys[permission.value]!.isGranted = true;
//     } else if (permissionStatus.isDenied) {
//       final permissionObj = _permissionObjByKeys[permission.value] ?? FPermissionObject('', false);
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text('권한 요청'),
//           content: Text('다음에 대한 권한을 허용해야 앱을 사용할 수 있습니다.(${permissionObj.name})'),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('취소')),
//             TextButton(
//               onPressed: () {
//                 SystemNavigator.pop();
//               },
//               child: const Text('종료'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
