import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes.dart';
import 'package:movies_app/utils/helpers/app_logger.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/widgets.dart';

class DeepLinksService extends GetxController with WidgetsBindingObserver {
  static DeepLinksService get instance => Get.find();
  StreamSubscription? _sub;
  bool _initialUriIsHandled = false;

  @override
  void onInit() {
    super.onInit();
    _handleIncomingLinks();
    _handleInitialUri();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _handleInitialUri();
    }
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        AppLogger().info('got uri: $uri');

        if (uri != null) {
          if (uri.path.isNotEmpty) {
            final path = uri.path.substring(1);
            Get.toNamed(Routes.detailsScreen, arguments: path.toString());
          } else {
            Get.offNamed(Routes.homeScreen);
          }
        }
      }, onError: (Object err) {
        AppLogger().info('got err: $err');
      });
    }
  }

  Future<void> _handleInitialUri() async {
    _initialUriIsHandled = false;
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;

      try {
        final uri = await getInitialUri();
        if (uri != null) {
          if (uri.path.isNotEmpty) {
            final path = uri.path.substring(1);
            Get.toNamed(Routes.detailsScreen, arguments: path.toString());
            AppLogger().info('got uri path: $uri');
          }
        }
      } on PlatformException {
        AppLogger().error('falied to get initial uri');
      } on FormatException catch (err) {
        AppLogger().error('malformed initial uri $err');
      }
    }
  }
}
