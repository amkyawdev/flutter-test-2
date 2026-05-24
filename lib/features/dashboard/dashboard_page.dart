import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  late List<AnimationController> _cardControllers;
  late List<Animation<double>> _cardAnimations;
  
  final List<_StatCardData> _stats = [
    _StatCardData(title: 'Total Projects', value: '15', icon: Icons.folder),
    _StatCardData(title: 'GitHub Stars', value: '1.2K', icon: Icons.star),
    _StatCardData(title: 'Followers', value: '850', icon: Icons.people),
    _StatCardData(title: 'Commits', value: '432', icon: Icons.commit),
  ];

  final List<_ProgressData> _progressItems = [
    _ProgressData(label: 'Flutter', value: 85),
    _ProgressData(label: 'React', value: 70),
    _ProgressData(label: 'Node.js', value: 60),
    _ProgressData(label: 'Python', value: 75),
  ];

  @override
  void initState() {
    super.initState();
    
    // Create staggered animation controllers
    _cardControllers = List.generate(
      _stats.length + _progressItems.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400 + (index * 100)),
      ),
    );
    
    _cardAnimations = _cardControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      );
    }).toList();
    
    // Start staggered animations
    for (var controller in _cardControllers) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: AppTextStyles.heading2.copyWith(
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 32),
            
            // Stats Cards with Staggered ScaleIn
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(_stats.length, (index) {
                return AnimatedBuilder(
                  animation: _cardAnimations[index],
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * _cardAnimations[index].value),
                      child: Opacity(
                        opacity: _cardAnimations[index].value,
                        child: child,
                      ),
                    );
                  },
                  child: _StatsCard(
                    title: _stats[index].title,
                    value: _stats[index].value,
                    icon: _stats[index].icon,
                  ),
                );
              }),
            ),
            
            const SizedBox(height: 48),
            
            Text(
              'Skills Progress',
              style: AppTextStyles.heading3.copyWith(
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            
            // Progress Bars with Linear Fill
            ...List.generate(_progressItems.length, (index) {
              final controllerIndex = _stats.length + index;
              return AnimatedBuilder(
                animation: _cardAnimations[controllerIndex],
                builder: (context, child) {
                  return Opacity(
                    opacity: _cardAnimations[controllerIndex].value,
                    child: child,
                  );
                },
                child: _ProgressBar(
                  label: _progressItems[index].label,
                  value: _progressItems[index].value,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _StatCardData {
  final String title;
  final String value;
  final IconData icon;
  
  _StatCardData({required this.title, required this.value, required this.icon});
}

class _ProgressData {
  final String label;
  final int value;
  
  _ProgressData({required this.label, required this.value});
}

class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatsCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF2563EB),
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTextStyles.heading2.copyWith(
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatefulWidget {
  final String label;
  final int value;

  const _ProgressBar({required this.label, required this.value});

  @override
  State<_ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<_ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0.0, end: widget.value / 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(4),
            ),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2563EB),
                          Color(0xFF8B5CF6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}