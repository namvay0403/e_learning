import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/profile/cubits/update_avatar/update_profile_cubit.dart';
import 'package:e_learning/profile/cubits/update_profile/update_avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/button/buttonCustom.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/constants/list_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKeyProfile = GlobalKey<FormState>();

  late String userName;
  late String avatar;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UpdateProfileSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Update",
            desc: "Update Successfully",
            btnOkOnPress: () {},
          ).show();
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(padding.large),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocConsumer<UpdateAvatarCubit, UpdateAvatarState>(
                    listener: (context, state) {
                  // TODO: implement listener
                  if (state is UpdateAvatarSuccess) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: "Update",
                      desc: "Update Avatar Successfully",
                      btnOkOnPress: () {},
                    ).show();
                  }
                }, builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<UpdateAvatarCubit>()
                          .updateProfile(newAvatarPath: AppAssets.google);
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(user.avatar),
                      radius: 60,
                    ),
                  );
                }),
                sizedBox.largeHeight(),
                Form(
                  key: formKeyProfile,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        child: TextFormField(
                          initialValue: user.email,
                          style: TextStyle(fontFamily: fontApp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(padding.medium),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Email',
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colorProject.primaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      SizedBox(
                        child: TextFormField(
                          initialValue: user.userName,
                          style: TextStyle(fontFamily: fontApp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(padding.medium),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colorProject.primaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Not empty';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (text) {
                            setState(() {
                              userName = text;
                            });
                          },
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      ButtonApp(
                        label: 'SAVE',
                        onPressed: () {
                          if (formKeyProfile.currentState!.validate()) {
                            User newUser = new User(
                              userName: userName,
                              historyCourses: historyCourses,
                              myCourses: courses,
                            );
                            context
                                .read<UpdateProfileCubit>()
                                .updateProfile(newUser: newUser);
                            print('newUser is : ${user.userName}');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
