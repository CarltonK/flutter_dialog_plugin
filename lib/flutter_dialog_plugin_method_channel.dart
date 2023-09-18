import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_dialog_plugin_platform_interface.dart';

/// An implementation of [FlutterDialogPluginPlatform] that uses method channels.
class MethodChannelFlutterDialogPlugin extends FlutterDialogPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_dialog_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future showDialog() async {
    final dialog = await methodChannel.invokeMethod<String>('showDialog');
    return dialog;
  }
}
