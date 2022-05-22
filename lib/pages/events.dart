import 'package:eventor/pages/archive_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  int _selectedSegment = 0;
  late List<Widget> eventPages = [
    const ArchiveView(), //TODO make new templates for event page
    const ArchiveView()
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget getChildWidget() => eventPages[_selectedSegment];

  void _addEvent(){}//TODO logic for event creation

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> eventsTabNames =  <int, Widget>{
      0: const Text('My events'),
      1: const Text('Subscribed events'),
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

      body: ListView(
        children: [
          SingleChildScrollView(
            child: getChildWidget(),
          )
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEvent(),
        tooltip: 'Increment',
        child: const Icon(Icons.add)
      )
    );
  }
}