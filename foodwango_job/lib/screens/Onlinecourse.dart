import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onlinecourse extends StatefulWidget {
  @override
  _OnlinecourseState createState() => _OnlinecourseState();
}

class _OnlinecourseState extends State<Onlinecourse> {
  Container MyArticles(String imageVal, String heading){
return  Container(
            width:160.0,
            child:Card(
              child:Wrap(
                children: <Widget>[
                 Image.asset(imageVal),
                 ListTile(
                   title: Text(heading),
                   
                 )
              ],) ,)
          );
  }
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Courses'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(height:10.0),
          Container(
           child:Text('Microsoft Office',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),
          Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
            
             MyArticles('assets/images/excel.png', 'Basic Excel'),
             MyArticles('assets/images/excel.png', 'Intermediate Excel'),
             MyArticles('assets/images/excel.png', 'Advanced Excel'),
             MyArticles('assets/images/word.png', 'Basic MS Word'),
             MyArticles('assets/images/word.png', 'Intermediate MS Word'),
             MyArticles('assets/images/word.png', 'Advanced MS Word'),
             MyArticles('assets/images/pp.png', 'Basic MS Powerpoint'),
             MyArticles('assets/images/pp.png', 'Intermediate MS Powerpoint'),
             MyArticles('assets/images/pp.png', 'Advanced MS Powerpoint'),
            ],
            ),

          ),
          SizedBox(height:10.0),
          Container(
           child:Text('English Language',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),

          Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/eng.jpg', 'Basic English'),
             MyArticles('assets/images/eng.jpg', 'Intermediate English'),
             MyArticles('assets/images/eng.jpg', 'Advanced English'),
             
            ],
            ),

          ),
          SizedBox(height:10.0),
          Container(
           child:Text('Computer Knowledge',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),

          Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/comp.png', 'Basic Computer Skills'),
             MyArticles('assets/images/comp.png', 'Intermediate Computer Skills'),
             MyArticles('assets/images/comp.png', 'Advanced Computer Skills'),
             
            ],
            ),

          ),
          SizedBox(height:10.0),
          Container(
           child:Text('Commerce',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),

           Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/commerce.jpg', 'Commerce Problem Solving'),
             MyArticles('assets/images/commerce.jpg', 'Commerce Concepts'),
            
             
            ],
            ),

          ),
          SizedBox(height:10.0),
          Container(
           child:Text('Sales & Marketing',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),
           Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/marketing.jpg', 'Marketing Fundamentals & Digital Marketing'),
             MyArticles('assets/images/sm.jpg', 'Basics Sales and Marketing'),
            
             
            ],
            ),

          ),
          SizedBox(height:10.0),
          Container(
           child:Text('Personality Development',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),
          Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/personalityTypes.jpg', 'Personality Types'),
             MyArticles('assets/images/positive.jpg', 'Positive Professional Image'),
            
             
            ],
            ),

          ),

          SizedBox(height:10.0),
          Container(
           child:Text('Digital Marketing',style: TextStyle(
               fontSize: 20,
               fontWeight:FontWeight.bold,
           ),
          ),
          ),
          Container(
            margin:EdgeInsets.symmetric(vertical:20.0),
            height:250,
            child:ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
             MyArticles('assets/images/dm.jpg', 'Basic Digital Marketing'),
            MyArticles('assets/images/dm.jpg', 'Intermediate Digital Marketing'),
            MyArticles('assets/images/dm.jpg', 'Advanced Digital Marketing'),
            
             
            ],
            ),

          ),
        ],
        
      ),
     
    );
  }
}


