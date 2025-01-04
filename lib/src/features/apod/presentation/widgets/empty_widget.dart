import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/empty.png', height: 256,),
        const Gap(16.0),
        const Text('Nenhum item encontrado'),
      ],
    );
  }
}