import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/button/buttonCustom.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/constants/list_provider.dart';
import '../cubits/update_avatar/update_avatar_cubit.dart';
import '../cubits/update_profile/update_profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKeyProfile = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController(text: user.name);
  TextEditingController countryController =
      TextEditingController(text: user.country);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UpdateProfileSuccess) {
          nameController.text = state.user.name!;
          countryController.text = state.user.country!;
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Update",
            desc: "Update Successfully",
            btnOkOnPress: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ).show();
        }

        if (state is UpdateProfileFailed) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Failed",
            desc: state.message,
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
                Avatar(user.avatar!),
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
                          controller: nameController,
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
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      SizedBox(
                        child: TextFormField(
                          controller: countryController,
                          style: TextStyle(fontFamily: fontApp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(padding.medium),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Country',
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
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      ButtonApp(
                        label: 'SAVE',
                        onPressed: () {
                          if (formKeyProfile.currentState!.validate()) {
                            context.read<UpdateProfileCubit>().updateProfile(
                                  nameController.text,
                                  countryController.text,
                                );
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

  Widget Avatar(String avatarPath) {
    return BlocConsumer<UpdateAvatarCubit, UpdateAvatarState>(
        listener: (context, state) {
      // TODO: implement listener
      if (state is UpdateAvatarLoading) {
        const AlertDialog(
          content: SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),
            ),
          ),
        );
      }
      if (state is UpdateAvatarSuccess) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: "Update",
          desc: "Update Avatar Successfully",
          btnOkOnPress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
        ).show();
      }
      if (state is UpdateAvatarFailed) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: "Failed",
          desc: state.message,
          btnOkOnPress: () {},
        ).show();
      }
    }, builder: (context, state) {
      return InkWell(
        onTap: () {
          context.read<UpdateAvatarCubit>().updateAvatar();
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(avatarPath),
          radius: 60,
        ),
      );
    });
  }
}
