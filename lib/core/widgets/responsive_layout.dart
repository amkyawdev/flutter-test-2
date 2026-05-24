import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final bool showNavbar;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.showNavbar = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
        
        return Scaffold(
          body: Column(
            children: [
              if (showNavbar) const NavigationBar(),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}