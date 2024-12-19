import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';
import '../Store/prescription_orders.dart';
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

            Spacer(),
            Container(
              alignment: Alignment.center,
              child:
              Center(child: Text(
                'Pharmacy',
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
                      border: Border.all(width: 1, color: Colors.blue)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Main network", style: TextStyle(color: Colors.blue),),
                      SizedBox(width: 8),
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

            Row(
                children: [
                  actions(
                    context,
                    Icons.add,
                    "Purchase devices",
                    MaterialPageRoute(builder: (builder)=> PurchaseDevice()),
                  ),
                  actions(
                      context,
                      "assets/images/inventory.svg",
                      "View inventory",
                      MaterialPageRoute(builder: (builder)=> ViewInventory())
                  ),
                  actions(
                      context,
                      Icons.edit_note_outlined,
                      "Prescription orders",
                      MaterialPageRoute(builder: (builder)=>PrescriptionOrders())
                  ),

                  actions(
                      context,
                      Icons.history,
                      "Prescription orders",
                      MaterialPageRoute(builder: (builder)=>PrescriptionOrders())
                  ),
                ]
            ),

            SizedBox(height: 16,),
            Text("Recent orders", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
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
            SizedBox(height: 25,),
            Text("Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 25,),
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
              border: Border.all(width: 1, color: Colors.black12)
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
                    const SizedBox(width: 12,),
                    Container(
                      width: 190,
                      child: Text(des, style: const TextStyle(fontSize: 15),),
                    )
                  ],
                ),
              ],
              )

          )

      ),
        Positioned(
            right: 7,
            top: 12,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: const Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(18)
                ),
                child:
                const Text("12 0ct 2022", style: TextStyle(fontSize: 10, color: Colors.blue),)
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
                        Text("Switch network", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 15,),
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
                    width: 50,
                    height: 50,

                    child:
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(path),
                    )
                ),
                SizedBox(width: 10,),
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
            SizedBox(height: 16.0),
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
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1,
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
              SizedBox(width: 7,),
              Text("${date}-${type}", style: TextStyle(fontSize: 14, color: Colors.black45),)
            ],
          ),
        ),
        SizedBox(height: 7,),
        SvgPicture.asset("assets/images/line.svg", width: getFontSize(230, context),),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 15,),
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
          width: 1,
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
    icon,
    String text,
    MaterialPageRoute action
    ) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).push(action);
      },
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.all( icon is String ? getFontSize(16, context) :  getFontSize(12, context) ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE2EDFF)
            ),
            child: icon is String ? SvgPicture.asset(icon) : Icon(icon, size: getFontSize(36, context), color: Colors.blue,),
          ),
          SizedBox(height: 12,),
          SizedBox(
            width: 72,
            child:  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(13, context),  fontWeight: FontWeight.w400),),
          )
        ],
      )
  );
}
