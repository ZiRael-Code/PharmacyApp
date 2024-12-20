import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/buttons.dart';


class Dashboard extends StatefulWidget {
  final void Function(int index) onItemTapped;
  Dashboard({super.key,
    required this.onItemTapped});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> show_notification = [
    {
      'icon': Icon(
        Icons.message,
        color: Colors.blue,
      ),
      'text': "You have a new message from Alexander..."
    },
    {
      'icon': Icon(
        Icons.local_pharmacy,
        color: Colors.blue,
      ),
      'text': 'Your malaria drugs have been exhausted',
    },
    {
      'icon': Icon(Icons.devices, color: Colors.blue),
      'text': 'Your device is ready for pickup',
    },
  ];
  bool isCollaps = false;
  List<bool> networks = [false,false];
  late int reverseIndex = show_notification.length -1;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    // getFontSize(double d) {
    //   return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
    // }
    getFontSize(double d, BuildContext context) {
      return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
             SizedBox(width: getFontSize( 12.0, context)),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Life Hospital",
                  style: TextStyle(
                    fontSize: getFontSize(26.0, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: getFontSize(10, context),
            ),
            SvgPicture.asset(
              'assets/images/web.svg',
              fit: BoxFit.contain,
            ),
            SizedBox(width: getFontSize(10, context),),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  fit: BoxFit.contain,
                ),
                // onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder:
                //       (context) => Notifications()));
                // },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(14),
                child: Column(
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
                  SizedBox(height: getFontSize(10, context),),


                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:
                 isCollaps ? buildNotificationList(Stack(children: []))
                            : buildNotificationList(Column(children: [])),)
                  ],
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        "Patients readings",
                        style: TextStyle(
                          fontSize: getFontSize(19, context),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: AutoSizeText('See all',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: getFontSize(16.0, context),
                              )))
                    ],
                  ),
                  SizedBox(
                    height: getFontSize(20, context),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        patiencte_reading(
                            name: 'Salami Adebayo',
                            path: 'assets/images/doc.png',
                            date: "12th Sept 2022",
                            time: "4:17pm",
                            bp: '90/60mmHg,',
                            hba1c: '42mmol/mol,',
                            ihra: '5.7% ...',
                            regularity: 'irregular',
                            regularityColor: Color(0xffFF8E3C),
                            action: null
                            // MaterialPageRoute(builder: (builder)=> PatientReading())
                        ),
                        patiencte_reading(
                            name: 'Salami Adebayo',
                            path: 'assets/images/man1.png',
                            date: "12th Sept 2022",
                            time: "4:17pm",
                            bp: '90/60mmHg,',
                            hba1c: '42mmol/mol,',
                            ihra: '5.7% ...',
                            regularity: 'irregular',
                            regularityColor: Color(0xffFF8E3C)
                            // action: MaterialPageRoute(builder: (builder)=> PatientReading())
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: getFontSize(14, context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Network updates",
                      style: TextStyle(
                        fontSize: getFontSize(19, context),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ])),
            Padding(
                padding: EdgeInsets.only(left: getFontSize(5, context), right: getFontSize(5, context)),
                child: Container(
                  padding: EdgeInsets.only(left: getFontSize(1.5, context), right: getFontSize(1.5, context)),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getFontSize(3, context),
                      ),
                      network_update(
                          network_name: "My Network",
                          profile_path: "assets/images/doc1.png",
                          name: "Rayoo Rayoo",
                          time: "11:20am",
                          date: "9th Sept 2022",
                          text:
                              "We have restocked our pharmacy and new drugs are now available for sale.",
                          imageList: []
                          // action: MaterialPageRoute(builder: (builder)=> Ministore())
                          ,context: context
                      ),
                      network_update(
                          network_name: "James’ Network",
                          profile_path: "assets/images/doc1.png",
                          name: "New Life Hospital",
                          time: "11:20am",
                          date: "9th Sept 2022",
                          text:
                              "We have new devices to measure vitals in stock.",
                          imageList: [
                            "assets/images/doc.png"]
                          // action: MaterialPageRoute(builder: (builder)=> Ministore())
                          ,context: context
                      ),
                      network_update(
                          network_name: "My Network",
                          profile_path: "assets/images/doc1.png",
                          name: "Rayoo Rayoo",
                          time: "11:20am",
                          date: "9th Sept 2022",
                          text:
                          "We have restocked our pharmacy and new drugs are now available for sale.",
                          imageList: []
                          // action: MaterialPageRoute(builder: (builder)=> Ministore())
                          ,context: context

                      ),
                      network_update(
                          network_name: "My Network",
                          profile_path: "assets/images/doc1.png",
                          name: "Rayoo Rayoo",
                          time: "11:20am",
                          date: "9th Sept 2022",
                          text:
                          "We have restocked our pharmacy and new drugs are now available for sale.",
                          imageList: [
                            "assets/images/doc.png",
                            "assets/images/doc.png",
                            "assets/images/doc.png",
                            "assets/images/doc.png",
                            "assets/images/doc.png",
                            "assets/images/doc.png"
                          ]
                          // action: MaterialPageRoute(builder: (builder)=> Ministore())
                          ,context: context
                      ),

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
  Widget buildNotificationList(Widget layout) {
    int reverseIndex = show_notification.length - 1;

    List<Widget> notificationWidgets = List.generate(
      show_notification.length,
          (index) {
        Map<String, dynamic> nots = show_notification[index];
        return Center(child:  notification(
          nots['icon'],
          nots['text'],
          reverseIndex-- ,
        )
        );
      },
    );

    if (layout is Stack) {
      return Stack(children: notificationWidgets);
    } else if (layout is Column) {
      return Column(children: notificationWidgets);
    } else {
      return SizedBox();
    }
  }

  notification(Icon icon, String text,
      int index) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double textContSize = isCollaps ? index == 0 ?
        w * 0.65
        : index == 1
        ? w * 0.55
        : index == 2
        ? w * 0.48
        : double.infinity

        : w * 0.6
    ;

    return GestureDetector(
      onTap: (){
        setState(() {
          isCollaps = !isCollaps;
        });
      },
        child: SizedBox(
      // height: getFontSize(150, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(height: isCollaps ?
        index == 0 ? h * 0.0
            : index == 1
        ? h * 0.020
            : index == 2
        ? h * 0.040
          : 0
          : 0,),

        Container(
          alignment: Alignment.center,
          width: isCollaps ?  index == 0 ?
          double.infinity
          : index == 1
          ? w * 0.85
              : index == 2
          ? w * 0.78
              : double.infinity

        : double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(10, context),),
      padding: EdgeInsets.only(top: getFontSize(19, context), bottom: getFontSize(19, context), left: getFontSize(12, context), right: getFontSize(12, context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffE2EDFF)),
            child: icon,
          ),
          SizedBox(width: w * 0.04,),
          Align(
            child:
          Container(
            alignment: Alignment.centerLeft,
            width: textContSize,
            child: AutoSizeText(text,
                style: TextStyle(fontSize: getFontSize(16.0, context)* MediaQuery.of(context).textScaleFactor, color: Colors.black45),
                overflow: TextOverflow.ellipsis),
          ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
          child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue),
          )

            ],
      ),

      ),
        ]
        ),
    )
    );
  }

  patiencte_reading({
    required String name,
    required String path,
    required String date,
    required String bp,
    required String hba1c,
    required String ihra,
    required String regularity,
    required Color regularityColor,
    required String time,
    action,
    // required MaterialPageRoute action,
  }) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return InkWell(
    onTap: () =>{
      Navigator.push(context, action)
    },
        child: Container(
      margin: EdgeInsets.only(right: getFontSize(15, context)),
      width: w * 0.80,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: getFontSize(0.7, context), color: Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: regularityColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              regularity,
              style: TextStyle(
                color: regularityColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: getFontSize(12.0, context)),
          // User Information
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage(path), // Replace with your image asset
                radius: 24.0,
              ),
              SizedBox(width: getFontSize(12.0, context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: getFontSize(18.0, context),
                    ),
                  ),
                  SizedBox(height: getFontSize(4.0, context)),
                  Text(
                    '$time · $date',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getFontSize(12.0, context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: getFontSize(16.0, context)),
          SvgPicture.asset("assets/images/line.svg"),
          SizedBox(height: getFontSize(8.0, context)),
          // Health Readings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'BP: ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: getFontSize(12, context)),
                  ),
                  Text(bp, style: TextStyle(fontSize: getFontSize(12, context)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'HbA1c: ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: getFontSize(12, context)),
                  ),
                  Text(hba1c, style: TextStyle(fontSize: getFontSize(12, context)),

                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'IHRA: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: getFontSize(12, context)),
                  ),
                  Text(ihra, style: TextStyle(fontSize: getFontSize(12, context)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      ),
    );
  }


//

  getFontSize(double d, BuildContext context) {
    return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
  }

  void show_switch_network_sheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allows the content to be scrollable
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
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
network_update({
  required String profile_path,
  required String name,
  required String network_name,
  required String date,
  required String time,
  required List<String> imageList,
  required String text,
  action,
  // required MaterialPageRoute action,
  required BuildContext context
}) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;

  int lenght = imageList.length;
  if (imageList.length > 4) {
    lenght = 4;
  }
  return GestureDetector(
    onTap: () => {
      Navigator.push(context, action)
    },
      child: Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: getFontSize(15, context)),
    decoration: BoxDecoration(color: Colors.white),
    padding: EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: getFontSize(42, context) * w / 375,
              height: getFontSize(42, context) * h / 812,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profile_path),
              ),
            ),
             SizedBox(
              width: getFontSize(10, context),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  AutoSizeText(
                    "$name . ",
                    style: TextStyle(fontSize: getFontSize(17, context)),
                  ),
                  Text(
                    network_name,
                    style: TextStyle(color: Colors.blue),
                  )
                ]),
                Text("$time . $date",
                    style: TextStyle(color: Colors.black45))
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              color: Colors.black,
            )
          ],
        ),
        SizedBox(
          height: getFontSize(20, context),
        ),
        SizedBox(
          width: getFontSize(285, context),
          child: Text(text, style: TextStyle(fontSize: getFontSize(16.8, context))),
        ),
        SizedBox(
          height: getFontSize(20, context),
        ),
        imageList.length == 1
            ? imageViewer(w: double.infinity, h: 326 * h / 817, path: imageList[0], imageList: imageList, index: 0,
            context: context
        )
            : imageList.length > 1
            ? Center(child:  Wrap(
          direction: Axis.horizontal,
          children: List.generate(lenght, (index) {
            return imageViewer(
                w: getFontSize(157, context), h: getFontSize(170, context), path: imageList[index],
                imageList: imageList,
                index: index,
              context: context
            );
          }),
        )
        )
            : SizedBox(height: getFontSize(15, context),),
        SizedBox(height: getFontSize(8, context),),
        Align(alignment: Alignment.center,
            child:
            Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: getFontSize(1, context),
                    ),
                    color: Color(0xffE2EDFF)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("View details", style: TextStyle(color: Colors.blue, fontSize: getFontSize(16, context)),),
                    Icon(Icons.arrow_forward, color: Colors.blue,)
                  ],
                )))
      ],
    ),
    ),
  );
}


Widget imageViewer({
  required double w,
  required double h,
  required String path,
  required int index,
  required List<String> imageList,
  required BuildContext context,
}) {
  return Container(
      margin: EdgeInsets.only(right: getFontSize(10, context), bottom: getFontSize(10, context)),
      child: Stack(
        children: [
          SizedBox(
              width: w,
              height: h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
              )
          ),
          if (imageList.length > 4 && index == 3)
            Container(
                width: w,
                height: h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.50),
                ),
                child: Center(child: Text("+${imageList.length - index}",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getFontSize(26, context)),),
                ))
        ],)
  );
}

getFontSize(double d, BuildContext context) {
  return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
}

//
// void main() {
//   runApp(MaterialApp(home: Dashboard()));
// }

