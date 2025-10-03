import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                Text('HOME PAGE'),
                ElevatedButton(
                  onPressed: () {
                    context.push(RouteName.character.path());
                  },
                  child: Text('Character'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(RouteName.signin.path());
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
