import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutterbloclog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutterbloclog/blocs/upload_pfp/upload_pfp_bloc.dart';
import 'package:flutterbloclog/blocs/upload_pfp/upload_pfp_event.dart';
import 'package:flutterbloclog/blocs/upload_pfp/upload_pfp_state.dart';
import 'package:flutterbloclog/blocs/upload_resume/upload_resume_bloc.dart';
import 'package:flutterbloclog/screens/auth/components/my_text_field.dart';
import 'package:flutterbloclog/screens/template.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final imageUploadBloc = ImageUploadBloc();

  final resumeUploadBloc = UploadResumeBloc();

  final fullnameController = TextEditingController();

  final ageController = TextEditingController();

  final biographyController = TextEditingController();

  final experienceController = TextEditingController();

  final diplomaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      body: ListView(
        children: [
          const SizedBox(
            height: 65,
          ),
          // profile picture
          ProfilePicture(
              name: 'username',
              radius: 31,
              fontsize: 21,
              img: context.select((ImageUploadBloc bloc) {
                if (bloc.state is UploadPfpSuccess) {
                  return (bloc.state as UploadPfpSuccess).imageUrl;
                } else {
                  return null;
                }
              })),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    if (result != null) {
                      final File file = File(result.files.single.path!);
                      context
                          .read<ImageUploadBloc>()
                          .add(UploadPfpEventTrigger(imgFile: file));
                    }
                  },
                  child: const Text('Upload Profile Picture'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.any,
                    );
                    if (result != null) {
                      final File file = File(result.files.single.path!);
                      context
                          .read<UploadResumeBloc>()
                          .add(UploadResumeEventTrigger(pdfFile: file));
                    }
                  },
                  child: const Text('Upload Resume'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                // user name
                MyTextField(
                  // full name
                  controller: fullnameController,
                  hintText: 'Full name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                // bio
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  // Bio
                  controller: biographyController,
                  hintText: 'Say something about yourself',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                // age
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  // age
                  controller: ageController,
                  hintText: 'Age',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                // exp
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  // exp
                  controller: experienceController,
                  hintText: 'What\'s your most recents experiences ?',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                // diplome
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  // diplome
                  controller: diplomaController,
                  hintText: 'Recent diplomas',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          // upload resume
          const SizedBox(
            height: 15,
          ),
          // TODO : ToggleBtn(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Log Out'),
              IconButton(
                  onPressed: () {
                    context.read<SignInBloc>().add(const SignOutRequired());
                    Navigator.of(context).pushNamed('/');
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.error,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
