part of 'jurusan_cubit.dart';

abstract class JurusanState extends Equatable {
  const JurusanState();

  @override
  List<Object> get props => [];
}

class JurusanInitial extends JurusanState {}

class JurusanLoading extends JurusanState {}

class JurusanSuccess extends JurusanState {
  final List<Jurusan> jurusanList;

  const JurusanSuccess(this.jurusanList);

  @override
  List<Object> get props => [jurusanList];
}

class JurusanFailed extends JurusanState {
  final String msg;

  const JurusanFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
