part of 'get_schedules_cubit.dart';

@immutable
abstract class GetSchedulesState {}

class GetSchedulesInitial extends GetSchedulesState {}

class GetSchedulesLoading extends GetSchedulesState {}

class GetSchedulesSuccess extends GetSchedulesState {
  List<dynamic> schedules;
  GetSchedulesSuccess({required this.schedules});
}

class GetSchedulesFailed extends GetSchedulesState {
  String message;
  GetSchedulesFailed({required this.message});
}
