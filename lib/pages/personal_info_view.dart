import 'package:flutter/material.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({Key? key}) : super(key: key);

  @override
  State<PersonalInformationView> createState() => _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            enabled: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                border: const OutlineInputBorder(),
                hintText: 'Name',//TODO:user data
                hintStyle: Theme.of(context).textTheme.headline2,
              )),
        ),

        Text(
          'EMAIL',
          style: Theme.of(context).textTheme.headline2,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
          child: TextFormField(
            enabled: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail_outline_rounded),
                border: const OutlineInputBorder(),
                hintText: 'Email',//TODO:user data
                hintStyle: Theme.of(context).textTheme.headline2,
              )),
        ),

          Text(
            'MOBILE',
            style: Theme.of(context).textTheme.headline2,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
            child: TextFormField(
              enabled: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android),
                  border: const OutlineInputBorder(),
                  hintText: 'Phone number',//TODO:user data
                  hintStyle: Theme.of(context).textTheme.headline2,
                )),
          ),

          Text(
            'PLACE OF WORK',
            style: Theme.of(context).textTheme.headline2,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
            child: TextField(
              enabled: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.work_outline),
                  border: const OutlineInputBorder(),
                  hintText: 'Place of work',//TODO: user data
                  hintStyle: Theme.of(context).textTheme.headline2,
                )),
          ),
      ]),
    );
  }
}
