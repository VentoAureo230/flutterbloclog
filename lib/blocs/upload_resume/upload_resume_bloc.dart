import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'upload_resume_event.dart';
part 'upload_resume_state.dart';

class UploadResumeBloc extends Bloc<UploadResumeEvent, UploadResumeState> {
  UploadResumeBloc() : super(UploadResumeInitial()) {
    on<UploadResumeEventTriggers>((event, emit) async {
      emit(UploadResumeInProgess());

      try {
        final pdfUrl = await _uploadResumeToStorage(event.pdfFile);
        if (pdfUrl != null) {
          emit(UploadResumeSuccess(pdfUrl));
        } else {
          emit(UploadResumeFailure());
        }
      } catch (e) {
        emit(UploadResumeFailure());
      }
    });
  }

  Future<String?> _uploadResumeToStorage(File pdfFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('resume/${User + DateTime.now().millisecondsSinceEpoch}');
      final uploadTask =
          ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));
      final snapshot = await uploadTask.whenComplete(() {});
      final pdfUrl = await snapshot.ref.getDownloadURL();
      return pdfUrl;
    } catch (e) {
      return e.toString();
    }
  }
}
