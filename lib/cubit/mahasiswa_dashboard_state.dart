part of 'mahasiswa_dashboard_cubit.dart';

abstract class MahasiswaDashboardState extends Equatable {
  const MahasiswaDashboardState();

  @override
  List<Object> get props => [];
}

class MahasiswaDashboardInitial extends MahasiswaDashboardState {}

class MahasiswaDashboardLoading extends MahasiswaDashboardState {}

class MahasiswaDashboardSuccess extends MahasiswaDashboardState {
  final MahasiswaDashboardData data;

  const MahasiswaDashboardSuccess(this.data);

  @override
  List<Object> get props => [data];

}

class MahasiswaDashboardFailed extends MahasiswaDashboardState {
  final String msg;

  const MahasiswaDashboardFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
