import 'dart:io';

Future<String?> readTextFromProjectFile(String relativePath) async {
  final file = File(relativePath);
  if (await file.exists()) {
    return await file.readAsString();
  }

  final cwd = Directory.current.path;
  final fallback = File('$cwd/$relativePath');
  if (await fallback.exists()) {
    return await fallback.readAsString();
  }

  return null;
}
