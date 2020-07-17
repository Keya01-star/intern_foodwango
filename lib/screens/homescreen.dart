import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/job_description.dart';
import 'package:foodwango_job/services/auth.dart';

class homescreen extends StatefulWidget {
  final Recruiter recDb;
  homescreen({Key key, @required this.recDb}) : super(key: key);
  @override
  _homescreenstate createState() => _homescreenstate(recDb: recDb);
}

class _homescreenstate extends State<homescreen> {
  final Recruiter recDb;
  _homescreenstate({Key key, @required this.recDb}) : super();
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
                    Text("1/3",
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
                Text('Details',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
                SizedBox(width: 130.0),
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
                          return jobdescription(recDb:recDb);
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
              height: 600,
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
                        'I Want To Hire A',
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
                            hintText: 'Telecaller',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF21BFBD), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (role){recDb.role=role;},
                        )),
                    Container(
                      child: Text(
                        'In The City',
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
                            hintText: 'Enter your city',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF21BFBD), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (city){recDb.city=city;},
                        )),
                    Container(
                      child: Text(
                        'For The locality',
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
                            hintText: 'Enter your locality',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF21BFBD), width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (locality){recDb.locality=locality;},
                        )),
                    Container(
                      child: Text(
                        'I Will Pay A Monthly Salary Of',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              height: 80,
                              width: 80,
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '10,000',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF21BFBD), width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (minSal){recDb.minSal=minSal;},
                              )),
                          Container(
                            child: Text(
                              'to',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                              height: 80,
                              width: 80,
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: '10,000',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF21BFBD), width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (maxSal){recDb.maxSal=maxSal;},
                              )),
                        ],
                      ),
                    ]),
                    Container(
                      child: Text(
                        'No Of Staff I Need is',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        height: 80,
//width: 80,
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: '2',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF21BFBD), width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onChanged: (staff){recDb.staff=staff;},

                        )),
                  ])))
        ],
      ),
    );
  }
}
