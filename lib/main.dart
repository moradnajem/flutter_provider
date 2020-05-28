import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myprovider.dart';



void main() {
  runApp(new MaterialApp(
    home: new homepage(),
    debugShowCheckedModeBanner: false,
  ));
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var x = 0;
  var y = "";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> number(),
        child: Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Text -- ${x++}",style: TextStyle(fontSize: 50),),
            btn(),  // StatelessWidget
            txt1(), // StatelessWidget
            txt2(), // StatelessWidget / Selector
            txt3(), // Widget
            txt4(), // Widget
            txt5(),
            btn2(),
            d_d(),// Widget
          ],
        ),
      ),
    );
  }
}






class btn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<number>(context);
    return Center(
        child: IconButton(
          icon: Icon(Icons.add_box,size: 35,),
          onPressed: ()=> value.getnumber = value.getnumber + 1,
        ));
  }
}







class txt1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<number>(context);
    return Center(
        child: Text("Stateless -- ${value.getnumber}",style: TextStyle(fontSize: 35),));
  }
}


class txt2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<number,int>(
        selector: (context,_number)=> _number.getnumber,
        builder: (context,any,widget){
          return Center(
              child: Text("Selector --less $any",style: TextStyle(fontSize: 35,color: Colors.red),));
        },

    );
  }
}


Widget txt3(){
  return Builder(builder: (BuildContext context){
    final value = Provider.of<number>(context);
    return Center(
        child: Text("Widget -- ${value.getnumber}",style: TextStyle(fontSize: 35,color: Colors.blue),));
  });
}


Widget txt4(){
  return Builder(builder: (BuildContext context){
    return Selector<number,int>(
      selector: (context,_number)=> _number.getnumber,
      builder: (context,any,widget){
        return Center(
            child: Text("Selector --W-- $any",style: TextStyle(fontSize: 35,color: Colors.green),));
      },

    );
  });
}





Widget txt5(){
  return Builder(builder: (BuildContext context){
    final value = Provider.of<number>(context);
    return Text("Selector --W-- ${value.getstring}",style: TextStyle(fontSize: 35,color: Colors.orange),);
  });
}




Widget btn2(){
  return Builder(builder: (BuildContext context){
    final value = Provider.of<number>(context);
    return Center(
        child: IconButton(
          icon: Icon(Icons.indeterminate_check_box,size: 35,),
          onPressed: ()=> value.getnumber = value.getnumber - 1,
        ));
  });
}




Widget d_d(){
  return Builder(builder: (BuildContext context){
    final value = Provider.of<number>(context);
    var dropdownValue ;
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 42,
          underline: SizedBox(),
          onChanged: (_) {
            value.getstring = _;
          },
          items: <String>[
            'One',
            'Two',
            'Three',
            'Four'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  });
}







