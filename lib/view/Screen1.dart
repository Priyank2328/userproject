import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:userproject/providers/UserProvider.dart';
import 'package:userproject/view/Screen2.dart';
class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}
class _Screen1State extends State<Screen1> {
  UserProvider provider;
  getdata() async
  {
    await provider.ViewUser(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UserProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Users List"),
        ),
      ),
      body: (provider.alldata!=null)?ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>Screen2(
                            obj: provider.alldata[index],
                          ))
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 48, // Image radius
                              backgroundImage: NetworkImage(provider.alldata[index].avatar.toString()),
                            ),

                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(provider.alldata[index].firstName.toString().toUpperCase(),style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black
                                ),),
                                SizedBox(height: 10.0,),
                                Text(provider.alldata[index].lastName.toString().toUpperCase(),style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black
                                ),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ):
      Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}
