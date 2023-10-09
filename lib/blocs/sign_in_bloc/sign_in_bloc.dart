import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
	final UserRepository _userRepository;
	
  SignInBloc({
		required UserRepository userRepository
	}) : _userRepository = userRepository,
		super(SignInBlocInitial()) {
		on<SignInRequired>((event, emit) async {
			emit(SignInBlocProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
				emit(SignInBlocSuccess());
      } on FirebaseAuthException catch (e) {
				emit(SignInBlocFailure(message: e.code));
			} catch (e) {
				emit(const SignInBlocFailure());
      }
    });
		on<SignOutRequired>((event, emit) async {
			await _userRepository.logOut();
    });
  }
}
