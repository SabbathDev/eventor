import 'package:eventor/models/event_list_model.dart';
import 'package:eventor/pages/archive_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  int _selectedSegment = 0;
  late List<Widget> eventPages = [
    const ArchiveView(nameOfList: 'allActiveEvents'), //TODO dynamically load event lists for each tab
    const ArchiveView(nameOfList: 'myActiveEvents'),
    const ArchiveView(nameOfList: 'mySubscribedEvents'),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget getChildWidget() => eventPages[_selectedSegment];

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> eventsTabNames =  <int, Widget>{
      0: const Text('All'),
      1: const Text('My'),
      2: const Text('Subscribed'),
    };

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Events',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.bar_chart_rounded),
              color: Colors.grey[400],
              onPressed: () {}
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: CupertinoSearchTextField(
                        onChanged: (String value) {},//TODO search bar logic
                        onSubmitted: (String value) {}
                    )
                ),

                CupertinoNavigationBar(
                    middle: CupertinoSlidingSegmentedControl<int>(
                      groupValue: _selectedSegment,
                      thumbColor:Colors.blue,
                      onValueChanged: (int? value) {
                        if (value != null) {
                          setState(() {_selectedSegment = value;});
                        }
                      },
                      children: eventsTabNames
                    )
                )
              ]
            )
          )
      ),

      body: RefreshIndicator(
        onRefresh: () async{
          await context.read<EventListModel>().loadAllEvents();
          return Future<void>.delayed(const Duration(seconds: 1));
          },
        child: ListView(
          children: [
            SingleChildScrollView(
              child: getChildWidget(),
            )
          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/events/createEvent'),
        tooltip: 'Increment',
        child: const Icon(Icons.add)
      )
    );
  }
}