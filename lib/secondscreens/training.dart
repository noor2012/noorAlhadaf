import 'package:alhadaf/tabs/attacs.dart';
import 'package:alhadaf/tabs/trainingFour.dart';
import 'package:alhadaf/tabs/trainingthree.dart';
import 'package:alhadaf/tabs/trainning.dart';
import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[800],
              bottom: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        'تدريبات رياضية',
                        style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'تكتيكات',
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'تدريبات حراس المرمي',
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'تدريبات المدربين',
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
              Trainning(),
              Attaccs()  ,
              TrainingThree(),
              TrainingFour()
              ],
            ),
          )),
    );
  }
}
