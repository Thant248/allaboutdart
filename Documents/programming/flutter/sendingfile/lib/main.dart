import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(const FilePickerExample());
}

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  String? fileText;
  String? mimeType;

  final List<PlatformFile> files = [];
  final ValueChanged<PlatformFile> onOpenFile = (value) => null;

  Future<void> _pickMultipleFiles() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        List<File> files = result.paths
            .where((path) => path != null)
            .map((path) => File(path!))
            .toList();
        setState(() {
          fileText = files.map((file) => file.path).join(', ');
        });
      }
    } catch (e) {
      setState(() {
        fileText = 'Error picking files: $e';
      });
    }

    mimeType = await lookupMimeType(fileText.toString());
    print("+=========================================================");
    print(mimeType);
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void pickFiless() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    loadSelectedFile(result!.files);
  }

  void loadSelectedFile(List<PlatformFile> files) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("File Picker"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$mimeType"),
                ElevatedButton(
                  onPressed: _pickMultipleFiles,
                  child: const Text('Pick Multiple Files'),
                ),
                if (fileText != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Picked files: $fileText',
                    style: TextStyle(color: Colors.red),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
