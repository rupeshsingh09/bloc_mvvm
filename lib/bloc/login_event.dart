part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

// emailchanged name se class bnye h jo ki abstrct (loginEvents) seextends hoga
class EmailChanged extends LoginEvents {
  // constructor create kiye h
  const EmailChanged({required this.email});

  // constructor ko value pass kiye h
  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfoced extends LoginEvents{}

class PasswordChanged extends LoginEvents {
  // constructor create kiye h
  const PasswordChanged({required this.password});
  // constructor ko value pass kiye h
  final String password;
  @override
  List<Object> get props => [password];
}

class PasswordUnfoced extends LoginEvents{}

class LoginApi extends LoginEvents {}
