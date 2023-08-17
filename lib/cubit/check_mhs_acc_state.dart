part of 'check_mhs_acc_cubit.dart';

abstract class CheckMhsAccState extends Equatable {
  const CheckMhsAccState();

  @override
  List<Object> get props => [];
}

class CheckMhsAccInitial extends CheckMhsAccState {}

class CheckMhsAccLoading extends CheckMhsAccState {}

class CheckMhsAccSuccess extends CheckMhsAccState {
  final CheckMhsAccStatusResponse response;

  const CheckMhsAccSuccess(this.response);

  @override
  List<Object> get props => [response];

}

class CheckMhsAccFailed extends CheckMhsAccState {
  final String msg;

  const CheckMhsAccFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
