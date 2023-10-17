import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class UploadPfpEvent extends Equatable {
  const UploadPfpEvent();

  @override
  List<Object?> get props => [];
}

class UploadPfpEventTrigger extends UploadPfpEvent {
  final File imgFile;

  const UploadPfpEventTrigger(this.imgFile);

  @override
  List<Object?> get props => [imgFile];
}
