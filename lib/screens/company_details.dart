import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/RecruiterHome.dart';
import 'package:foodwango_job/services/auth.dart';

class companydetails extends StatefulWidget {
  final Recruiter recDb;
  companydetails({Key key, @required this.recDb}) : super(key: key);
  @override
  _companydetailsstate createState() => _companydetailsstate(recDb: recDb);
}

class _companydetailsstate extends State<companydetails> {
  final Recruiter recDb;
  _companydetailsstate({Key key, @required this.recDb}) : super();
  final Authservice _auth = Authservice();
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
                    Text("3/3",
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
                Text('Company',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Details',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
              height: 700,
              //height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(children: <Widget>[
                    Container(
                      child: Text(
                        'Name Of My Company',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'XYZ',
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
                        'Contact Person/Recruiter Name',
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
                            hintText: 'Ram',
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
                        'Email Id',
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
                            hintText: 'xyz@xx.xx',
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
                        'Phone Number',
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '98xxxxxxxx',
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
                        'My Company Address',
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
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: '',
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
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RecruiterHome(recDb:recDb);
                            }));
                          },
                          child: Text('Submit'),
                          color: Color(0xFF21BFBD),
                        )),
                  ])))
        ],
      ),
    );
  }
}
