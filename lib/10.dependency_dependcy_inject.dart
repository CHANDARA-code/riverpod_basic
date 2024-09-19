import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: DependencyInjectionExample())),
  )));
}

final repositoryProvider = StateProvider<String>((ref) => 'Repository Data');

final serviceProvider = Provider<String>((ref) {
  final repository = ref.watch(repositoryProvider);
  return 'Service using $repository';
});

class DependencyInjectionExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(serviceProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(service),
        TextButton(
          onPressed: () {
            ref.read(repositoryProvider.notifier).state = "haha";
          },
          child: Text("change repository"),
        ),
      ],
    );
  }
}
