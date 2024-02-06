import 'package:flutter/material.dart';

class connect extends StatefulWidget {
  const connect({super.key});

  @override
  State<connect> createState() => _connectState();
}

class _connectState extends State<connect> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeBoard'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.note,size: 30,),
              ),
              Tab(
                icon: Icon(Icons.calendar_today,size: 30,),
              ),
              Tab(
                icon: Icon(Icons.food_bank,size: 30,),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("NotepadApplication"),
            ),
            Center(
              child: Text("CalendarApplication"),
            ),
            Center(
              child: Text("GroceryApplication"),
            ),
          ],
        ),
      ),
    );
  }}