import 'package:flutter_riverpod/flutter_riverpod.dart';


// ref is an object of type **ProviderRef**, and it's automatically provided by Riverpod when you define a provider.
// Riverpod injects it into the function so that you can use it to:
// -Read or watch other providers
// -Manage state
// -Access context-aware logic (like lifecycle, disposal, etc.)
final mealsProvider = Provider((ref){});