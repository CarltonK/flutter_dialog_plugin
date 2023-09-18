import 'flutter_dialog_plugin_platform_interface.dart';

class FlutterDialogPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterDialogPluginPlatform.instance.getPlatformVersion();
  }

  Future showDialog() {
    return FlutterDialogPluginPlatform.instance.showDialog();
  }
}
