import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../schedule/cubit/get_schedules_cubit.dart';
import '../../utilities/constants/constants.dart';

import '../widgets/detail_history_with_comment.dart';
import '../widgets/details_history.dart';
import '../widgets/intro.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetSchedulesCubit>().getSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.medium),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const IntroForHistory(),
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
                    return DetailHistory(
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
    );
  }
}
