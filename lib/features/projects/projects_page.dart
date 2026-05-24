import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<_ProjectData> _projects = [
    _ProjectData(
      title: 'E-Commerce Platform',
      description: 'Full-stack shopping platform built with Flutter & Node.js',
      techStack: ['Flutter', 'Node.js', 'MongoDB'],
    ),
    _ProjectData(
      title: 'Task Manager App',
      description: 'Collaborative task management with real-time updates',
      techStack: ['React', 'Firebase', 'Redux'],
    ),
    _ProjectData(
      title: 'Portfolio Website',
      description: 'Responsive personal portfolio with animations',
      techStack: ['Next.js', 'TailwindCSS', 'Framer Motion'],
    ),
    _ProjectData(
      title: 'Weather Dashboard',
      description: 'Beautiful weather visualization with forecasts',
      techStack: ['Flutter', 'REST API', 'Charts'],
    ),
  ];

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
              'Projects',
              style: AppTextStyles.heading2.copyWith(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 32),
            
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: _projects.map((project) {
                return _ProjectCard(project: project);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectData {
  final String title;
  final String description;
  final List<String> techStack;

  _ProjectData({
    required this.title,
    required this.description,
    required this.techStack,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0, _isHovered ? -6.0 : 0.0, 0.0)
          ..scale(_isHovered ? 1.02 : 1.0),
        transformAlignment: Alignment.center,
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered 
                  ? const Color(0xFF38BDF8) 
                  : const Color(0xFF334155),
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.title,
                style: AppTextStyles.heading3.copyWith(
                  color: const Color(0xFFE2E8F0),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.project.description,
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.techStack.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}