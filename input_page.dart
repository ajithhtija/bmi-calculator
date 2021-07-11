import 'dart:ui';
import 'result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'Calculatorbrain.dart';
import 'constants.dart';
enum gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  gender selectedgender;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Expanded(
             child: Row(
              ///container 1
               children: <Widget>[
                 Expanded(
                   child: Reusablecard(
                         onpress:() {
                         setState(() {
                         selectedgender = gender.male;
                         });
                         },
                       colour: selectedgender==gender.male?Color(kinactivecolor):Color(kactivecolor),
                       cardchild: Iconcontent(icon: FontAwesomeIcons.mars,label: 'MALE'),
                        ),
                     ),
                 Expanded(
                   child: Reusablecard(
                     onpress:() {
                       setState(() {
                         selectedgender = gender.female;
                       });
                      },
                     colour: selectedgender==gender.female?Color(kinactivecolor):Color(kactivecolor),
                     cardchild: Iconcontent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),
                   ),
                 ),
               ],
             ),
           ),
             Expanded(
             child: Reusablecard(
               colour: Color(kactivecolor),
               cardchild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     'HEIGHT',
                      style: klabeltextstyle,
                    ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: <Widget>[
                        Text(
                          height.toString(),
                           style: knumberstyle,
                        ),
                         Text(
                           'cm',
                            style: klabeltextstyle,
                         ),
                       ],
                     ),

                   SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(kinactivecolor),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(kinactivecolor),
                          overlayColor: Color(kinactivecolor),
                          thumbShape:
                           RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                     child: Slider(
                         value: height.toDouble(),
                          max: 220,
                          min: 120,
                          activeColor: Color(0xFFA8A9BF),
                          inactiveColor: Color(0xFFA8A9BF),
                          onChanged: (double newvalue){
                           setState(() {
                             height = newvalue.round();
                           });
                          },
                     ),
                   )
                 ],

               ),),
           ),
             Expanded(
               child: Row(
                 ///container 1
                 children: <Widget>[
                   Expanded(
                     child: Reusablecard(
                       colour: Color(kactivecolor),
                       cardchild: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text(
                             'WEIGHT',
                             style: klabeltextstyle,
                           ),
                           Text(
                             weight.toString(),
                             style: knumberstyle,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                             Roundiconbutton(
                               icon: FontAwesomeIcons.minus,onpressed: (){
                                 setState(() {
                                   weight--;
                                 });
                             },
                             ),
                               SizedBox(
                                 width: 15.0,
                               ),
                               Roundiconbutton(
                                 icon: FontAwesomeIcons.plus,onpressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                   Expanded(
                      child: Reusablecard(
                        colour: Color(kactivecolor),
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: klabeltextstyle,
                            ),
                            Text(
                              age.toString(),
                              style: knumberstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Roundiconbutton(
                                  icon: FontAwesomeIcons.minus,onpressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Roundiconbutton(
                                  icon: FontAwesomeIcons.plus,onpressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                ),
                              ],
                            ),
                          ],
                        ),
                         ),
                     ),
                 ],
               ),
             ),
             GestureDetector(
               onTap: (){
                 CalculatorBrain cb = CalculatorBrain(weight: weight,height: height);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Resultspage(
                   knormal: cb.getresult(),
                   bmi: cb.getbmi(),
                   s: cb.getinterpretation(),
                 )));
               },
               child: Container(
                 child:  Center(
                   child: Text(
                     'CALCULATE',style: kLargeButtonstyle,
                   ),
                 ),
                 width: double.infinity,
                 height: kbottomheight,
                 color: Color(0xFFF93BDD6),
                 margin: EdgeInsets.only(top: 10.0),
               ),
             ),
           ],
      ),
    );
  }
}

class Roundiconbutton extends StatelessWidget {

  Roundiconbutton({this.icon,this.onpressed});
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onpressed,
        child: Icon(icon),
        shape: CircleBorder(),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),
        fillColor: Color(0xFFA8A9BF),
    );
  }
}
