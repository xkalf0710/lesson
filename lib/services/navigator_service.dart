import 'package:lesson/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();

  FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> navigate(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<void> navigateArguments(String routeName, dynamic arg) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  Future<void> alertDialog(String message) {
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Text(
                message,
                style: const TextStyle(fontSize: 14, color: colorSecondary),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 10.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "assets/remove_icon.png",
                    height: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setLocalStorage(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getLocalStorage(String key) async {
    return await _secureStorage.read(key: key) ?? "";
  }
}
