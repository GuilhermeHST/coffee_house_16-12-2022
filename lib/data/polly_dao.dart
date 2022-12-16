import 'dart:convert';

import 'package:coffeehouse/data/bd_helper.dart';
import 'package:coffeehouse/domain/polly.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

  final baseUrl = '10.0.2.2:3000';

class PollyDao{
  Future<List<Polly>> listarCafes() async{
        var url = Uri.http(baseUrl, 'coffee/list');
    var response = await http.get(url);

    var result = jsonDecode(response.body);
    
    List<Polly> lista = <Polly>[];
    for(var json in result){
      Polly cafe = fromApiJson(json);
      lista.add(cafe);
    }
    
    return lista;
  }

  Polly fromApiJson(Map<String, dynamic> json) {
    final id = json['_id'];
    final foto = json['foto'];
    final nome = json['nome'];
    final aux = json['aux'];
    final volume = json['volume'];
    final preco = json['preco'];
    final ingredientes = json['ingredientes'];
    final coffee = new Polly(aux: aux, foto: foto, ingredientes: ingredientes, id: id, nome: nome, preco: preco, volume: volume );
    return coffee;
  }
}
