part of 'petugas_dashboard_cubit.dart';

abstract class PetugasDashboardState extends Equatable {
  const PetugasDashboardState();

  @override
  List<Object> get props => [];
}

class PetugasDashboardInitial extends PetugasDashboardState {}

class PetugasDashboardLoading extends PetugasDashboardState {}

class PetugasDashboardSuccess extends PetugasDashboardState {
  final PetugasDashboardData data;

  const PetugasDashboardSuccess(this.data);

  @override
  List<Object> get props => [data];

}

class PetugasDashboardFailed extends PetugasDashboardState {
  final String msg;

  const PetugasDashboardFailed(this.msg);

  @override
  List<Object> get props => [msg];
}