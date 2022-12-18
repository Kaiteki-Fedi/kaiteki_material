import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: DeviceFrame.phone(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Lorem ipsum",
                  style: GoogleFonts.flowCircular(),
                ),
              ),
              bottomNavigationBar: NavigationBar(
                destinations: [
                  NavigationDestination(
                    icon:
                        const Icon(Icons.mail_outline).wrapWithLargeBadge(1000),
                    selectedIcon:
                        const Icon(Icons.mail).wrapWithLargeBadge(1000),
                    label: "Mail",
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.chat_bubble_outline)
                        .wrapWithLargeBadge(10),
                    selectedIcon:
                        const Icon(Icons.chat_bubble).wrapWithLargeBadge(10),
                    label: "Chat",
                  ),
                  NavigationDestination(
                    icon:
                        const Icon(Icons.groups_outlined).wrapWithSmallBadge(),
                    selectedIcon: const Icon(Icons.groups).wrapWithSmallBadge(),
                    label: "Rooms",
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.videocam_outlined)
                        .wrapWithLargeBadge(3),
                    selectedIcon:
                        const Icon(Icons.videocam).wrapWithLargeBadge(3),
                    label: "Meet",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
