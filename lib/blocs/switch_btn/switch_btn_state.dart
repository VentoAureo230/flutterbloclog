part of 'switch_btn_bloc.dart';

sealed class SwitchBtnState extends Equatable {
  const SwitchBtnState();

  @override
  List<Object> get props => [];
}

final class SwitchBtnInitial extends SwitchBtnState {}

class SwitchBtnTrue extends SwitchBtnState {}

class SwitchBtnFalse extends SwitchBtnState {}

class SwitchBtnError extends SwitchBtnState {}
