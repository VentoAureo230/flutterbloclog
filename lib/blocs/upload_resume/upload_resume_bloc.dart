import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_repository/user_repository.dart';

part 'upload_resume_event.dart';
part 'upload_resume_state.dart';

class UploadResumeBloc extends Bloc<UploadResumeEvent, UploadResumeState> {
  final MyUserEntity user;

  UploadResumeBloc(this.user) : super(UploadResumeInitial()) {
    on<UploadResumeEventTrigger>((event, emit) async {
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
      final ref = FirebaseStorage.instance.ref().child(
          'resume/${user.userID}_${DateTime.now().millisecondsSinceEpoch}');
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
