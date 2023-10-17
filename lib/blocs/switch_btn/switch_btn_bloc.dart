import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_btn_event.dart';
part 'switch_btn_state.dart';

class SwitchBtnBloc extends Bloc<SwitchBtnEvent, SwitchBtnState> {
  SwitchBtnBloc() : super(SwitchBtnInitial()) {
    on<SwitchBtnEvent>((event, emit) {
      if (event is SwitchBtnClickEvent) {
        if (event.isSwitched) {
          emit(SwitchBtnTrue());
        } else {
          emit(SwitchBtnFalse());
        }
      }
    });
  }
}
