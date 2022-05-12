import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  File? fileImage;
  final TextEditingController _photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [BackButton()],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
                child: Text(
              'EDIT PROFILE',
              style: Theme.of(context).textTheme.headline1,
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'NAME',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                    child: TextFormField(
                        decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      border: const OutlineInputBorder(),
                      hintText: 'Name',
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                    )),
                  ),
                  Text(
                    'EMAIL',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                    child: TextFormField(
                        decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline_rounded),
                      border: const OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                    )),
                  ),
                  Text('MOBILE', style: Theme.of(context).textTheme.headline2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android),
                          border: const OutlineInputBorder(),
                          hintText: 'Mobile',
                          hintStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                  Text('PLACE OF WORK',
                      style: Theme.of(context).textTheme.headline2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.work_outline),
                          border: const OutlineInputBorder(),
                          hintText: 'Place of work',
                          hintStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                  Text('POSITION',
                      style: Theme.of(context).textTheme.headline2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_history),
                          border: const OutlineInputBorder(),
                          hintText: 'Position',
                          hintStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                  Text('PROFILE PHOTO',
                      style: Theme.of(context).textTheme.headline2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: TextFormField(
                      controller: _photoController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.image_outlined),
                          border: const OutlineInputBorder(),
                          hintText: 'Photo',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          suffixIcon: fileImage == null ?
                          IconButton(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  type: FileType.image,
                                );
                                if (result != null){
                                  setState(() {
                                    fileImage = File(result.files.single.path!);
                                    _photoController.text = basename(result.files.single.path!);
                                  });
                                }else {
                                  return;
                                }
                              },
                              icon: const Icon(Icons.add))
                              :
                          IconButton(onPressed: () {
                            setState(() {
                              fileImage = null;
                              _photoController.text = '';
                            });
                          }, icon: const Icon(Icons.delete))
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue[500],
                    minimumSize: const Size(335.0, 52.0),
                    textStyle: Theme.of(context).textTheme.headline1,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)))),
                onPressed: () => {},//TODO:save changed user information
                child: Text(
                  'EDIT',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            if( fileImage == null) const Text('no image'),
            if (fileImage != null) Image.file(fileImage!),
          ]),
        ),
      ),
    );
  }
}
