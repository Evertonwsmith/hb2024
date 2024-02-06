import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class connect extends StatefulWidget {
  const connect({Key? key}) : super(key: key);

  @override
  State<connect> createState() => _connectState();
}

class _connectState extends State<connect> {
  late TextEditingController controller;
  late TextEditingController controller2;

  late DateTime _selected;

  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    _focusedDay = DateTime.now();
  }

  Widget calendarApp() {
    return TableCalendar(
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.green
        ),
      ),
      calendarFormat: CalendarFormat.month,
      firstDay: DateTime.utc(2023, 01, 01),
      lastDay: DateTime.utc(2030, 01, 01),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // update `_focusedDay` here as well
        });
      },
      onPageChanged: (focusedDate) {
        _focusedDay = focusedDate;
      },
    );
  }

  Widget notepadApp() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Notepad',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextField(
            controller: controller,
            minLines: 30,
            maxLines: 80,
            onChanged:(val){
              //saveload.saveGeneral('notes',val);

            } ,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '...',
            ),
          ),
        ],
      ),
    );
  }

  Widget groceryApp() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Groceries',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextField(
            controller: controller2,
            minLines: 30,
            maxLines: 80,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '...',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HomeBoard'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.note,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.food_bank,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              notepadApp(),
              calendarApp(),
              groceryApp(),
            ],
          ),
        ),
      ),
    );
  }
}
