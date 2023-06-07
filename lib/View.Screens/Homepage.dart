import 'package:exam_app/Componets/Business.dart';
import 'package:exam_app/Componets/Health.dart';
import 'package:exam_app/Componets/Sports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/BookMark_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  builder: (context) => Container(
                      height: h,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ListView.builder(
                        itemCount: Provider.of<BookMark_Provider>(context)
                            .m1
                            .BookMark
                            .length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                            title: Text(
                              Provider.of<BookMark_Provider>(context)
                                  .m1
                                  .BookMark[i],
                              style: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<BookMark_Provider>(context,
                                    listen: false)
                                    .RemoveBookmark(i);
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                      )),
                );
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
          bottom:
              TabBar(indicatorColor: Colors.white, indicatorWeight: 3, tabs: [
            Tab(
              text: "HEALTH",
            ),
            Tab(
              text: "BUSINESS",
            ),
            Tab(
              text: "SPORTS",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            HealthPage(),
            BusinessPage(),
            SportsPage(),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
