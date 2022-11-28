import 'package:examen2/models/user.dart';
import 'package:examen2/page/user_page.dart';
import 'package:examen2/provider/user_provider.dart';
import 'package:flutter/material.dart';


class UsersPage extends StatelessWidget {
 UsersPage({Key? key}) : super(key: key);

   UserProvider provider = UserProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body:FutureBuilder(
        future: provider.getUsers(),
          builder: (context, snapshot){
          if(snapshot.hasError){
            return const Center(child: Text('Ha ocurrido un error'),);
          } else if (snapshot.hasData){
            List<User> users = snapshot.data!;
            return ListView.builder(

                itemCount: users.length,
                itemBuilder: (context, int i){
                   return ListTile(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailPage(user: users[i])));
                     },
                     title: Text(users[i].firstName!),
                     subtitle: Text(users[i].lastName!),
                   );
                }
            );
          }
          return const Center(child: LinearProgressIndicator(),);
          })
      ,
    );
  }
}
