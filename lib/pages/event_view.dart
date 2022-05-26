import 'package:eventor/entities/event.dart';
import 'package:flutter/material.dart';

class EventViewPage extends StatelessWidget {
  final Event event;

  const EventViewPage(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(children: [
          const Image(
            image: AssetImage(
                'assets/images/avatar.webp'), //TODO: load event picture
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Event by: ' + event.creatorId.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(children: [
                      Expanded(
                          child: Text(
                        event.name,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.favorite_border,
                            size: 30,
                          ))
                    ]),
                    Text(event.status,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13, color: event.statusColor)),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          event.description,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline1,
                        )),
                    Column(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(children: [
                            Column(children: [
                              Row(children: [
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.blue, size: 24.0),
                                Text(
                                  "Location",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline4,
                                )
                              ]),
                              Text("TODO", //TODO: get address from location
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText1),
                            ])
                          ])),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(children: [
                            Column(children: [
                              Row(children: [
                                const Icon(Icons.person_outline,
                                    color: Colors.blue, size: 24.0),
                                Text(
                                  "Participants",
                                  style: Theme.of(context).textTheme.headline4,
                                )
                              ]),
                              Text("TODO", //TODO: get participants
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText1),
                            ])
                          ])),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(children: [
                            Column(children: [
                              Row(children: [
                                const Icon(Icons.attach_money_outlined,
                                    color: Colors.blue, size: 24.0),
                                Text(
                                  "Price",
                                  style: Theme.of(context).textTheme.headline4,
                                )
                              ]),
                              Text(event.price.toString(),
                                  //TODO: proper price system
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText1),
                            ])
                          ]))
                    ])
                  ])),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                      minimumSize: const Size(100, 52),
                      textStyle: Theme.of(context).textTheme.headline1,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0)))),
                  onPressed: () => {}, //TODO:subscribe to event
                  child: Text(
                    'SUBSCRIBE',
                    style: Theme.of(context).textTheme.headline5,
                  )))
        ]));
  }
}
