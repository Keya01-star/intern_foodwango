import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/interests.dart';

import 'job_description.dart';

class info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return infoState();
    
  }
}

class infoState extends State<info> {
   List gender = ["Normal User", "Pro User"];

  String select;
  Row addRadioButton(int btnValue, String title,String radio) {
    if(radio=='true'){
      return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          new InkWell(
          child: Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        ),
        Text(title)
      ],
    );
    }
    else{
      return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
    }
    
  }
  var infoFormKey = GlobalKey<FormState>();

  var temp;
  bool radiobutton=false;

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Form(
          key: infoFormKey,
          autovalidate: true,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Education',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Center(
                    child: Gender(),
                  ),
                ),
                Text(
                  'My Gender',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(child: Education())),
                Text(
                  'How I Speak English',
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(
                      child: English(),
                    )),
                     
                Row(
                children: <Widget>[
                  Text(
                    'Are you a?? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                 Column(
                   children: <Widget>[ 
                      addRadioButton(0, 'Normal User','false'),
                      InkWell(
                       onTap:() => _showDialog(),
                       child: addRadioButton(1, 'Pro User','true') ,
                      ),
                     
                      
                   ],
                 ),
                 
                ],
              ),
             
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (infoFormKey.currentState.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InterestedIn();
                            }
                            )
                            );
                          }
                        
                        });
                      },
                      color: Color(0xFF21BFBD),
                      child: Text(
                        'SAVE',
                      ),
                      elevation: 6.0,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new _SystemPadding(child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Pro User Code', hintText: 'A6fhd9',
                      labelStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF21BFBD)))
                    ),
                    
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            color: Color(0xFF21BFBD),
              child: const Text('DONE',style:TextStyle(color:Colors.black),),
              onPressed: () {
                Navigator.pop(context);
              }),
          
        ],
      ),),
    );
  }



}

class Education extends StatefulWidget {
  @override
  _EducationState createState() => new _EducationState();
}

class _EducationState extends State<Education> {
  int _value = 1;

  List<String> education = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: <Widget>[
choiceChipWidget(education),
      ],
    );
  }
}

class Gender extends StatefulWidget {
  @override
  GenderState createState() => GenderState();
}

class GenderState extends State<Gender> {
  int _value = 1;

  List<String> gender = ['Below 10th', '10th Pass', '12th Pass', 'Graduate'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: <Widget>[
choiceChipWidget(gender),
      ],
    );
  }
}

class English extends StatefulWidget {
  @override
  EnglishState createState() => EnglishState();
}

class EnglishState extends State<English> {
  int _value = 1;

  List<String> english = [
    'No English',
    'Little English',
    'Good English',
    'Fluent English'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: <Widget>[
choiceChipWidget(english),
      ],
    );
  }
}
class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Color(0xFF21BFBD),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
       // padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}