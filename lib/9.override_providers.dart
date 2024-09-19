import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/observe/observe.dart';

void main() {
  runApp(ProviderScope(
      observers: [RiverpodObserver()],
      child: MaterialApp(
        home: Scaffold(body: Center(child: OverrideProviderExample())),
      )));
}

final overrideProvider = Provider<String>((ref) => 'Default Value');

class OverrideProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        overrideProvider.overrideWithValue('Overridden Value'),
      ],
      child: Consumer(
        builder: (context, ref, _) {
          final value = ref.watch(overrideProvider);
          return Text('Value: $value');
        },
      ),
    );
  }
}
