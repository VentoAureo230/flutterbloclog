part of 'upload_resume_bloc.dart';

sealed class UploadResumeEvent extends Equatable {
  const UploadResumeEvent();

  @override
  List<Object?> get props => [];
}

class UploadResumeEventTrigger extends UploadResumeEvent {
  final File pdfFile;

  const UploadResumeEventTrigger({required this.pdfFile});

  @override
  List<Object?> get props => [pdfFile];
}
