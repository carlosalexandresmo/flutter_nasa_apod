import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class FailWidget extends StatelessWidget {
  const FailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/error.png', height: 256,),
        const Gap(16.0),
        const Text('Nenhum item encontrado'),
      ],
    );
  }
}