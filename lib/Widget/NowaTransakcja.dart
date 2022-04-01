// ignore_for_file: deprecated_member_use



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NowaTranzakcja extends StatefulWidget {
final Function DodajText;

NowaTranzakcja(this.DodajText);

@override
_NowaTranzakcjaState createState() => _NowaTranzakcjaState();
}

class  _NowaTranzakcjaState extends State<NowaTranzakcja> {

final _kontrolerTytulu = TextEditingController();
final _kontrolerSumy = TextEditingController();
DateTime  _wybranaData;


void _DaneDoPrzeslania () {
  if(_kontrolerTytulu.text.isEmpty){
    return;
  }
final MustNazwa = _kontrolerTytulu.text;
final MustKwota = double.parse(_kontrolerSumy.text);

if(MustNazwa.isEmpty || MustKwota <= 0 || _wybranaData == null){
  return;
}


   widget.DodajText(
     MustNazwa,
     MustKwota,
     _wybranaData,
                  );

Navigator.of(context).pop(); // wyłącza napis
}


void _PokazDateDodaia(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now()
        ).then( (wpisanaData) {
          if (wpisanaData == null){
            return;
          }
          setState(() {
            _wybranaData =wpisanaData; // mowi flutterowi ze zaktułazliowny widget musi użcy runna
          });
          _wybranaData = wpisanaData;
    });
    print('...');
}

  @override
  Widget  build(BuildContext context) {
    return Card(
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(10),
                        
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>
              [
              TextField(
                cursorColor: Color.fromARGB(255, 60, 212, 0),
                decoration: InputDecoration(labelText: 'Tytuł'),
                // onChanged: (war) {
                // PokaTytul=war;
                // } ,
                controller: _kontrolerTytulu,

                onSubmitted: (_) => _DaneDoPrzeslania(), // (_) nie intere mnie RGUMENT
              ),
              TextField(
  
                decoration: InputDecoration(labelText: 'Suma'),
                // onChanged: (war) => PokaTytul = war,
                controller: _kontrolerSumy,
                onSubmitted: (_) => _DaneDoPrzeslania(),
              ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_wybranaData == null ?  'Nie ma daty' : 'Wybrana Data: ${DateFormat.yMd().format(_wybranaData)}',
                    ),
                  ),
                  FlatButton(
                    onPressed: _PokazDateDodaia,
                    child: Text(
                      'wybierz date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  
                  ),
                ],
              ),
              ),
              RaisedButton(
                onPressed: _DaneDoPrzeslania,
                child: Text('Dodaj opłate'),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                  
              ),
            ],),
      ),
    );
  }
}