import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'A página não existe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Gap(16.0),
              FilledButton(
                  onPressed: () => context.pop(), child: const Text('Voltar'))
            ],
          ),
        ));
  }
}
