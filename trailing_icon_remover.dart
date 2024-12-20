import 'dart:io';

void main() async {
  final libDirectory = Directory('lib');

  if (!libDirectory.existsSync()) {
    print("The 'lib/Store' directory does not exist.");
    return;
  }

  final dartFiles = libDirectory
      .listSync(recursive: true)
      .where((file) => file is File && file.path.endsWith('.dart'))
      .cast<File>();

  for (var file in dartFiles) {
    final content = await file.readAsString();

    // Check if the file contains "appBar: AppBar(" and if "automaticallyImplyLeading: false" is already added
    if (content.contains('appBar: AppBar(') &&
        !content.contains('automaticallyImplyLeading: false')) {
      // Add the property if it's not already present
      final updatedContent = content.replaceAll(
        RegExp(r'appBar: AppBar\('),
        'appBar: AppBar(\n          automaticallyImplyLeading: false,',
      );

      await file.writeAsString(updatedContent);
      print("Updated: ${file.path}");
    } else {
      print("Skipped (already updated or no AppBar): ${file.path}");
    }
  }
}
