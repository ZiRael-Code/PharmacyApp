import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(CollapsibleCalendar());

class CollapsibleCalendar extends StatefulWidget {
  CollapsibleCalendar({super.key});

  @override
  _CollapsibleCalendarState createState() => _CollapsibleCalendarState();
}

class _CollapsibleCalendarState extends State<CollapsibleCalendar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color? color;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener((){
      setState(() {
        color = Color(vitalColors[_tabController.index]);
      });
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isCollapsed = false;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> graphPath = ['assets/images/vgraph.svg','assets/images/vgraph.svg','assets/images/vgraph.svg','assets/images/vgraph.svg','assets/images/vgraph.svg','assets/images/vgraph.svg'];
  List<String> vitalIcon = ['assets/images/bpicon.svg','assets/images/hrvicon.svg','assets/images/osicon.svg','assets/images/lipidicon.svg','assets/images/hearticon.svg','assets/images/glucoseicon.svg'];
  List<int> vitalColors = [0xffA64FFE, 0xffFF6161, 0xff2C68BF, 0xff1C9A9A, 0xff2C68BF, 0xff1C9A9A];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:
        Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.40)
          ),
        child:
        Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
        ),
    actions: [
         Container(
           padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.white.withOpacity(0.40)
         ),
           child: Icon(Icons.share, color: Colors.white,),
         ),
          SizedBox(width: 10,)
        ],
        backgroundColor: color,
        title: Text('Collapsible Calendar'),

          elevation: 2,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.60) , width: 2), // Gray border for selected tab
              // color: Colors.blue,
              shape: BoxShape.circle,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(6, (index) {
              return Container(
                padding: EdgeInsets.all(9),
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3), // Default semi-transparent color
                ),
                child: SvgPicture.asset(vitalIcon[index], color: Colors.white,),
              );
            }),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Calendar Header
          TableCalendar(
            firstDay: _focusedDay,
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                // _focusedDay = focusedDay; // update focusedDay as well
              });
            },
            calendarFormat: isCollapsed ? CalendarFormat.week : CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              rightChevronMargin: EdgeInsets.only(right: 69),
              leftChevronMargin: EdgeInsets.only(left: 69),
              leftChevronIcon: Container(
                alignment: Alignment.center,
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
                child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 15,),),
              ),
              rightChevronIcon: Container(
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
                child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: 15,),),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black, fontSize: 14),
                weekdayStyle: TextStyle(color: Colors.black, fontSize: 14),
                decoration: BoxDecoration()
            ),
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.black,fontSize: 20),
              weekNumberTextStyle: TextStyle(fontSize: 20),
              defaultTextStyle: TextStyle(fontSize: 20),
              todayTextStyle: TextStyle(fontSize: 20, color: Colors.white),
              disabledTextStyle: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                isCollapsed =!isCollapsed;
              });
            },
            child: Container(
                padding: EdgeInsets.only(right: 20),
                child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration:  BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(isCollapsed ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded),
              ),
              SizedBox(width: 5,),
              Text(isCollapsed ? 'Expand Calender': "Close Calender")
            ],
          )
          )
          ),
          SizedBox(height: 20,),
          SvgPicture.asset('assets/images/vgraph.svg'),

      // TabBarView(
      // controller: _tabController,
      // children: List.generate(6, (index) {
      //   return Center(
      //     child: Text(
      //       'Content for Tab ${index + 1}',
      //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     ),
      //   );
      // }),
      // )
        ],
      ),
    );
  }
}
