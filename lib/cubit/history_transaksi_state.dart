part of 'history_transaksi_cubit.dart';

abstract class HistoryTransaksiState extends Equatable {
  const HistoryTransaksiState();

  @override
  List<Object> get props => [];
}

class HistoryTransaksiInitial extends HistoryTransaksiState {}

class HistoryTransaksiLoading extends HistoryTransaksiState {}

class HistoryTransaksiSuccess extends HistoryTransaksiState {
  final List<HistoryTransaksi> listHistory;

  const HistoryTransaksiSuccess(this.listHistory);

  @override
  List<Object> get props => [listHistory];

}

class HistoryTransaksiFailed extends HistoryTransaksiState {
  final String msg;

  const HistoryTransaksiFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
