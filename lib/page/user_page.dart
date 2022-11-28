import 'package:examen2/models/user.dart';
import 'package:flutter/material.dart';


class UserDetailPage extends StatelessWidget {
  User user;
   UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    width: 200,
                    image: NetworkImage(user.avatar!)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user.firstName!),
                  Text(user.lastName!),
                  Text(user.email!),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
