import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: StreamProviderExample())),
  )));
}

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 1), (count) => count).take(5);
});

class StreamProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(streamProvider);
    print("object ${asyncValue.asData}");
    return asyncValue.when(
      data: (data) => Text('Stream: $data'),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
