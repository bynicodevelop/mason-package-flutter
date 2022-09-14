import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('Running pre_gen hook');

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
      '${context.vars["plugin_package_name"]}/README.md',
      '${context.vars["plugin_package_name"]}/LICENSE',
      '${context.vars["plugin_package_name"]}/pubspec.yaml',
    ],
  );

  context.logger.info('Finished running pre_gen hook');
}
