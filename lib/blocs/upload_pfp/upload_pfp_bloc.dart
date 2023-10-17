import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'upload_pfp_event.dart';
import 'upload_pfp_state.dart';

class ImageUploadBloc extends Bloc<UploadPfpEvent, UploadPfpState> {
  ImageUploadBloc() : super(UploadPfpInitial());

  Stream<UploadPfpState> mapEventToState(UploadPfpEvent event) async* {
    if (event is UploadPfpEventTrigger) {
      yield UploadPfpInProgress();

      try {
        final imageUrl =
            await uploadImageToStorage(event.imgFile);

        if (imageUrl != null) {
          yield UploadPfpSuccess(imageUrl);
        } else {
          yield UploadPfpFailure();
        }
      } catch (e) {
        yield UploadPfpFailure();
      }
    }
  }

  Future<String?> uploadImageToStorage(File imgFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = ref.putFile(imgFile ,SettableMetadata(contentType: 'img'));
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      return null;
    }
  }
}
