part of 'switch_btn_bloc.dart';

sealed class SwitchBtnEvent extends Equatable {
  const SwitchBtnEvent();

  @override
  List<Object> get props => [];
}

class SwitchBtnClickEvent extends SwitchBtnEvent {
  final bool isSwitched;
  
  const SwitchBtnClickEvent(this.isSwitched);
}
