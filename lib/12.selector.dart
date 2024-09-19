import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/observe/observe.dart';

void main() {
  runApp(ProviderScope(
      observers: [RiverpodObserver()],
      child: MaterialApp(
        home: Scaffold(body: Center(child: SelectExample())),
      )));
}

/// ## Usage 1
class Person extends StateNotifier<Map<String, dynamic>> {
  Person() : super({'name': 'John', 'age': 30});

  void updateName(String newName) {
    state = {...state, 'name': newName};
  }

  void updateAge(int age) {
    state = {...state, 'age': age};
  }
}

// Provider for Person
final personProvider =
    StateNotifierProvider<Person, Map<String, dynamic>>((ref) => Person());

class SelectExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use `select` to watch only the 'name' field
    final name = ref.watch(personProvider.select((state) => state['name']));
    print("rebuild");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: $name'),
        TextButton(
          onPressed: () {
            ref.read(personProvider.notifier).updateAge(12);
          },
          child: Text("Change Age"),
        ),
        TextButton(
          onPressed: () {
            ref.read(personProvider.notifier).updateName("Dara");
          },
          child: Text("Change Name"),
        )
      ],
    ); // Only rebuilds when `name` changes
  }
}
