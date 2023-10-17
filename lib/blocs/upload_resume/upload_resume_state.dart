part of 'upload_resume_bloc.dart';

sealed class UploadResumeState extends Equatable {
  const UploadResumeState();
  
  @override
  List<Object> get props => [];
}

final class UploadResumeInitial extends UploadResumeState {}
