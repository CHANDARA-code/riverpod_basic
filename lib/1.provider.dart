import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ProviderExample())),
  )));
}

final helloProvider = Provider<String>((ref) => 'Hello, Riverpod!');

class ProviderExample extends ConsumerWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloProvider);
    return Text(hello);
  }
}
