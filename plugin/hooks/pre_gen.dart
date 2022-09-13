import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  print("Hello from pre_gen.dart");

  // Add a new plugin flutter
  final ProcessResult createPackageResult = Process.runSync(
    'flutter',
    [
      'create',
      '--template',
      'plugin',
      '--platforms',
      'ios,android',
      context.vars["plugin_package_name"],
    ],
  );

  print(createPackageResult.stdout);

  // Remove default files
  Process.runSync(
    'rm',
    [
      '-rf',
      '${context.vars["plugin_package_name"]}/example/lib',
      '${context.vars["plugin_package_name"]}/lib',
      '${context.vars["plugin_package_name"]}/test',
      '${context.vars["plugin_package_name"]}/CHANGELOG.md',
      '${context.vars["plugin_package_name"]}/LICENSE',
    ],
  );
}
