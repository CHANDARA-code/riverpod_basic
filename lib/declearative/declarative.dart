import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/observe/observe.dart';
part 'declarative.g.dart';

void main() {
  runApp(ProviderScope(
      observers: [RiverpodObserver()],
      child: MaterialApp(
        home: Scaffold(body: Center(child: SimpleStateWidget())),
      )));
}

@riverpod
class SimpleStateNotifier extends _$SimpleStateNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

class SimpleStateWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleState = ref.watch(simpleStateNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Simple State: $simpleState"),
        ElevatedButton(
          onPressed: () {
            ref.read(simpleStateNotifierProvider.notifier).increment();
          },
          child: Text("Increment Simple"),
        ),
      ],
    );
  }
}
