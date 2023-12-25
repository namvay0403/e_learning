import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/widgets/navbar.dart';
import '../../utilities/constants/constants.dart';
import '../cubit/get_schedules_cubit.dart';
import '../widget/detail_lesson.dart';
import '../widget/intro.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetSchedulesCubit>().getSchedules(user.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.4,
          child: Image.asset(AppAssets.logo),
        ),
        actions: [
          Icon(
            Icons.flag_circle,
            size: size.width * 0.1,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Intro(),
              sizedBox.mediumHeight(),
              const Divider(color: Colors.black12),
              sizedBox.largeHeight(),
              BlocBuilder<GetSchedulesCubit, GetSchedulesState>(
                  builder: (context, state) {
                if (state is GetSchedulesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: colorProject.primaryColor),
                  );
                } else if (state is GetSchedulesSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.schedules.length,
                    itemBuilder: (context, index) {
                      return DetailLesson(
                        scheduleModel: state.schedules[index],
                      );
                    },
                  );
                } else if (state is GetSchedulesFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: Text('No data'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
