import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/home.dart';

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

  String val = "false";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("I am Interested In"),
          backgroundColor: Color(0xFF21BFBD),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.check_circle_outline,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  if (checkedWords.isNotEmpty) Navigator.pop(context, "true");
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
      children: <Widget>[
        choiceChipWidget(experience),
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
              Navigator.of(context).pop();
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
