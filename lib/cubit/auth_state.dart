part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponse response;

  const AuthSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class AuthFailed extends AuthState {
  final String msg;

  const AuthFailed(this.msg);

  @override
  List<Object> get props => [msg];
}