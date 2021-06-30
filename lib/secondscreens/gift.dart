import 'package:flutter/material.dart';
import '../tabs/person.dart';
import '../tabs/match.dart';

class Gift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[800],
              bottom: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(
                          'الفردي',
                          style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'المباريات',
                          style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ),
                  ]
              ) ,
            ),
            body: TabBarView(
              children: [
                Person(),
                Match()
              ],
            ),
          )),
    );
  }
}
