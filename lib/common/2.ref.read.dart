import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ReadExample())),
  )));
}

/// `ref.read`
//The ref.read method is used to read the current state of a provider without listening for updates. 
//It’s useful for event handlers like button presses.


final counterProvider = StateProvider<int>((ref) => 0);

class ReadExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('ref.read Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
