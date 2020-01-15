import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() {
    return _FriendsPageState();
  }
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Friends'),
        ),
        body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder(
      stream: Firestore.instance
          .collection('friends')
          .document('ryan1214')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('...Loading');
        return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data['friends'].length,
            itemBuilder: (context, index) =>
                new Text(snapshot.data['friends'][index]));
      });
}