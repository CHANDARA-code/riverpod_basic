import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Scaffold(body: Center(child: FamilyProviderExample())),
  )));
}

//Passing parameters to providers.
final familyProvider = Provider.family<String, int>((ref, id) {
  return 'User ID: $id';
});

class FamilyProviderExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(familyProvider(123));
    return Text(userId);
  }
}
