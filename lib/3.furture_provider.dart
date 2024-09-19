import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: FutureProviderExample())),
  )));
}

final futureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 42;
});

class FutureProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProvider);
    return asyncValue.when(
      data: (data) => Text('Data: $data'),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
