import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';
import 'CompletedOrders.dart';
import 'PendingOrders.dart';

class PrescriptionOrder extends StatefulWidget{
  @override
  _PrescriptionOrderState createState() => _PrescriptionOrderState();
}

class _PrescriptionOrderState extends State<PrescriptionOrder>  with SingleTickerProviderStateMixin {
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
      body: Padding(padding: EdgeInsets.all(12),
    child:  Column(
        children: [
          SizedBox(height: getFontSize(40, context)),
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
                  Tab(text: "Pending orders"),
                  Tab(text: "Completed orders"),
                ],
              ),
            ),
          ),
          SizedBox(height: getFontSize(10, context)),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: PendingOrders()),
                Center(child: CompletedOrders()),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}