import 'package:flutter/material.dart';

import '../domain/event.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {

  late List<Event> _archiveEvents;

  @override
  void initState() {
    // TODO: archive event loading
    _archiveEvents = [
      Event('Name1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3, hours: 2), 'Free'),
      Event('Name2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(hours: 3, minutes: 30), 'Free'),
      Event('Name3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(minutes: 3), 'Free'),
      Event('Name4','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3, hours: 2, minutes: 20), 'Free'),
      Event('Name5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3, minutes: 20), 'Free'),
      Event('Name6','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3), 'Free'),
      Event('Name7','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3), 'Free'),
      Event('Name8','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi sed consequat purus nulla faucibus morbi amet. Leo, aliquam amet at senectus et.',1.0, 0.2, 2, DateTime(2022,5,9), const Duration(days: 3), 'Free'),
    ];
    super.initState();
  }

  String _printDuration(Duration duration){
    if(duration.inDays>0){
      return '${duration.inDays} days';
    }else if(duration.inHours>0){
      return '${duration.inHours} hours';
    }else if(duration.inMinutes>0){
      return '${duration.inMinutes} minutes';
    }
    return 'error';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _archiveEvents.map((event) => Card(
        margin: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.name, style: Theme.of(context).textTheme.headline1,),
                    Text(event.description, style: Theme.of(context).textTheme.headline2,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_printDuration(event.duration), style: Theme.of(context).textTheme.headline1,),
              )
            ],
          ),
        ),
        ),
      ).toList());
  }
}
