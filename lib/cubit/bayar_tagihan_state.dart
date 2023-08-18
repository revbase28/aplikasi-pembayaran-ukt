part of 'bayar_tagihan_cubit.dart';

abstract class BayarTagihanState extends Equatable {
  const BayarTagihanState();

  @override
  List<Object> get props => [];
}

class BayarTagihanInitial extends BayarTagihanState {}

class BayarTagihanLoading extends BayarTagihanState {}

class BayarTagihanSuccess extends BayarTagihanState {
  final BayarTagihanResponse response;

  const BayarTagihanSuccess(this.response);

  @override
  List<Object> get props => [response];

}

class BayarTagihanFailed extends BayarTagihanState {
  final String msg;

  const BayarTagihanFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
