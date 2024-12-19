import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';

class DeviceSales3 extends StatefulWidget {
  DeviceSales3({super.key});

  @override
  State<DeviceSales3> createState() => _DeviceSales3State();
}

class _DeviceSales3State extends State<DeviceSales3> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Device sales',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(padding: EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: getFontSize(50, context),
        padding: EdgeInsets.all(4),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffE0E0E0),
            borderRadius: BorderRadius.circular(50)
        ),
        child:SizedBox(
          child:
          TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xff4F4F4F),
            tabs: [
              Tab(text: "Device ordered"),
              Tab(text: "Device sold"),
            ],
          ),
        ),
      ),
      SizedBox(height: getFontSize(10, context),),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(
                child:
                deviceOrdered()
            ),
            Center(
                child: deviceSold()
            ),
          ],
        ),
      ),
      ]
    )
    )
    );
  }

  deviceOrdered() {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: getFontSize(14, context),),
        Row(
          children: [
            month_date_design(
                "August 2022"
            ),
            Spacer(),
            Text("To", style: TextStyle(fontSize: getFontSize(16, context)),),
            Spacer(),
            month_date_design(
                "August 2022"
            ),
          ],
        ),
        SizedBox(height: getFontSize(24, context),),
        Row(
        children: [
          Text("Total devices ordered:"),
          Spacer(),
          Text("17")
          ]
        ),
        SizedBox(height: getFontSize(14, context),),
        Row(
        children: [
          Text("Total ordered (all-time):"),
          Spacer(),
          Text("178")
          ]
        ),
        SizedBox(height: getFontSize(16, context),),
        Divider(color: Colors.black12,),
        SizedBox(height: getFontSize(36, context),),
        Image.asset("assets/images/table.png")
      ],
    )
    );
  }

  deviceSold() {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: getFontSize(14, context),),
            Row(
              children: [
                month_date_design(
                    "August 2022"
                ),
                Spacer(),
                Text("To", style: TextStyle(fontSize: getFontSize(16, context)),),
                Spacer(),
                month_date_design(
                    "August 2022"
                ),
              ],
            ),
            SizedBox(height: getFontSize(24, context),),
            Row(
                children: [
                  Text("Total devices ordered:"),
                  Spacer(),
                  Text("17")
                ]
            ),
            SizedBox(height: getFontSize(14, context),),
            Row(
                children: [
                  Text("Total ordered (all-time):"),
                  Spacer(),
                  Text("178")
                ]
            ),
            SizedBox(height: getFontSize(16, context),),
            Divider(color: Colors.black12,),
            SizedBox(height: getFontSize(36, context),),
            Image.asset("assets/images/table1.png")
          ],
        )
    );
  }

  month_date_design(String s) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getFontSize(17, context), vertical: getFontSize(12, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xffE2EDFF)
      ),
      child: Row(
        children: [
          Text(s, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue),),
          Icon(Icons.keyboard_arrow_down_sharp, color: Colors.blue,),
        ],
      ),
    );
  }
}
