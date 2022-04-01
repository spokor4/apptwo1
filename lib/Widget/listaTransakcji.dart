import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/trans.dart';


class LisTran extends StatelessWidget {
final List<Lista> transkacje;
final Function delteCtx;

LisTran(this.transkacje, this.delteCtx);

  
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 400,
      child: transkacje.isEmpty
          ? Column(
          children: <Widget> [Text('Ni ma tranzakcji',style:Theme.of(context).textTheme.headline6 ,
          ),
                SizedBox(
                  height: 10,
                ),
         Container(
           height: 200,
           child: Image.asset('asset/images/waiting.png',fit:BoxFit.contain,   ))],

        ): ListView.builder(
          itemBuilder: (kontekst, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30, child: FittedBox(
                        child: Text('${transkacje[index].koszt}zł'),
                        ),
                    ),
                    title: Text(transkacje[index].nazwa, style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transkacje[index].data)
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    onPressed: () => delteCtx(transkacje[index].id),),
                    
                  ),
                );
        },

          
          itemCount: transkacje.length,
       
      ),
    );
  }
}
