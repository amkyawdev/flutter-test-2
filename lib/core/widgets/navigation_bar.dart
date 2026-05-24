import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          GestureDetector(
            onTap: () => context.go('/'),
            child: const Row(
              children: [
                Text(
                  'AMK',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '.dev',
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          
          // Nav Links
          Row(
            children: [
              _NavLink(label: 'Home', path: '/'),
              const SizedBox(width: 24),
              _NavLink(label: 'Dashboard', path: '/dashboard'),
              const SizedBox(width: 24),
              _NavLink(label: 'Projects', path: '/projects'),
              const SizedBox(width: 24),
              _NavLink(label: 'About', path: '/about'),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String path;

  const _NavLink({required this.label, required this.path});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();
    final isActive = currentPath == path;

    return GestureDetector(
      onTap: () => context.go(path),
      child: Text(
        label,
        style: TextStyle(
          color: isActive 
              ? const Color(0xFF2563EB) 
              : const Color(0xFF1F2937),
          fontSize: 16,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}