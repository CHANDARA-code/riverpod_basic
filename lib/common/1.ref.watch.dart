import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: WatchExample())),
  )));
}

///`ref.watch`
///The ref.watch method is the most commonly used, as it listens to the provider
/// and rebuilds the widget when the provider's state changes.

final counterProvider = StateProvider<int>((ref) => 0);

class WatchExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('ref.watch Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
