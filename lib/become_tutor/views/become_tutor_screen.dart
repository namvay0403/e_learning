import 'package:e_learning/teachers/model/teacher_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

import '../../utilities/button/buttonCustom.dart';
import '../../utilities/textField/textFieldCustom.dart';

class BecomeTutorScreen extends StatefulWidget {
  const BecomeTutorScreen({super.key});

  @override
  State<BecomeTutorScreen> createState() => _BecomeTutorScreenState();
}

class _BecomeTutorScreenState extends State<BecomeTutorScreen> {
  final formKeyTutor = GlobalKey<FormState>();
  late int id = teachers.length;
  late String name;
  late String country;
  late String description;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(padding.large),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.avatar),
                radius: 60,
              ),
              sizedBox.largeHeight(),
              Form(
                  key: formKeyTutor,
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
                              name = text;
                            });
                          },
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      SizedBox(
                        child: TextFormField(
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
                          onChanged: (text) {
                            setState(() {
                              country = text;
                            });
                          },
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      SizedBox(
                        child: TextFormField(
                          style: TextStyle(fontFamily: fontApp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(padding.medium),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Description',
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
                              description = text;
                            });
                          },
                        ),
                      ),
                      sizedBox.mediumHeight(),
                      ButtonApp(
                        label: 'REGISTER',
                        onPressed: () {
                          if (formKeyTutor.currentState!.validate()) {
                            int id = teachers.length;
                            // Teacher teacher = new Teacher(
                            //   1,
                            //   name,
                            //   country,
                            //   1.0,
                            //   false,
                            //   ['TOEIC', 'IELTS'],
                            //   description,
                            //   AppAssets.avatar,
                            // );
                            // teachers.add(teacher);
                            print(teachers.length);
                          }
                          // ;
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
