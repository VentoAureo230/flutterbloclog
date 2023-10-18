part of 'upload_resume_bloc.dart';

sealed class UploadResumeState extends Equatable {
  const UploadResumeState();
  
  @override
  List<Object> get props => [];
}

class UploadResumeInitial extends UploadResumeState {}

class UploadResumeInProgess extends UploadResumeState {}

class UploadResumeSuccess extends UploadResumeState {
  final String pdfUrl;

  const UploadResumeSuccess(this.pdfUrl);
  
  @override
  List<Object> get props => [pdfUrl];
}

class UploadResumeFailure extends UploadResumeState {}