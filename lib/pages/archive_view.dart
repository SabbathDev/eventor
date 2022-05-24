import 'package:eventor/models/eventListModel.dart';
import 'package:flutter/material.dart';
import '../entities/event.dart';
import '../services/eventService.dart';
import 'package:provider/provider.dart';



class ArchiveView extends StatelessWidget {
  const ArchiveView({Key? key}) : super(key: key);

  String _printDuration(Duration duration){
    if(duration.inDays>0){
      return '${duration.inDays} days';
    }else if(duration.inHours>0){
      return '${duration.inHours} hours';
    }else if(duration.inMinutes>0){
      return '${duration.inMinutes} minutes';
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: context.watch<EventListModel>().events.map((event) => Card(
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
