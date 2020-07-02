import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/app_screens/home.dart';

class InterestedIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InterestedInState();
  }
}

class InterestedInState extends State<InterestedIn> {
  List<String> interestedIn = [
    'Accounts',
    'Acting',
    'Aerospace Engineering',
    'Agriculture & Food Engineering',
    'Android App Development',
    'Animation',
    'Architecture',
    'Back End Developer',
    'Biology',
    'Biotechnology Engineering',
    'Campus Ambassador',
    'Chartered Accountancy (CA)',
    'Chemical Engineering',
    'Chemistry',
    'Cinematography',
    'Civil Engineering',
    'Company Secretary (CS)',
    'Computer Vision',
    'Content Writing',
    'Data Entry',
    'Data Science',
    'Digital Marketing',
    'Electrical Engineering',
    'Electronics Engineering',
    'Energy Science & Engineering',
    'Engineering Design',
    'Engineering Physics',
    'Event Management',
    'Fashion Design',
    'Film Making',
    'Finance',
    'Front End Developer',
    'Full Stack Developer',
    'Game Development',
    'General Management',
    'Graphic Design',
    'Hotel Management',
    'Human Resources (HR)',
    'Humanities',
    'Image Processing',
    'Interior Design',
    'Journalism',
    'Law',
    'Market/Business Research',
    'Marketing',
    'Material Science',
    'Mathematics',
    'Mechanical Engineering',
    'Medicine',
    'Merchandise Design',
    'Metallurgical Engineering',
    'Mobile App Development',
    'Motion Graphics',
    'Naval Architecture and Ocean Engineering',
    'Network Engineering',
    'Operations',
    'Petroleum Engineering',
    'Pharmaceutical',
    'Photography',
    'Physics',
    'Programming',
    'Psychology',
    'Public Relation (PR)',
    'Sales',
    'Social Media Marketing',
    'Software Development',
    'Software Testing',
    'Statistics',
    'Teaching',
    'Travel & Tourism',
    'UI/UX Design',
    'Video Making/Editing',
    'Videography',
    'Volunteering',
    'Web Development',
  ];
  List<String> interestedInDisplay = [
    'Accounts',
    'Acting',
    'Aerospace Engineering',
    'Agriculture & Food Engineering',
    'Android App Development',
    'Animation',
    'Architecture',
    'Back End Developer',
    'Biology',
    'Biotechnology Engineering',
    'Campus Ambassador',
    'Chartered Accountancy (CA)',
    'Chemical Engineering',
    'Chemistry',
    'Cinematography',
    'Civil Engineering',
    'Company Secretary (CS)',
    'Computer Vision',
    'Content Writing',
    'Data Entry',
    'Data Science',
    'Digital Marketing',
    'Electrical Engineering',
    'Electronics Engineering',
    'Energy Science & Engineering',
    'Engineering Design',
    'Engineering Physics',
    'Event Management',
    'Fashion Design',
    'Film Making',
    'Finance',
    'Front End Developer',
    'Full Stack Developer',
    'Game Development',
    'General Management',
    'Graphic Design',
    'Hotel Management',
    'Human Resources (HR)',
    'Humanities',
    'Image Processing',
    'Interior Design',
    'Journalism',
    'Law',
    'Market/Business Research',
    'Marketing',
    'Material Science',
    'Mathematics',
    'Mechanical Engineering',
    'Medicine',
    'Merchandise Design',
    'Metallurgical Engineering',
    'Mobile App Development',
    'Motion Graphics',
    'Naval Architecture and Ocean Engineering',
    'Network Engineering',
    'Operations',
    'Petroleum Engineering',
    'Pharmaceutical',
    'Photography',
    'Physics',
    'Programming',
    'Psychology',
    'Public Relation (PR)',
    'Sales',
    'Social Media Marketing',
    'Software Development',
    'Software Testing',
    'Statistics',
    'Teaching',
    'Travel & Tourism',
    'UI/UX Design',
    'Video Making/Editing',
    'Videography',
    'Volunteering',
    'Web Development',
  ];

  List<String> checkedWords = [];
  var experience;
  var word;
  var skill;
  List<String> skillList = [];
  final name = TextEditingController();

  Widget interests(String wordPair) {
    final isChecked = checkedWords.contains(wordPair);
    return Card(
      child: ListTile(
          leading: new Icon(
              isChecked ? Icons.check_box : Icons.check_box_outline_blank),
          onTap: () {
            setState(() {
              if (isChecked) {
                checkedWords.remove(wordPair);
              } else {
                details(wordPair);
                checkedWords.add(wordPair);
              }
            });
          },
          title: Text(
            wordPair.toString(),
            style: TextStyle(fontSize: 18.0),
          )),
    );
  }

  Future<List> details(String wordPair) {
    return showDialog(
        context: context,
        child: Container(
          child: AlertDialog(
            content: Text(
              "Years of experience in " + wordPair + " ?",
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: experience = Experience(),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("I am Interested In"),
          backgroundColor: Color(0xFF21BFBD),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.navigate_next),
              onPressed: () {
                setState(() {
                  if (checkedWords.isNotEmpty)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                });
              },
            )
          ],
        ),
        body: new ListView.builder(
            itemCount: interestedInDisplay.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? searchbar()
                  : interests(interestedInDisplay[index - 1]);
            }));
  }

  searchbar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...', prefixIcon: Icon(Icons.search)),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            interestedInDisplay = interestedIn.where((element) {
              var some = element.toLowerCase();
              return some.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}

class Experience extends StatefulWidget {
  @override
  ExperienceState createState() => new ExperienceState();
}

class ExperienceState extends State<Experience> {
  int _value = 0;

  List<String> experience = [
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
            label: Text(experience[index],style: TextStyle(color:Colors.black ),),
            selected: _value == index,
            selectedColor: Color(0xFF21BFBD),
            onSelected: (bool selected) {
              setState(() {
                if (_value != index) _value = selected ? index : null;
                return experience[_value];
              });
            },
          );
        },
      ).toList(),
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
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(fontSize: 18.0),
      selected: isSelected,
      onSelected: (_isSelected) {
        setState(() {
          isSelected = _isSelected;
        });
      },
      selectedColor: Colors.blueAccent,
    );
  }
}
