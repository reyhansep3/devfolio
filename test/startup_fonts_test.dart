import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'startup fonts load from bundled assets with network fetching disabled',
    () async {
      final allowFetching = GoogleFonts.config.allowRuntimeFetching;
      GoogleFonts.config.allowRuntimeFetching = false;
      addTearDown(
        () => GoogleFonts.config.allowRuntimeFetching = allowFetching,
      );

      await GoogleFonts.pendingFonts([
        for (final weight in [
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
        ])
          GoogleFonts.poppins(fontWeight: weight),
      ]);
    },
  );
}
