import 'package:flutter/material.dart';

/// Loads route-only code on demand and keeps the future stable across rebuilds.
class DeferredPage extends StatefulWidget {
  const DeferredPage({
    super.key,
    required this.loadLibrary,
    required this.builder,
  });

  final Future<void> Function() loadLibrary;
  final WidgetBuilder builder;

  @override
  State<DeferredPage> createState() => _DeferredPageState();
}

class _DeferredPageState extends State<DeferredPage> {
  late Future<void> _loading = widget.loadLibrary();

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
    future: _loading,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                final loading = widget.loadLibrary();
                setState(() {
                  _loading = loading;
                });
              },
              child: const Text('Unable to load page. Retry'),
            ),
          ),
        );
      }
      if (snapshot.connectionState != ConnectionState.done) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      return widget.builder(context);
    },
  );
}
