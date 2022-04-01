// ignore_for_file: deprecated_member_use




import 'package:apptwo/Widget/NowaTransakcja.dart';
import 'package:apptwo/model/trans.dart';
import 'package:flutter/material.dart';
import './model/trans.dart';
import './Widget/listaTransakcji.dart';
import './Widget/chart.dart';
import './Widget/NowaTransakcja.dart';




void main() => runApp(App());

class App extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wydatki',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                    button: TextStyle(color: Colors.white)
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  

                )),
          )
      ),
      home: MyHomePage(),
    );
  }
}



  // @override
  // State<App> createState() => _AppState();


 
  

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
final List <Lista>_nazwaTransakcji = [
  //   Lista(
  //     id: '0',
  //     nazwa: 'yerbba',
  //     koszt: 12,
  //     data: DateTime.now(),
  // ),
  //   Lista(
  //     id: '1',
  //     nazwa: 'Magda',
  //     koszt: 56.22,
  //     data: DateTime.utc(2022, 2, 26, 13, 31, 2, 1),
  // ),
  ];

  List<Lista> get _ostatnieTranzakcje {
    return _nazwaTransakcji.where((trax) {
      return trax.data.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

void _dodajTrans(String Xnazwa, double Xkoszt, DateTime taData) {
    final nowaTranF = Lista(
        nazwa: Xnazwa,
        data: taData,
        koszt: Xkoszt,
        id: DateTime.now().toString(),
        );

setState(() {
      _nazwaTransakcji.add(nowaTranF);
    });

}


void _ZacznijNowaTranzakcje (BuildContext xxx) {
  showModalBottomSheet(
  context: xxx ,
   builder:  (_) {
          return GestureDetector(
          onTap: () {},
          child: NowaTranzakcja(_dodajTrans),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
}

void _deleteTrans(String id) {
  setState(() {
     _nazwaTransakcji.removeWhere((ctx) => ctx.id == id);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wydatki'),
        // style: TextStyle(fontFamily:'Open Sans')) ,     
        actions: <Widget> [
          IconButton(onPressed: () => _ZacznijNowaTranzakcje(context), 
          icon: 
          Icon(Icons.payments_sharp, 
          color: Colors.greenAccent,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            chart(_ostatnieTranzakcje),
              
           LisTran(_nazwaTransakcji, _deleteTrans),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
       floatingActionButton: FloatingActionButton(child: Icon(Icons.keyboard_arrow_left),
       
       onPressed: () => _ZacznijNowaTranzakcje(context),),     
    );
  }
}
