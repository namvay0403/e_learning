import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/teachers/cubit/get_teachers/get_teachers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/widgets/card_filter.dart';
import '../../teachers/cubit/favourite/favourite_teacher_cubit.dart';
import '../../teachers/model/detail_teacher_model.dart';
import '../../teachers/model/teacher_model.dart';
import '../../utilities/constants/constants.dart';
import '../view/detail_teacher_page.dart';
import 'package:video_player/video_player.dart';

class ProfileTeacher extends StatefulWidget {
  const ProfileTeacher({super.key, required this.teacher});

  final DetailTeacher teacher;

  @override
  State<ProfileTeacher> createState() => _ProfileTeacherState();
}

class _ProfileTeacherState extends State<ProfileTeacher> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FavouriteTeacherCubit, FavouriteTeacherState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.teacher.detail!.avatar),
                      radius: 40,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.teacher.detail!.name,
                          style: TextStyle(
                            fontFamily: fontBoldApp,
                            fontSize: fontSize.large,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.teacher.detail!.country),
                        Row(
                          children: [
                            widget.teacher.rating != null
                                ? Text(
                                    '${widget.teacher.rating.toStringAsFixed(0)}/5')
                                : Text('1/5'),
                            sizedBox.smallWidth(),
                            Icon(Icons.star, color: Colors.yellow),
                            sizedBox.smallWidth(),
                            const Text('(127)'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        // await context
                        //     .read<GetTeachersCubit>()
                        //     .addFavouriteTeacher(id: teacher.id);
                      },
                      child: widget.teacher.isFavorite == true
                          ? Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite,
                              size: 35,
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Report",
                          desc: "Thanks for your report",
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Icon(
                        Icons.report_gmailerrorred,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              widget.teacher.bio.toString(),
              softWrap: true,
              style: TextStyle(
                fontFamily: fontApp,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Specialties',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.teacher.specialties,
                style: TextStyle(
                  fontFamily: fontBoldApp,
                  fontSize: fontSize.medium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // for (var item in teacher.specialities) CardCustom(text: item)
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Suggested courses',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            widget.teacher.detail!.courses!.length > 0
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.teacher.detail!.courses!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text.rich(
                          TextSpan(
                            text:
                                '${widget.teacher.detail!.courses![index].name}: ',
                            style: TextStyle(
                              fontFamily: fontBoldApp,
                              fontSize: fontSize.medium,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Link',
                                style: TextStyle(
                                  color: colorProject.primaryColor,
                                  fontFamily: fontApp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
            const SizedBox(height: 25),
            const Text(
              'Interests',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
                style: TextStyle(
                  fontFamily: fontApp,
                  fontSize: fontSize.medium,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Teaching experience',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'I have more than 10 years of teaching english experience',
                style: TextStyle(
                  fontFamily: fontApp,
                  fontSize: fontSize.medium,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
