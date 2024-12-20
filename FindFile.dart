import 'dart:io';

Future<List<String>> findFilesWithString(String searchString, String directoryPath) async {
  final directory = Directory(directoryPath);
  final List<String> matchingFiles = [];

  if (await directory.exists()) {
    final files = directory.listSync(recursive: true);
    for (var file in files) {
      if (file is File) {
        final content = await file.readAsString();
        if (content.contains(searchString)) {
          matchingFiles.add(file.path);
        }
      }
    }
  } else {
    throw Exception("Directory does not exist: $directoryPath");
  }

  return matchingFiles;
}

void main() async {
  const searchString = "1 pack:  1 pill(s) . 2X daily";
  const directoryPath = "./lib";

  try {
    final results = await findFilesWithString(searchString, directoryPath);
    if (results.isEmpty) {
      print("No files containing the string '$searchString' were found.");
    } else {
      print("Files containing the string '$searchString':");
      for (var filePath in results) {
        print(filePath);
      }
    }
  } catch (e) {
    print("Error: $e");
  }
}
