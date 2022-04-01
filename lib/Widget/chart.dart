
import 'package:flutter/material.dart';
import '../model/trans.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  final List<Lista> OstatnieTranzakcje;

  chart(this.OstatnieTranzakcje);

   List<Map<String, Object>> get pogrupowaneTranzakcje  {
     return List.generate(7, (index) {
      final dzienTygodnia = DateTime.now().subtract(
        Duration( days: index), );
          var totSuma = 0.0;

    for (var i = 0; i< OstatnieTranzakcje.length; i++) {
      if (OstatnieTranzakcje[i].data.day == dzienTygodnia.day && 
          OstatnieTranzakcje[i].data.month == dzienTygodnia.month &&
          OstatnieTranzakcje[i].data.year == dzienTygodnia.year){
            totSuma += OstatnieTranzakcje[i].koszt;
          }
    }

      

      return {
      'Dzień': DateFormat.E().format(dzienTygodnia), 
      'ile': totSuma
      };
    }
   
    ).reversed.toList();

   }

double get maxSpending {
  return pogrupowaneTranzakcje.fold(0.0,  (suma, item) {
    return suma + item['ile']; 


  });
}


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: pogrupowaneTranzakcje.map((Data) {
            return Flexible(
              fit: FlexFit.tight,
              child: chartBar(
                Data['Dzień'],
                Data['ile'],
                (maxSpending == 0.0 
                    ? 0.0
                    : (Data["ile"] as double) / maxSpending),
                //totalSpending == 0 ? 0 : (data["amount"] as double) / totalSpending
              ),
            );
          }).toList(),
          ),
      ),
    );
  }
}
