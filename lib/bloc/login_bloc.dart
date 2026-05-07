import 'package:bloc/bloc.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';
import 'package:bloc_clean/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../services/session_manager/session_controller.dart';


part 'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  // mail changed k liye fun bnaye h
  Future<void> _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(email: event.email));
  }

  // passsword changed k liye fun bnaye h
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.password));
  }

  Future<void> _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading),);
    await loginRepository
        .loginApi(data)
        .then((value) async {
          if(value.error.isNotEmpty){

      emit(state.copyWith(message: 'Login Successful', postApiStatus: PostApiStatus.success),);

      } else {

            // saveuserInprefernce  & getuser from preference l liye
            await SessionController().saveUserInPreference(value);
            await SessionController().getUserFromPreference();

            emit(state.copyWith(message: value.error.toString(), postApiStatus: PostApiStatus.error),);

      }
    })
        .onError((error, stackTrace) {
          emit(state.copyWith(message: error.toString(), postApiStatus: PostApiStatus.error
          ),);
    });

  }
}
