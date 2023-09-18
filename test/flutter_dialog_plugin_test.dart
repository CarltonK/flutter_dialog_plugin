import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dialog_plugin/flutter_dialog_plugin.dart';
import 'package:flutter_dialog_plugin/flutter_dialog_plugin_platform_interface.dart';
import 'package:flutter_dialog_plugin/flutter_dialog_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDialogPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterDialogPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future showDialog() {
    throw UnimplementedError();
  }
}

void main() {
  final FlutterDialogPluginPlatform initialPlatform =
      FlutterDialogPluginPlatform.instance;

  test('$MethodChannelFlutterDialogPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDialogPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterDialogPlugin flutterDialogPlugin = FlutterDialogPlugin();
    MockFlutterDialogPluginPlatform fakePlatform =
        MockFlutterDialogPluginPlatform();
    FlutterDialogPluginPlatform.instance = fakePlatform;

    expect(await flutterDialogPlugin.getPlatformVersion(), '42');
  });
}
