import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'news.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) =>
      FlutterSizer(builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.dp,
                  fontWeight: FontWeight.normal),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const News()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.black,
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              Slidable(
                // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.

                // The end action pane is the one at the right or the bottom side.
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF66bb6a),
                      foregroundColor: Colors.white,
                      icon: Icons.cancel,
                      label: 'Cancel',
                    ),
                  ],
                ),

                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: const [
                          ListTile(title: Text('Notification')),
                        ],
                      )),
                ),
              ),
            ],
          ),
        );
      });
}

void doNothing(BuildContext context) {}
