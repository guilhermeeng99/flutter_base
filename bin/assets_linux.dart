import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml_edit/yaml_edit.dart';

void main(List<String> args) async {
  final directory = Directory.current;
  final libFolder = Directory(p.join(directory.path, 'lib'));
  final assets = <String>[];
  await for (final entity in libFolder.list(recursive: true)) {
    if (entity is Directory) {
      final relativePath = p.relative(entity.path, from: directory.path);
      final normalizedPath = relativePath.replaceAll(r'\', '/');
      if (normalizedPath.contains('/assets/')) {
        assets.add('$normalizedPath/');
      }
    }
  }
  final editor = YamlEditor(_getPubspecContent())
    ..update(['flutter', 'assets'], assets);
  File('pubspec.yaml').writeAsStringSync(editor.toString());
  await Process.run('flutter', ['pub', 'get'], runInShell: true);
  await Process.run('fluttergen', [], runInShell: true);
}

String _getPubspecContent() {
  const pubspecPath = 'pubspec.yaml';
  final pubspecFile = File(pubspecPath);
  final pubspecContent = pubspecFile.readAsStringSync();
  return pubspecContent;
}
