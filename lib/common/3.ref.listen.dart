import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


///`ref.listen`
//The ref.listen method allows you to listen for changes to a provider's 
//state and perform side effects when the state changes. 
//It's useful for things like showing a dialog or navigating to a new screen based on the state change.
void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: ListenExample())),
  )));
}

final counterProvider = StateProvider<int>((ref) => 0);

class ListenExample extends ConsumerStatefulWidget {
  @override
  ConsumerState<ListenExample> createState() => _ListenExampleState();
}

class _ListenExampleState extends ConsumerState<ListenExample> {
  @override
  void initState() {
    super.initState();

    // Listen for changes in the counterProvider
    ref.listen<int>(counterProvider, (previous, next) {
      if (next > 5) {
        // Show a dialog when the counter exceeds 5
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Counter Exceeded 5!'),
            content: Text('The counter is now $next'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('ref.listen Example')),
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
