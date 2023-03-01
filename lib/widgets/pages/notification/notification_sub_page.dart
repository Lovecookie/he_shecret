import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationSubPage extends HookConsumerWidget {
  const NotificationSubPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: const Text('Notification...'),
      ),
    );
  }
}
