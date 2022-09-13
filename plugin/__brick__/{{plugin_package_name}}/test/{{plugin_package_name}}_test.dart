import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{plugin_package_name}}/{{plugin_package_name}}.dart';

void main() {
  testWidgets('Show confirm modal Controle default values',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    expect(
      sample(),
      "Hello from {{plugin_package_name}}.dart",
    );
  });
}
