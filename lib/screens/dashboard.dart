import 'package:flutter/material.dart';
import 'package:pthr/const.dart';
import 'package:pthr/models/dashboard_card_model.dart';

class Dashboard extends StatefulWidget {
  final dis_list = Models.modelItem();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                    height: 450,
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: widget.dis_list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        var info = widget.dis_list[index];
                        return Card(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  "${info.name}",
                                  style: hintTextStyle.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${info.phn}",
                                  style: hintTextStyle.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),


                              ],
                            ),
                          ),
                        );
                      },
                    )),
                Container(
                  height: 200,
                  width: double.infinity,

                )
              ],
            ),
          ),
        ));
  }
}
