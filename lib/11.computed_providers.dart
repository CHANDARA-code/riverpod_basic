import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ComputedProviderExample())),
  )));
}

final firstProvider = Provider<int>((ref) => 11);
final secondProvider = Provider<int>((ref) => 20);

final sumProvider = Provider<int>((ref) {
  final first = ref.watch(firstProvider);
  final second = ref.watch(secondProvider);
  return first + second;
});

class ComputedProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = ref.watch(sumProvider);
    return Text('Sum: $sum');
  }
}
