import 'dart:io';

void main() {
  // Specify the directory to loop through
  final directory = Directory('./TheOperationRoom'); // Adjust the directory path as needed
  final sizeParameters = ['width', 'height', 'size', 'fontSize', 'top', 'bottom', 'left', 'right'];

  processDirectory(directory, sizeParameters);
}

void processDirectory(Directory dir, List<String> sizeParams) async {
  // Loop through all files in the directory
  await for (var entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      print('Processing: ${entity.path}');
      processFile(entity, sizeParams);
    }
  }
}

void processFile(File file, List<String> sizeParams) {
  final content = file.readAsStringSync();
  final updatedContent = replaceStaticSizes(content, sizeParams);

  // Write the updated content back to the file
  if (content != updatedContent) {
    file.writeAsStringSync(updatedContent);
    print('Updated: ${file.path}');
  }
}

String replaceStaticSizes(String content, List<String> sizeParams) {
  // Regular expression to match size parameters
  final regex = RegExp(
    r'(' + sizeParams.join('|') + r')\s*:\s*(\d+(\.\d+)?)(?!.*getFontSize)',
    multiLine: true,
  );

  // Replace matches with getFontSize(size, context)
  return content.replaceAllMapped(regex, (match) {
    final param = match.group(1); // Parameter name
    final sizeValue = match.group(2); // Static size value
    return '$param: getFontSize($sizeValue, context)';
  });
}