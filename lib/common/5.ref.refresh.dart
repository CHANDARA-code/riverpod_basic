import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



///`ref.refresh`
///The ref.refresh method forces a provider to recreate its state. 
///It's particularly useful for resetting a provider or re-fetching data.
///
void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: RefreshExample())),
  )));
}

final futureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 42;
});

class RefreshExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(title: Text('ref.refresh Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asyncValue.when(
              data: (data) => Text('Data: $data'),
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            ElevatedButton(
              onPressed: () => ref.refresh(futureProvider),
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
