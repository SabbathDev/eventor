import 'package:eventor/services/auth_service.dart';
import 'package:eventor/services/eventService.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:eventor/entities/event.dart';
import '../services/current_user_service.dart';


class EventCreationPage extends StatefulWidget {
  const EventCreationPage({Key? key}) : super(key: key);
  @override
  State<EventCreationPage> createState() => _EventCreationPageState();
}

class _EventCreationPageState extends State<EventCreationPage> {

  final TextEditingController _eventNameCtrl = TextEditingController();
  final TextEditingController _locationCtrl = TextEditingController();
  final TextEditingController _startDateCtrl = TextEditingController();
  final TextEditingController _endDateCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _eventTypeCtrl = TextEditingController();

  late String _eventName;
  late List<Location> _location;
  late DateTime _startDate;
  late DateTime _endDate;
  late String _description;
  late double _price;
  //late String _type;

  void _buttonAction() async{
    _eventName = _eventNameCtrl.text;
    _startDate = DateTime.parse(_startDateCtrl.text);
    _endDate = DateTime.parse(_endDateCtrl.text);
    _description = _descriptionCtrl.text;
    _price = double.parse(_priceCtrl.text);

    try {
      _location = await locationFromAddress(_locationCtrl.text);
    } catch (e) {
      print(e);
    }

    int creatorId = (await CurrentUserService().getUserInfo()).userId;

    if(await EventService().setNewEvent(Event(0, _eventName, _description, _location.first.longitude, _location.first.latitude, creatorId, _startDate, _endDate, _price)) == '200') {
      _eventNameCtrl.clear();
      _startDateCtrl.clear();
      _endDateCtrl.clear();
      _descriptionCtrl.clear();
      _priceCtrl.clear();
      _eventTypeCtrl.clear();
      Navigator.pop(context);
    }else{
      print('Update Fail');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'New event',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.check),
                color: Colors.grey[400],
                onPressed: _buttonAction
            )
          ]
        ),

        body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'EVENT NAME',
                          style: Theme.of(context).textTheme.headline2,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                          child: TextFormField(
                              controller: _eventNameCtrl,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.edit_note),
                                border: const OutlineInputBorder(),
                                hintText: 'Event name',
                                hintStyle: Theme.of(context).textTheme.bodyText1,
                              )
                          ),
                        ),

                        Text(
                          'LOCATION',
                          style: Theme.of(context).textTheme.headline2,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                          child: TextFormField(
                              controller: _locationCtrl,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.location_on_outlined),
                                border: const OutlineInputBorder(),
                                hintText: 'Location',
                                hintStyle: Theme.of(context).textTheme.bodyText1,
                              )
                          ),
                        ),

                        Text(
                            'DATE',
                            style: Theme.of(context).textTheme.headline2
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    controller: _startDateCtrl,
                                    decoration: InputDecoration(
                                      labelText: 'From',
                                      labelStyle: Theme.of(context).textTheme.bodyText1,
                                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                                      border: const OutlineInputBorder(),
                                    ),
                                  )
                                ),
                                Flexible(
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    controller: _endDateCtrl,
                                    decoration: InputDecoration(
                                      labelText: 'To',
                                      labelStyle: Theme.of(context).textTheme.bodyText1,
                                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),

                        Text(
                            'DESCRIPTION',
                            style: Theme.of(context).textTheme.headline2
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                          child: TextFormField(
                            controller: _descriptionCtrl,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.info_outline),
                                border: const OutlineInputBorder(),
                                hintText: 'Description',
                                hintStyle: Theme.of(context).textTheme.bodyText1
                            ),
                          ),
                        ),

                        Text(
                            'PRICE',
                            style: Theme.of(context).textTheme.headline2
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _priceCtrl,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.monetization_on_outlined),
                                border: const OutlineInputBorder(),
                                hintText: 'Price',
                                hintStyle: Theme.of(context).textTheme.bodyText1
                            ),
                          ),
                        ),

                        Text(
                            'TYPE',
                            style: Theme.of(context).textTheme.headline2
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                          child: TextFormField(
                            controller: _eventTypeCtrl,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                border: const OutlineInputBorder(),
                                hintText: 'Type',
                                hintStyle: Theme.of(context).textTheme.bodyText1
                            ),
                          ),
                        ),

                        Text(
                            'IMAGE',
                            style: Theme.of(context).textTheme.headline2
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.image_search_outlined),
                                border: const OutlineInputBorder(),
                                hintText: 'Image',
                                hintStyle: Theme.of(context).textTheme.bodyText1
                            )
                          )
                        )
                      ]
                    )
                  )
                ]
            )
        )
    );
  }
}