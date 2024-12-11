import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'add_a_patient.dart';

class SearchPatient extends StatefulWidget {
  SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {

 TextEditingController controller = TextEditingController();

  final List<String> names = [
    "Richard Ferguson",
    "Richelle Boluwatife",
    "Richmond",
    "Rick",
    "Rita",
    "Ricky",
    "Rachael"
  ];
  String query = "";
  bool showAddPatient = false;
  @override
  Widget build(BuildContext context) {
    List<String> filteredNames = names
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE5E5E5),
              ),
              child: SvgPicture.asset('assets/images/back.svg',
                width: 8.0,
                height: 15,),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child:
              Center(child: Text(
                'Search patient',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal
                ),
              ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                    if (filteredNames.isEmpty){
                      setState(() {
                        showAddPatient = true;
                      });
                    }
                  });
                },
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[300]),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.black54),
                    onPressed: () {
                      setState(() {
                        query = ""; // Clear the search query
                        controller.text = "";
                      });
                    },
                  )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            SizedBox(height: 16),
            Visibility(
              visible: controller.text.isNotEmpty,
              child:
            Expanded(
              child: ListView.builder(
                itemCount: filteredNames.length,
                itemBuilder: (context, index) {
                  String name = filteredNames[index];
                  return ListTile(
                    leading: Icon(Icons.search, color: Colors.black54),
                    title: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      controller.text = name;

                      // Handle item tap (if needed)
                      print("Tapped on $name");
                    },
                  );
                },
              ),
            ),
            ),
            // Search results


           controller.text.isEmpty ? Column(children: [
              SizedBox(height: 60,),
            SvgPicture.asset('assets/images/searchname.svg'),
            SizedBox(
              width: 260,
                child: Text(textAlign: TextAlign.center, "Start typing a patient’s name or phone number to search for them. Only patients you’ve added will show up here."),
            ),
              ]
            )

              :
          Container(),


            filteredNames.isEmpty && controller.text.isNotEmpty ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No users were found.", style: TextStyle(fontSize: 14),),
                SizedBox(height: 12,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> AddAPatient()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 7.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add a new patient',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
                :
                Container()

    ]
    )
      ),
    );
  }
}
