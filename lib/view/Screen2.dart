import 'package:flutter/material.dart';
import 'package:userproject/models/Users.dart';
class Screen2 extends StatefulWidget {
  Users obj;
  Screen2({this.obj});
  @override
  State<Screen2> createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                    child: Icon(Icons.arrow_back_ios_new_sharp),
                ),
                SizedBox(width: 100,),
                Text("Screen2")
              ],
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 280,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      CircleAvatar(
                        radius: 60, // Image radius
                        backgroundImage: NetworkImage(widget.obj.avatar),
                      ),
                      SizedBox(height: 15,),
                      Text(widget.obj.firstName,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black
                      ),),
                      Text(widget.obj.lastName,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black
                      ),),
                      SizedBox(height: 25,),
                      Text(widget.obj.email,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black
                      ),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}