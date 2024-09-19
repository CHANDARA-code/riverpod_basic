import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: StateNotifierProviderExample())),
  )));
}

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() => state++;
}

final stateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>((ref) {
  return CounterStateNotifier();
});

class StateNotifierProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(stateNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: $counter'),
        ElevatedButton(
          onPressed: () => ref.read(stateNotifierProvider.notifier).increment(),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
