import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_user_model.dart';
import '../services/current_user_service.dart';


class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({Key? key}) : super(key: key);
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
                hintText: context.watch<CurrentUserModel>().currentUser.name,
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
                hintText: context.watch<CurrentUserModel>().currentUser.email,
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
                  hintText: context.watch<CurrentUserModel>().currentUser.phone,
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
                  hintText: context.watch<CurrentUserModel>().currentUser.work,
                  hintStyle: Theme.of(context).textTheme.headline2,
                )),
          ),
      ]),
    );
  }
}
