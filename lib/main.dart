import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
