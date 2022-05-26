import 'package:eventor/entities/event.dart';
import 'package:eventor/models/event_list_model.dart';
import 'package:eventor/pages/event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({Key? key, required this.nameOfList}) : super(key: key);
  final String nameOfList;

  String _printDuration(Duration duration) {
    if (duration.inDays > 0) return '${duration.inDays} days';
    if (duration.inHours > 0) return '${duration.inHours} hours';
    if (duration.inMinutes > 0) return '${duration.inMinutes} minutes';
    return '0';
  }

  List<Widget> getListCard(
      BuildContext context, EventListModel eventsModel, String nameOfList) {
    switch (nameOfList) {
      case 'allActiveEvents':
          return eventsModel.allActiveEvents.map((event) => getCard(context, event))
              .toList();
      case 'myActiveEvents':
        return eventsModel.myActiveEvents.map((event) => getCard(context, event))
            .toList();
      case 'myArchiveEvents':
        return eventsModel.myArchiveEvents.map((event) => getCard(context, event))
            .toList();
      case 'mySubscribedEvents':
        return eventsModel.mySubscribedEvents.map((event) => getCard(context, event))
            .toList();
      default:
        return eventsModel.allActiveEvents
            .map((event) => getCard(context, event))
            .toList();
    }
  }

  Widget getCard(BuildContext context, Event event) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => EventViewPage(event),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _printDuration(event.duration),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              IconButton(icon: const Icon(Icons.delete), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    EventListModel eventsModel = context.watch<EventListModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getListCard(context, eventsModel, nameOfList),
    );
  }
}
