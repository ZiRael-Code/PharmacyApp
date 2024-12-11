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
          width: 45,
          height: 45,
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
              margin: EdgeInsets.only(right: 10),
              width: 45,
              height: 45,
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
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 124,
                  height: 124,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/doc.png'),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Dr. Sanni Store",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 189,
                  child: Text(
                    "No. 33 Adegoke Street, Surulere, Lagos State",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.only(right: 10),
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
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      condition(index: 0, text: "All"),
                      SizedBox(width: 10),
                      condition(index: 1, text: "Device"),
                      SizedBox(width: 10),
                      condition(index: 2, text: "Tablet"),
                      SizedBox(width: 10),
                      condition(index: 3, text: "Capsule"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: contentDisplay(),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  show_add_drug_bottomSheet();
                },
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 39,
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
        padding: EdgeInsets.only(left: 22, right: 22, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Color(0xffE2EDFF),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.blue,
            fontSize: 16,
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  child: Text("Content", style: TextStyle(fontSize: 14),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25,),
                    SizedBox(
                      width: 141,
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
                      width: 10,
                    ),
                    SizedBox(
                      width: 141,
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
                SizedBox(height: 20),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Save changes',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  child: Text("Content", style: TextStyle(fontSize: 14),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25,),
                    SizedBox(
                      width: 141,
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
                      width: 10,
                    ),
                    SizedBox(
                      width: 141,
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
                SizedBox(height: 20),
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
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Save changes',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
        child: Text(label, style: TextStyle(fontSize: 14),),
      ),
      SizedBox(height: 10,),
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
      SizedBox(height: 10,)
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
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 10),
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
      SizedBox(height: 10,)
    ],
  );
}



