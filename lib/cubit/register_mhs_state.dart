part of 'register_mhs_cubit.dart';

abstract class RegisterMhsState extends Equatable {
  const RegisterMhsState();

  @override
  List<Object> get props => [];
}

class RegisterMhsInitial extends RegisterMhsState {}

class RegisterMhsLoading extends RegisterMhsState {}

class RegisterMhsSuccess extends RegisterMhsState {
  final RegisterMhsResponse response;

  const RegisterMhsSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class RegisterMhsFailed extends RegisterMhsState {
  final String msg;

  const RegisterMhsFailed(this.msg);

  @override
  List<Object> get props => [msg];
}