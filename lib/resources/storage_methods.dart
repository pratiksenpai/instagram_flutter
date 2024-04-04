import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageTostorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid); //
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask uploadTask = ref.putData(
        file); //This line uploads the data (contents) of the file to the location specified by the ref
    TaskSnapshot snap =
        await uploadTask; //This line awaits the completion of the upload task and retrieves a TaskSnapshot object once the upload is finished. This snapshot contains metadata about the uploaded file.
    String DownloadUrl = await snap.ref
        .getDownloadURL(); //This line retrieves the download URL of the uploaded file.
    return DownloadUrl;
  }
}
