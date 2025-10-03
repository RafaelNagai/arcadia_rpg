import 'package:flutter/material.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Verifica se é tela "larga" (web/tablet) ou "estreita" (mobile)
          bool isWide = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWide ? 400 : double.infinity, // Card no web
                ),
                child: Card(
                  elevation: isWide ? 8 : 0, // Só usa Card no web
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: child,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
