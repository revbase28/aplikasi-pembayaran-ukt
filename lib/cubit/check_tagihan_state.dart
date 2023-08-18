part of 'check_tagihan_cubit.dart';

abstract class CheckTagihanState extends Equatable {
  const CheckTagihanState();

  @override
  List<Object> get props => [];
}

class CheckTagihanInitial extends CheckTagihanState {}

class CheckTagihanLoading extends CheckTagihanState {}

class CheckTagihanSuccess extends CheckTagihanState {
  final CheckTagihanResponse response;

  const CheckTagihanSuccess(this.response);

  @override
  List<Object> get props => [response];

}

class CheckTagihanFailed extends CheckTagihanState {
  final String msg;

  const CheckTagihanFailed(this.msg);

  @override
  List<Object> get props => [msg];
}

