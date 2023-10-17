import 'package:equatable/equatable.dart';

abstract class UploadPfpState extends Equatable {
  const UploadPfpState();

  @override
  List<Object?> get props => [];
}

class UploadPfpInitial extends UploadPfpState {}

class UploadPfpInProgress extends UploadPfpState {}

class UploadPfpSuccess extends UploadPfpState {
  final String imageUrl;

  const UploadPfpSuccess(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class UploadPfpFailure extends UploadPfpState {}
