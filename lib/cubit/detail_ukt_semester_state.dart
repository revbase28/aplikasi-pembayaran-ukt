part of 'detail_ukt_semester_cubit.dart';

abstract class DetailUktSemesterState extends Equatable {
  const DetailUktSemesterState();

  @override
  List<Object> get props => [];
}

class DetailUktSemesterInitial extends DetailUktSemesterState {}

class DetailUktSemesterLoading extends DetailUktSemesterState {}

class DetailUktSemesterSuccess extends DetailUktSemesterState {
  final DetailUktSemesterResponse response;

  const DetailUktSemesterSuccess(this.response);

  @override
  List<Object> get props => [response];

}

class DetailUktSemesterFailed extends DetailUktSemesterState {
  final String msg;

  const DetailUktSemesterFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
