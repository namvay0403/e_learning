import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/teachers/cubit/get_teacher_by_id/get_teacher_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../teachers/model/teacher_model.dart';
import '../../utilities/constants/constants.dart';
import '../widgets/others_review.dart';
import '../widgets/profile_teacher.dart';

class DetailTeacherPage extends StatefulWidget {
  const DetailTeacherPage({super.key, required this.teacher});

  final Teacher teacher;

  @override
  State<DetailTeacherPage> createState() => _DetailTeacherPageState();
}

class _DetailTeacherPageState extends State<DetailTeacherPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetTeacherByIdCubit>().getTeacherById(widget.teacher.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.4,
          child: Image.asset(AppAssets.logo),
        ),
      ),
      body: BlocBuilder<GetTeacherByIdCubit, GetTeacherByIdState>(
        builder: (context, state) {
          if (state is GetTeacherByIdLoading) {
            return PopScope(
              canPop: false,
              child: AlertDialog(
                content: Container(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorProject.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is GetTeacherByIdSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileTeacher(teacher: state.teacher),
                    const SizedBox(height: 25),
                    const Text(
                      'Others review',
                      style: TextStyle(
                        fontFamily: fontBoldApp,
                        fontSize: fontSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const OthersReview(),
                    const SizedBox(height: 25),
                    SfCalendar(
                      view: CalendarView.week,
                      dataSource: MeetingDataSource(getAppointments()),
                      onTap: (details) => calendarTapped(context, details),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is GetTeacherByIdFailed) {
            return Center(
              child: Text('${state.message} + 123'),
            );
          } else {
            return Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}

void calendarTapped(
    BuildContext context, CalendarTapDetails calendarTapDetails) {
  if (calendarTapDetails.targetElement == CalendarElement.appointment) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Success",
      desc: "Thanks for registing ${calendarTapDetails.date}",
      btnOkOnPress: () {},
    ).show();
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Book',
      color: colorProject.primaryColor,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
