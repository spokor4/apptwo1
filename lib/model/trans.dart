import 'package:flutter/foundation.dart';

class Lista {
  final String id;
  final String nazwa;
  final double koszt;
  final DateTime data;

  Lista(
      {@required this.id,
      @required this.nazwa,
      @required this.data,
      @required this.koszt});

}