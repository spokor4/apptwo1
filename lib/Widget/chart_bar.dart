import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
final String Etykieta;
final double WydatkiIlosc;
final double WydatkiProcent;


chartBar(
    this.Etykieta,
    this.WydatkiIlosc,
    this.WydatkiProcent,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(' ${WydatkiIlosc.toStringAsFixed(0)} zl')
            ),
        ),
      SizedBox(height: 4,),
      Container(
        height: 60,
        width: 10,
        child: Stack(children: <Widget> [
          Container(decoration: BoxDecoration(border:  Border.all(color:Colors.grey,width: 1.0),
          color:Color.fromRGBO(220, 220, 200, 1),
          borderRadius: BorderRadius.circular(10),
          ),
          ),
          FractionallySizedBox(heightFactor: WydatkiProcent, child: Container
          (decoration: BoxDecoration(color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          ),
          ),
          )
        ],
        ),
      ),
  SizedBox(height: 4,),

Text(Etykieta),
    ] ,
      
    );
  }
}