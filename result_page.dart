import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


class Resultspage extends StatelessWidget {
  Resultspage({this.knormal,this.bmi,this.s});
   final String knormal;
   final String bmi;
   final String s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Center(child: Text('BMI CALCULATOR')),
       ),
       body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(15),
                    child: Text('Your Results',
                      style: yourresult,
                    ),
                  ),
                ),
                Expanded(
                   flex: 5,
                    child: Reusablecard(
                      colour: Color(kactivecolor),
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                           knormal,
                            style: gcheckstyle,
                            textAlign:TextAlign.center,
                          ),
                          Text(
                            bmi,
                            style: resultstyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            s,
                            style: rtstyle,
                            textAlign:TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
                  },
                  child: Container(
                    child:  Center(
                      child: Text(
                        'RE-CALCULATE',style: kLargeButtonstyle,
                      ),
                    ),
                    width: double.infinity,
                    height: kbottomheight,
                    color: Color(0xFFF7DB3D1),
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                ),
              ],
            ),
       ),
    );
  }
}
