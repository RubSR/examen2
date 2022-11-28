import 'dart:convert';
import 'dart:ui';

import 'package:examen2/models/user.dart';
import 'package:http/http.dart';

class UserProvider{

 Future<List<User>> getUsers() async {
   
   Response res =  await get(Uri.parse('https://reqres.in/api/users'));

   if( res.statusCode == 200){
     List<dynamic> lista = json.decode(res.body)['data'];
     List<User> users = lista.map((e) => User.fromJson(e)).toList();
     return users;
   }else{
     throw Exception('Fallo');
   }
 }
}