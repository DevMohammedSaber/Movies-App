import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinksService extends GetxController {
  static DeepLinksService get instance => Get.find();
  StreamSubscription? _sub;
  bool _initialUriIsHandled = false;

  bool haveUri = false;
  Uri? currentUri;
  @override
  void onInit() {
    super.onInit();
    _handleIncomingLinks();
    _handleInitialUri();
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        print('got uri: $uri');
        if (uri!.path.isNotEmpty) {
          Get.toNamed(Routes.detailsScreen, arguments: {'id': uri.path});
        } else {
          Get.offNamed(Routes.homeScreen);
        }
      }, onError: (Object err) {
        print('got err: $err');
      });
    }
  }

  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;

      try {
        final uri = await getInitialUri();
        print('cold start=============== \n got initial uri: $uri');

        if (uri != null && uri.path.isNotEmpty) {
          haveUri = true;
          currentUri = uri;
          print('got initial uri: $uri');
        }
      } on PlatformException {
        print('falied to get initial uri');
      } on FormatException catch (err) {
        print('malformed initial uri $err');
      }
    }
  }
}
