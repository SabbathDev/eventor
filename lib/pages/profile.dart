import 'package:eventor/pages/archive_view.dart';
import 'package:eventor/pages/personal_info_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
          child: Text(
            'Personal information',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          )
      ),
      Tab(
          child: Text(
            'Archive',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          )
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Profile',
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.grey[400],
              onPressed: () {},
            ),
          ]
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
                children: const [
                  SizedBox(height: 45.0,),
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/avatar.webp'),//TODO: load user avatar
                    ),
                  ),
                  SizedBox(height: 55.0,),
                ]
            ),
            TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
            Center(
              child: [
                const PersonalInformationView(),
                const ArchiveView(),
              ][_tabController.index],
            ),
          ],
        ),
      ),
      floatingActionButton: _tabController.index == 0 ? FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile/edit');
          },
          child: const Icon(Icons.edit),
      ) : null,
    );
  }
}
