import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ChangeNotifierProviderExample())),
  )));
}

class CounterNotifier extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

final counterNotifierProvider =
    ChangeNotifierProvider((_) => CounterNotifier());

class ChangeNotifierProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: ${counter.count}'),
        ElevatedButton(
          onPressed: () => counter.increment(),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
