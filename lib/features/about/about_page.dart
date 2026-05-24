import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;
  
  final List<_SkillData> _skills = [
    _SkillData(name: 'Flutter', level: 95),
    _SkillData(name: 'Dart', level: 90),
    _SkillData(name: 'React', level: 85),
    _SkillData(name: 'Node.js', level: 80),
    _SkillData(name: 'Python', level: 75),
    _SkillData(name: 'Firebase', level: 85),
    _SkillData(name: 'Git', level: 90),
    _SkillData(name: 'UI/UX', level: 82),
  ];
  
  final List<Map<String, dynamic>> _socialLinks = [
    {'name': 'GitHub', 'icon': Icons.code},
    {'name': 'LinkedIn', 'icon': Icons.work},
    {'name': 'Twitter', 'icon': Icons.alternate_email},
    {'name': 'Email', 'icon': Icons.email},
  ];

  @override
  void initState() {
    super.initState();
    
    // Soft Breathing Glow Animation (3000ms Loop)
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(
        parent: _glowController,
        curve: Curves.easeInOut,
      ),
    );
    
    _glowController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: AppTextStyles.heading2.copyWith(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 32),
            
            // Profile with Breathing Glow
            Center(
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF38BDF8)
                              .withOpacity(_glowAnimation.value),
                          blurRadius: 20 + (_glowAnimation.value * 10),
                          spreadRadius: 2 + (_glowAnimation.value * 5),
                        ),
                      ],
                    ),
                    child: child,
                  );
                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xFF1E293B),
                  backgroundImage: null,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF38BDF8),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Bio Text
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF334155),
                ),
              ),
              child: Text(
                "Hi! I'm AMK Developer - a passionate mobile and web developer "
                "specializing in Flutter and modern web technologies. I love building "
                "beautiful, performant applications that provide great user experiences.",
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFFE2E8F0),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Skills Section
            Text(
              'Skills',
              style: AppTextStyles.heading3.copyWith(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 16),
            
            // Skill Badges with Pop Effect
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _skills.asMap().entries.map((entry) {
                return _SkillBadge(skill: entry.value);
              }).toList(),
            ),
            
            const SizedBox(height: 32),
            
            // Social Links
            Text(
              'Connect',
              style: AppTextStyles.heading3.copyWith(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _socialLinks.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _SocialIcon(
                    name: entry.value['name'],
                    icon: entry.value['icon'],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillData {
  final String name;
  final int level;
  
  _SkillData({required this.name, required this.level});
}

class _SkillBadge extends StatefulWidget {
  final _SkillData skill;
  
  const _SkillBadge({required this.skill});

  @override
  State<_SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<_SkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.1 : 1.0),
        transformAlignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered 
                ? const Color(0xFFF43F5E) 
                : const Color(0xFF334155),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFFF43F5E).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.skill.name,
              style: const TextStyle(
                color: Color(0xFFE2E8F0),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${widget.skill.level}%',
                style: const TextStyle(
                  color: Color(0xFF38BDF8),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final String name;
  final IconData icon;
  
  const _SocialIcon({required this.name, required this.icon});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..translate(0, _isHovered ? -4.0 : 0.0),
        transformAlignment: Alignment.center,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: _isHovered 
              ? const Color(0xFF38BDF8) 
              : const Color(0xFF1E293B),
          child: Icon(
            widget.icon,
            color: _isHovered 
                ? const Color(0xFF0F172A) 
                : const Color(0xFFE2E8F0),
            size: 20,
          ),
        ),
      ),
    );
  }
}