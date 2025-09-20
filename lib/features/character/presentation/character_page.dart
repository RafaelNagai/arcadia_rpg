import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                Text('CHARACTER PAGE'),
                ElevatedButton(
                  onPressed: () {
                    context.go(RouteName.signin.path());
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
