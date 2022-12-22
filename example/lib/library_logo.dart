import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryLogo extends StatelessWidget {
  const LibraryLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Kaiteki",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: " Material"),
        ],
      ),
    );
  }
}
