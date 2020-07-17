import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/company_details.dart';
import 'package:foodwango_job/services/auth.dart';

class jobdescription extends StatefulWidget {
  final Recruiter recDb;
  jobdescription({Key key, @required this.recDb}) : super(key: key);
  @override
  _jobdescriptionstate createState() => _jobdescriptionstate(recDb: recDb);
}

class _jobdescriptionstate extends State<jobdescription> {
  final Recruiter recDb;

  String qual;
  _jobdescriptionstate({Key key, @required this.recDb}) : super();
  final Authservice _auth = Authservice();
  List<String> qualification2 = [
    "<10th pass",
    "10th pass or above",
    "12th pass or above",
    "Graduate",
  ];
  List<String> experience2 = [
    "0-6 months",
    "1-2 years",
    "More than 2 years",
  ];
  List<String> gender = ["Female", "Male", "Both"];
  List<String> speakingskill = [
    "Does not speak English",
    "Speaks thoda English",
    "Speaks good English",
    "Speaks fluent English",
  ];
  List<String> callrange = [
    "5km",
    "10km",
    "20km",
    "Anywhere in the city",
  ];
  List<String> workFromHome = [
    "Yes",
    "No",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Row(
                  children: <Widget>[
                    Text("2/3",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                      ),
                      onTap: () {
                        recDb.saveRecruiterData();
                        _auth.signOut();
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Job',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Description',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
                SizedBox(width: 80.0),
                ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Color(0xFF21BFBD), // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return companydetails(recDb:recDb);
                        }));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: 1550,
            // height: MediaQuery.of(context).size.height - 5.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'Candidates minimum qualification should be',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    height: 120,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        Gender(recDb: recDb,),
                      ],
                    )),
                Container(
                  child: Text(
                    'Candidates minimum work experience must be',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 120,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        Experience(recDb: recDb,),
                      ],
                    )),
                Container(
                  child: Text(
                    'Gender of the staff should be',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 70,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        choiceChipWidget(gender),
                      ],
                    )),
                Container(
                  child: Text(
                    'Candidates speaking skill should be',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 240,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        choiceChipWidget(speakingskill),
                      ],
                    )),
                Container(
                  child: Text(
                    'Must-Have Skills for the Staff',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 240,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 3.0,
                          children: <Widget>[
                            filterChipWidget(chipName: 'Articleship'),
                            filterChipWidget(chipName: 'Audit'),
                            filterChipWidget(chipName: 'Book Keeping'),
                            filterChipWidget(chipName: 'Chartered Account'),
                            filterChipWidget(chipName: 'Finalization'),
                            filterChipWidget(chipName: 'GST'),
                            filterChipWidget(chipName: 'Journal Entry'),
                            filterChipWidget(chipName: 'TDS'),
                            filterChipWidget(chipName: 'Tally'),
                            filterChipWidget(chipName: 'Tax returns'),
                            filterChipWidget(chipName: 'Taxation'),
                          ],
                        )),
                  ),
                ),
                Container(
                  child: Text(
                    'I want calls from candidates within',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 120,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        choiceChipWidget(callrange),
                      ],
                    )),
                Container(
                  child: Text(
                    'Is it a Work From Home Job?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 70,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        choiceChipWidget(workFromHome),
                      ],
                    )),
                Container(
                  child: Text(
                    'Describe the Job Role For The Staff',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 120,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText:
                            'Responsible for billing and Invoicing, Maintaining Balance Sheet,Accounts,Bank Statements.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF21BFBD), width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
                Container(
                  child: Text(
                    'Work Timings',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: '9:30am - 6:30pm | Monday to Saturday',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF21BFBD), width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                Container(
                  child: Text(
                    'Interview Would Be Done Between',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 80,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '11am - 4pm | Monday to Saturday',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF21BFBD), width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
              ]),
            ),
          )
        ],
      ),
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

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color(0xFF21BFBD),
    );
  }
}
class Gender extends StatelessWidget {
  int _value ;
  final Recruiter recDb;

  Gender({Key key, @required this.recDb}) : super(key: key);
  List<String> gender = ['Below 10th', '10th Pass', '12th Pass', 'Graduate'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        4,
            (int index) {
          return ChoiceChip(
            label: Text(
              gender[index],
              style: TextStyle(color: Colors.black),
            ),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              // setState(() {
              if (_value != index) _value = selected ? index : null;
              recDb.qualification = gender[_value];
              return gender[_value];
              //});
            },
          );
        },
      ).toList(),
    );
  }
}
class Experience extends StatelessWidget {
  int _value ;
  final Recruiter recDb;
  Experience({Key key, @required this.recDb}) : super(key: key);  List<String> experience = [
    'Fresher',
    '1-6 Months',
    '1-2 Years',
    '2-5 Years',
    '5+ Years'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: List<Widget>.generate(
        5,
            (int index) {
          return ChoiceChip(
            label: Text(
              experience[index],
              style: TextStyle(color: Colors.black),
            ),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              //setState(() {
              if (_value != index) _value = selected ? index : null;
              recDb.workExp=experience[_value];
              return experience[_value];
              //});
            },
          );
        },
      ).toList(),
    );
  }
}