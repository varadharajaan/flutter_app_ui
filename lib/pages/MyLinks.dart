import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/User_view.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app/models/Ids.dart';
import 'package:flutter_app/models/model.dart';



class MyLinks extends StatefulWidget with NavigationStates {
  final User user;

  const MyLinks({Key key, this.user}) : super(key: key);

  @override
  _MyLinksState createState() => _MyLinksState();
}
class _MyLinksState extends State<MyLinks> {
  @override

  Widget build(BuildContext context) {
    print(widget.user.id);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(width: 20,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey,),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          )
        ],
        backgroundColor: Colors.white70,
        title: Center(
          child: Text(
               //widget.user.name,
               'The Network',
               style: TextStyle(
                 fontSize: 30,
                 color: Colors.blue,
          ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Userview(main_user: widget.user,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),

                ),
              ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical : 25.0),
                      child: Container(
                        height: 150,
                        color: Theme.of(context).accentColor,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.user.links?.length ?? 1,
                            itemBuilder: (BuildContext context,int index){
                              String nam = net[widget?.user?.links[index] ?? 0].name ?? 'noone';
                              return GestureDetector(
                                onTap:  () {
                                  print(net[widget.user.links[index]].name);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyLinks(user: net[widget.user.links[index]],
                                        )),
                                  );
                                  },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( horizontal : 10.0),
                                  child: Column(
                                    children: <Widget>[
                                        CircleAvatar(
                                          radius: 35,
                                          child: Icon(
                                            Icons.perm_identity,
                                            color: Colors.white,
                                          ),
                                        ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        //index.toString(),
                                        nam,
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            }),
                      ),
                    ),
                  ],
                ), // The Custom links
            ),

          ),

        ],
      )
    );
  }
}