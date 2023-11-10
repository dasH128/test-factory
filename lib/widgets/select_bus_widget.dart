import 'package:flutter/material.dart';

class SelectPlacaBusView extends StatelessWidget {
  const SelectPlacaBusView({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Seleccione bus'),
      children: [
        ...List.generate(
            80,
            (index) => SimpleDialogOption(
                  onPressed: () =>
                      Navigator.of(context).pop('${index + 21001}'),
                  child: Text('${index + 21001}'),
                )).toList()
      ],
    );
  }
}
