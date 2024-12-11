import 'package:flutter/material.dart';

List<int> generateCalendarDays(int month) {
  int year = DateTime.now().year;

  int previousMonthLastDay = DateTime(year, month, 0).day;
  int currentMonthLastDay = DateTime(year, month + 1, 0).day;

  List<int> days = [];
  days.add(previousMonthLastDay);

  for (int i = previousMonthLastDay; days.length < (35 - currentMonthLastDay - 5); i--) {
    days.insert(0, i);
  }
  for (int i = 1; i <= currentMonthLastDay; i++) {
    days.add(i);
  }

  int remainingDays = 35 - days.length;
  for (int i = 1; i <= remainingDays; i++) {
    days.add(i);
  }

  return days;
}

class DrugCompliance extends StatefulWidget {
  DrugCompliance({super.key});

  @override
  State<DrugCompliance> createState() => _DrugComplianceState();
}

int current_month = 1;

class _DrugComplianceState extends State<DrugCompliance> {
  @override
  void initState() {
    super.initState();
    if (current_month <= 1){
      current_month = 1;
    }else if(current_month >= 12){
      current_month = 12;
    }
  }
  List<int> days = generateCalendarDays(10);
  List<Map<String, dynamic>> usedMedsDays = [
    {'day': 4, 'indicator': Colors.red},
    {'day': 5, 'indicator': Colors.red},
    {'day': 6, 'indicator': Colors.red},
    {'day': 7, 'indicator': Colors.red},
    {'day': 8, 'indicator': Color(0xff1BE43B)},
    {'day': 9, 'indicator': Color(0xff1BE43B)},
    {'day': 10, 'indicator': Color(0xffFFA135)},
    {'day': 11, 'indicator': Color(0xff1BE43B)},
    {'day': 12, 'indicator': Color(0xff1BE43B)},
    {'day': 13, 'indicator': Color(0xffFFA135)},
    {'day': 14, 'indicator': Color(0xff1BE43B)},
    {'day': 15, 'indicator': Color(0xff1BE43B)},
    {'day': 16, 'indicator': Color(0xff1BE43B)},
    {'day': 17, 'indicator': Colors.red},
    {'day': 18, 'indicator': Color(0xff1BE43B)},
    {'day': 19, 'indicator': Color(0xff1BE43B)},
    {'day': 20, 'indicator': Color(0xff1BE43B)},
  ];

  List<String> daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(padding: EdgeInsets.only(left: 5, right: 5),
    child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (current_month > 1) {
                    current_month--;
                    days = generateCalendarDays(current_month);
                  }
                });
              },
              child:
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 16, color: Colors.white,),
            ),
            ),
            SizedBox(width: 12,),
            Text(monthNames[current_month-1].toString(), style: TextStyle(fontSize: 16),),
            SizedBox(width: 12,),
           GestureDetector(
              onTap: () {
                setState(() {
                  if (current_month < 12) {
                    current_month++;
                    days = generateCalendarDays(current_month);
                  }
                });
              },
             child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white,),
            )
            )
          ],
        ),
        SizedBox(height: 25,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysOfWeek.map((day) {
            return Container(

              alignment: Alignment.center,
              width: 44,
                child: Text(
                day,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              )
              );
          }).toList(),
        ),
        SizedBox(height: 8),

      Center(child:  Wrap(
        children:
        List.generate(days.length, (index) {
          dynamic lol;
          int day = days[index];

          Set<int> styledIndices = {};

          if (usedMedsDays.isNotEmpty) {
            bool found = false;

            for (var usedMed in usedMedsDays) {
              if (usedMed['day'] == day && !styledIndices.contains(index)) {
                lol = Container(
                  width: 44,
                  height: 53,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(children: [
                    Positioned(
                      top: 4,
                      right: 4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                            color: usedMed['indicator'],
                          ),
                        ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                      '$day',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ),
                  ],)
                );
                styledIndices.add(index);
                found = true;
                break;
              }
            }

            if (!found) {
              lol = Container(
                width: 44,
                height: 53,
                alignment: Alignment.center,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$day',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black26),
                ),
              );
            }
          }

          return lol;
        }),

    )
      ),
        SizedBox(height: 25,),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xffFF6161),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "The medications were not taken that day ",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xffFFA135),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "Some of the medications were taken that day ",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xff1BE43B),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "All the medications were taken that day",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        )
      ],)
          )
      )
      )
    );
  }
}


void main() {
  List<int> calendarDays = generateCalendarDays(5);

  print(calendarDays);
}
