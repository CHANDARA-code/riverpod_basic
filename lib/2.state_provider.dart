import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: StateProviderExample())),
  )));
}

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("State Provider"),
        Text('$counter'),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
