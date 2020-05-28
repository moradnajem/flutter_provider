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
      child: Container(
        color: Colors.deepOrange,
        child: SafeArea(
          child: Scaffold(
            body: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){setState(() {});},
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("Refresh",style: TextStyle(fontSize: 35,color: Colors.blue)),
                                  Text("setState",style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              Icon(Icons.refresh,size: 50,),
                            ],
                          ),
                          Text("Text -- ${x++}",style: TextStyle(fontSize: 50),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(color: Colors.red,height: 1.2,child: Divider()),
                btn(),  // StatelessWidget
                txt1(), // StatelessWidget
                txt2(), // StatelessWidget / Selector
                txt3(), // Widget
                txt4(),
                btn2(),// Widget
                Container(color: Colors.red,height: 1.2,child: Divider()),
                txt5(),
                d_d(),// Widget
              ],
            ),
          ),
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
    return Text("Dropdown -- ${value.getstring}",style: TextStyle(fontSize: 35,color: Colors.orange),);
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
          value: value.getstring,
          hint: Text("Select",style: TextStyle(fontSize: 25),),
          isExpanded: true,
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