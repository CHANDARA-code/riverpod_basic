import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/observe/observe.dart';

void main() {
  runApp(ProviderScope(
      observers: [RiverpodObserver()],
      child: MaterialApp(
        home: Scaffold(body: Center(child: AutoDisposeExample())),
      )));
}

final autoDisposeProvider = Provider.autoDispose<int>((ref) {
  return 42;
});

class AutoDisposeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScreenA()));
          },
          child: Text("To Go Next Screen"),
        )
      ],
    );
  }
}

class ScreenA extends ConsumerWidget {
  const ScreenA({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(autoDisposeProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hi"),
          Text('Value: $value'),
          TextButton(onPressed: () {}, child: Text("Pressed me"))
        ],
      ),
    );
  }
}
