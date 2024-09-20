import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ReadExample())),
  )));
}

/// `ref.invalidate`
/// ref.invalidate is used to invalidate a provider, which means its cached value is discarded and it will recompute its state the next time it's accessed.
/// Unlike ref.refresh, it doesn’t force an immediate recomputation but waits until the next access.

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
                ref.invalidate(counterProvider);
              },
              child: Text('invaldate'),
            ),
          ],
        ),
      ),
    );
  }
}
