import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';
import '../Store/PrescriptionOrder.dart';
import '../Store/SalesHistory.dart';
import '../Store/purchase_device.dart';
import '../Store/view_inventory.dart';
import '../component/buttons.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<bool> networks = [false,false];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
        'Ajaokuta Rx',
          style: TextStyle(
              fontSize: getFontSize(26, context),
              fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500
          ),
        ),
            Spacer(),
            SvgPicture.asset('assets/images/ico.svg')
        ]
        ),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                show_switch_network_sheet();
              },
              child:
              Align(
                alignment: Alignment.centerLeft,
                child:
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal:15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(width: getFontSize(1, context), color: Colors.blue)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Main network", style: TextStyle(color: Colors.blue),),
                      SizedBox(width: getFontSize(8, context)),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE2EDFF),
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: getFontSize(32, context),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => PurchaseDevice()),
                      );
                    },
                    child: actions(
                      context,
                      Icons.add,
                      "Purchase devices",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => ViewInventory()),
                      );
                    },
                    child: actions(
                      context,
                      Icons.account_tree,
                      "View inventory",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => PrescriptionOrder()),
                      );
                    },
                    child: actions(
                      context,
                      Icons.edit_note_outlined,
                      "Prescription orders",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => SalesHistory()),
                      );
                    },
                    child: actions(
                      context,
                      Icons.history,
                      "Sales history",
                    ),
                  ),

                ]
            ),

            SizedBox(height: getFontSize(16, context),),
            Text("Recent orders", style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.w500),),
            SizedBox(height: getFontSize(10, context),),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child:
              Row(
                children: [
                  orders(
                    context,
                    "assets/images/pill3.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                  orders(
                    context,
                    "assets/images/save.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                  orders(
                    context,
                    "assets/images/pill3.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                ],
              ),
            ),
            SizedBox(height: getFontSize(25, context),),
            Text("Activities", style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.w500),),
            SizedBox(height: getFontSize(25, context),),
            Expanded(
                child:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      activity_tile(
                          des: "A patient ordered a device",
                          icon_path: Icons.person,
                          date: "12 0ct 2022"
                      ),
                      activity_tile(
                          des: "Devices were added to the inventory",
                          icon_path: Icons.public,
                          date: "12 0ct 2022"
                      ),
                      activity_tile(
                          des: "Dr. Michael had an appointment with a patient",
                          icon_path: Icons.person,
                          date: "12 0ct 2022"
                      ),
                      activity_tile(
                          des: "Dr. Tristan joned your network",
                          icon_path: "assets/images/pill.svg",
                          date: "12 0ct 2022"
                      ),
                    ],
                  ),
                )
            )
          ],
        ),),
    );
  }


  activity_tile({
    required String des,
    required icon_path, // Pass the profile path
    required String date
  }){
    return  Stack(
      children: [ Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: getFontSize(1, context), color: Colors.black12)
          ),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 14),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff4db551).withOpacity(0.50)
                      ),
                      child: icon_path is String ? SvgPicture.asset(icon_path, color: Colors.green,) : Icon(icon_path, color: Colors.green,) ,
                    ),
                     SizedBox(width: getFontSize(12, context),),
                    Container(
                      width: getFontSize(190, context),
                      child: Text(des, style:  TextStyle(fontSize: getFontSize(15, context)),),
                    )
                  ],
                ),
              ],
              )

          )

      ),
        Positioned(
            right: getFontSize(7, context),
            top: getFontSize(12, context),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: const Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(18)
                ),
                child:
                 Text("12 0ct 2022", style: TextStyle(fontSize: getFontSize(10, context), color: Colors.blue),)
            ),
        ),
      ],
    );
  }

  void show_switch_network_sheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,// Allows the content to be scrollable
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius    .    vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              // 50% of screen height
              minChildSize: 0.3,
              // Minimum height
              maxChildSize: 0.8,
              // Maximum height
              builder: (_, controller) {
                return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Switch network", style: TextStyle(fontSize: getFontSize(18, context)),),
                        SizedBox(height: getFontSize(15, context),),
                        network(
                            path: "assets/images/net1.jpeg",
                            name: "Main Network",
                            index: 0
                        ),
                        network(
                            path: "assets/images/net2.jpeg",
                            name: "Surulere doctors ",
                            index: 1
                        ),
                        Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) - 26,
                                child:
                                dark_blue_button(
                                    context,
                                    "Add Network"
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                  width: (MediaQuery.of(context).size.width / 2) - 26,
                                  child:
                                  light_blue_button(
                                      context,
                                      "Add Network"
                                  )
                              )
                            ]
                        )
                      ],
                    )

                );
              }
          );
        }
    );
  }
  network({required String path,
    required String name,
    required int index}) {
    bool selected_network = networks[index];
    return GestureDetector(
        onTap: (){
          setState(() {
            networks[index] =!selected_network;
            for (int i = 0; i < networks.length; i++){
              if (i != index){
                networks[i] = false;
              }
            }
          });
        },
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: getFontSize(50, context),
                    height: getFontSize(50, context),

                    child:
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(path),
                    )
                ),
                SizedBox(width: getFontSize(10, context),),
                Text(
                  name,
                  style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected_network ? Colors.green : Colors.grey.shade300
                  ),
                  child: Icon(Icons.check, color: Colors.white),
                )
              ],
            ),
            Divider(color: Colors.black26,),
            SizedBox(height: getFontSize(16.0, context)),
          ],
        )
    );
  }
}
orders(BuildContext context,
    String iconPath,
    String date, String type,
    String price, String by)
{
  return Container(
    margin: EdgeInsets.only(right: getFontSize(10, context)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey.shade400,
        width: getFontSize(1, context),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child:
          Row(
            children: [
              SvgPicture.asset(iconPath,),
              SizedBox(width: getFontSize(7, context),),
              Text("${date}-${type}", style: TextStyle(fontSize: getFontSize(14, context), color: Colors.black45),)
            ],
          ),
        ),
        SizedBox(height: getFontSize(7, context),),
        SvgPicture.asset("assets/images/line.svg", width: getFontSize(230, context),),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(22, context))),
                SizedBox(height: getFontSize(15, context),),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.shade300
                  ),
                  child: Row(
                    children: [
                      Text("By:  "),
                      Text(by, style: TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
              ],
            )
        )

      ],
    ),
  );
}

activity(BuildContext context, String icon_path, String text, String date) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade400,
          width: getFontSize(1, context),
        ),
      ),
      child: Column(
        children: [

        ],
      )
  );
}
actions(
    BuildContext context,
    IconData icon,
    String text
    ) {
  return Container(
      height: getFontSize(112, context),
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.all(getFontSize(12, context)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE2EDFF)
            ),
            child: Icon(icon, size: getFontSize(36, context), color: Colors.blue,),
          ),
          SizedBox(height: getFontSize(12, context),),
          SizedBox(
            width: getFontSize(65, context),
            child:  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(13, context),  fontWeight: FontWeight.w400),),
          )
        ],
      )
  );
}
