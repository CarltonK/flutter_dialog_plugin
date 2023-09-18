import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_dialog_plugin_method_channel.dart';

abstract class FlutterDialogPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterDialogPluginPlatform.
  FlutterDialogPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDialogPluginPlatform _instance =
      MethodChannelFlutterDialogPlugin();

  /// The default instance of [FlutterDialogPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDialogPlugin].
  static FlutterDialogPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDialogPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterDialogPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future showDialog() {
    throw UnimplementedError('showDialog() has not been implemented.');
  }
}
