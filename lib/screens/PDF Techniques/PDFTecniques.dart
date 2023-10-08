import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FileUploader {
  static Future<void> uploadPDF() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','jpeg'],
    );

    if (pickerResult != null) {
      File file = File(pickerResult.files.single.path!);

      final storageRef = FirebaseStorage.instance.ref().child("syllabus/${file.path.split('/').last}");
      final uploadTask = storageRef.putFile(file);

      await uploadTask.whenComplete(() async {
        final downloadLink = await storageRef.getDownloadURL();
        await FirebaseFirestore.instance.collection("syllabus").add({
          "name": file.path.split('/').last,
          "url": downloadLink,
        });
      });
    }
  }
}

// Example usage in a different code file:
// void main() async {
//   await Firebase.initializeApp();
//   await FileUploader.uploadPDF();
// }
