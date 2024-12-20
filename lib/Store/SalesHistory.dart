import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';
import 'Device.dart';
import 'Drugs.dart';

class SalesHistory extends StatefulWidget {
  const SalesHistory({super.key});

  @override
  State<SalesHistory> createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory>  with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child:
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),),
              ),
              ),

            ),

            Spacer(),
            Container(
              alignment: Alignment.center,
              child:
              Center(child: Text(
                'Prescription Orders',
                style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal
                ),
              ),
              ),
            ),
            Spacer(),

          ],
        ),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(14),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: getFontSize(10, context)),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name, category...',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(
          height: getFontSize(30, context),
        ),
        Container(
          height: getFontSize(50, context),
          padding: EdgeInsets.all(4),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffE0E0E0),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SizedBox(
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorColor: Colors.transparent, // Removes the default bottom underline
              labelColor: Colors.black,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Color(0xff4F4F4F),
              tabs: [
                Tab(text: "Drugs"),
                Tab(text: "Devices"),
              ],
            ),
          ),
        ),
        SizedBox(height: getFontSize(10, context)),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(child: Drugs()),
              Center(child: Device()),
            ],
          ),
        ),

      ],
    )
    )
    );
  }
}
