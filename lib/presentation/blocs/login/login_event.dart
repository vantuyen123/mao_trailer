part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitiateEvent extends LoginEvent {
  final String username, password;

  LoginInitiateEvent(this.username, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}

class LogoutEvent extends LoginEvent {}
