import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

import '../Account/Device.dart';
import 'AllMed.dart';
void main() {
  runApp(MaterialApp(home: ViewInventory()));
}

class ViewInventory extends StatefulWidget {
  ViewInventory({super.key});

  @override
  State<ViewInventory> createState() => _ViewInventoryState();
}

class _ViewInventoryState extends State<ViewInventory> {
  int selectedIndex = 0; // Track selected tab index

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Container(
          width: getFontSize(45, context),
          height: getFontSize(45, context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Inventory"),
        actions: [
          GestureDetector(
            onTap: () {
              show_update_drug_bottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(right: getFontSize(10, context)),
              width: getFontSize(45, context),
              height: getFontSize(45, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context)),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: getFontSize(124, context),
                  height: getFontSize(124, context),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/doc.png'),
                  ),
                ),
                SizedBox(height: getFontSize(15, context)),
                Text(
                  "Dr. Sanni Store",
                  style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.w500),
                ),
                SizedBox(height: getFontSize(10, context)),
                SizedBox(
                  width: getFontSize(189, context),
                  child: Text(
                    "No. 33 Adegoke Street, Surulere, Lagos State",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black45, fontSize: getFontSize(14, context)),
                  ),
                ),
                SizedBox(height: getFontSize(25, context)),
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
                      contentPadding: EdgeInsets.symmetric(vertical: getFontSize(15, context)),
                    ),
                  ),
                ),
                SizedBox(height: getFontSize(25, context)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      condition(index: 0, text: "All"),
                      SizedBox(width: getFontSize(10, context)),
                      condition(index: 1, text: "Device"),
                      SizedBox(width: getFontSize(10, context)),
                      condition(index: 2, text: "Tablet"),
                      SizedBox(width: getFontSize(10, context)),
                      condition(index: 3, text: "Capsule"),
                    ],
                  ),
                ),
                SizedBox(height: getFontSize(10, context)),
                Expanded(
                  child: contentDisplay(),
                ),
              ],
            ),
            Positioned(
              bottom: getFontSize(20, context),
              right: getFontSize(20, context),
              child: InkWell(
                onTap: () {
                  show_add_drug_bottomSheet();
                },
                child: Container(
                  width: getFontSize(64, context),
                  height: getFontSize(64, context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: getFontSize(39, context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  condition({
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: getFontSize(22, context), right: getFontSize(22, context), top: getFontSize(12, context), bottom: getFontSize(12, context)),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Color(0xffE2EDFF),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.blue,
            fontSize: getFontSize(16, context),
          ),
        ),
      ),
    );
  }

  Widget contentDisplay() {
    switch (selectedIndex) {
      case 0:
        return AllMed();
      case 1:
        return Device();
      case 2:
        return Center(child: Text("Showing Tablets"));
      case 3:
        return Center(child: Text("Showing Capsules"));
      default:
        return SizedBox();
    }
  }

  void show_add_drug_bottomSheet() {
    TextEditingController tValue = TextEditingController();
    tValue.text = 0.toString();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Drug",
                  style: TextStyle(fontSize: getFontSize(20, context), fontWeight: FontWeight.bold),
                ),
                textField(
                    label: "Name",
                    hint: "Sapaprofen"),
                textFieldSuffixIcon(
                    label: "Type",
                    hint: "Tablet",
                    drop: ["Tablet", "Syrup", "Tinubu"]
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Content", style: TextStyle(fontSize: getFontSize(14, context)),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: getFontSize(25, context),),
                    SizedBox(
                      width: getFontSize(141, context),
                      child:   Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                        child:TextField(
                          readOnly: true,
                          controller: tValue,
                          decoration: InputDecoration(
                            prefix: IconButton(onPressed: (){
                              int.parse(tValue.text) > 0 ? tValue.text = (int.parse(tValue.text) - 1).toString() : null;
                            }, icon: Icon(Icons.keyboard_arrow_down)),
                            suffixIcon: IconButton(onPressed: (){
                              tValue.text = (int.parse(tValue.text) + 1).toString();
                            }, icon: Icon(Icons.keyboard_arrow_up)),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.normal,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: getFontSize(10, context),
                    ),
                    SizedBox(
                      width: getFontSize(141, context),
                      child:   textFieldSuffixIcon(
                          label: "",
                          hint: "Tablet",
                          drop: ["Tablet", "Syrup", "Tinubu"]
                      ),
                    ),
                  ],
                ),
                textField(
                    label: "Price",
                    hint: "N20,000"),
                textFieldSuffixIcon(
                    label: "Quantity in stock",
                    hint: "0",
                    drop: ["Tablet", "Syrup", "Tinubu"]
                ),
                SizedBox(height: getFontSize(20, context)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
                    child: Text(
                      'Save changes',
                      style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void show_update_drug_bottomSheet() {
    TextEditingController tValue = TextEditingController();
    tValue.text = 0.toString();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edit drug details",
                  style: TextStyle(fontSize: getFontSize(20, context), fontWeight: FontWeight.bold),
                ),
                textField(
                    label: "Name",
                    hint: "Sapaprofen"),
                textFieldSuffixIcon(
                    label: "Type",
                    hint: "Tablet",
                    drop: ["Tablet", "Syrup", "Tinubu"]
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Content", style: TextStyle(fontSize: getFontSize(14, context)),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: getFontSize(25, context),),
                    SizedBox(
                      width: getFontSize(141, context),
                      child:   Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                        child:TextField(
                          readOnly: true,
                          controller: tValue,
                          decoration: InputDecoration(
                            prefix: IconButton(onPressed: (){
                              int.parse(tValue.text) > 0 ? tValue.text = (int.parse(tValue.text) - 1).toString() : null;
                            }, icon: Icon(Icons.keyboard_arrow_down)),
                            suffixIcon: IconButton(onPressed: (){
                              tValue.text = (int.parse(tValue.text) + 1).toString();
                            }, icon: Icon(Icons.keyboard_arrow_up)),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.normal,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: getFontSize(10, context),
                    ),
                    SizedBox(
                      width: getFontSize(141, context),
                      child:   textFieldSuffixIcon(
                          label: "",
                          hint: "Tablet",
                          drop: ["Tablet", "Syrup", "Tinubu"]
                      ),
                    ),
                  ],
                ),
                textField(
                    label: "Price",
                    hint: "N20,000"),
                textFieldSuffixIcon(
                    label: "Quantity in stock",
                    hint: "0",
                    drop: ["Tablet", "Syrup", "Tinubu"]
                ),
                SizedBox(height: getFontSize(20, context)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
                    child: Text(
                      'Save changes',
                      style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

textField({
  required String label,
  required String hint,
}
    ){
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(label, style: TextStyle(fontSize: getFontSize(14, context)),),
      ),
      SizedBox(height: getFontSize(10, context),),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: TextField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.grey[400], fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
      SizedBox(height: getFontSize(10, context),)
    ],
  );
}


Widget textFieldSuffixIcon({
  required String label,
  required String hint,
  required List<String> drop,
}) {
  String? selectedValue;
  TextEditingController tValue = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: getFontSize(14, context)),
      ),
      SizedBox(height: getFontSize(10, context)),
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  readOnly: true,
                  controller: tValue,
                  decoration: InputDecoration(
                    hintText: selectedValue ?? hint,
                    suffixIcon: PopupMenuButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onSelected: (value) {
                        setState(() {
                          selectedValue = value;
                          tValue.text = value;
                        });
                      },
                      itemBuilder: (context) {
                        return drop
                            .map((option) => PopupMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                            .toList();
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      SizedBox(height: getFontSize(10, context),)
    ],
  );
}
}


