import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/schedule_model.dart';
import '../repo/schedule_repo.dart';

part 'get_schedules_state.dart';

class GetSchedulesCubit extends Cubit<GetSchedulesState> {
  GetSchedulesCubit() : super(GetSchedulesInitial());

  Future<void> getSchedules(String userId) async {
    emit(GetSchedulesLoading());
    try {
      final schedules = await ScheduleRepo().getSchedules(userId);
      emit(GetSchedulesSuccess(schedules: schedules));
    } catch (e) {
      emit(GetSchedulesFailed(message: e.toString()));
    }
  }
}
