import 'dart:io';

void main() {
  // Specify the folder to process
  final directory = Directory('lib/Account');

  // The import statement to add
  const importStatement = "import '../MainScreen/Dashboard.dart';";

  if (directory.existsSync()) {
    directory.listSync(recursive: true).forEach((fileEntity) {
      if (fileEntity is File && fileEntity.path.endsWith('.dart')) {
        final lines = fileEntity.readAsLinesSync();

        // Check if the import statement is already present
        if (!lines.contains(importStatement)) {
          // Add the import statement at the beginning of the file
          final updatedContent = [importStatement, ...lines].join('\n');
          fileEntity.writeAsStringSync(updatedContent);

          print('Added import to ${fileEntity.path}');
        } else {
          print('Import already exists in ${fileEntity.path}');
        }
      }
    });
  } else {
    print('The directory "lib" does not exist.');
  }
}
