import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _subtitleController;
  late AnimationController _ctaController;
  
  late TextEditingController _typeWriterController;
  String _displayedText = '';
  bool _showCursor = true;
  
  final String _fullTitle = 'AMK Developer';
  final String _subtitle = 'Building digital experiences that matter';

  @override
  void initState() {
    super.initState();
    
    // Title animation controller
    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    // Subtitle animation (FadeIn + SlideUp with delay)
    _subtitleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    // CTA button animation
    _ctaController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    // Typewriter effect
    _typeWriterController = TextEditingController();
    _startTypewriter();
    
    // Start staggered animations
    Future.delayed(const Duration(milliseconds: 300), () {
      _subtitleController.forward();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      _ctaController.forward();
    });
  }

  void _startTypewriter() async {
    for (int i = 0; i <= _fullTitle.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _displayedText = _fullTitle.substring(0, i);
      });
    }
    _titleController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _ctaController.dispose();
    _typeWriterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hero Title with Typewriter Effect
              AnimatedBuilder(
                animation: _titleController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _titleController.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _titleController.value)),
                      child: child,
                    ),
                  ) ?? const SizedBox.shrink();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _displayedText,
                      style: AppTextStyles.heading1.copyWith(
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                    if (_showCursor) 
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Color(0xFF2563EB),
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Subtitle with FadeIn + SlideUp
              FadeTransition(
                opacity: _subtitleController,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _subtitleController,
                    curve: Curves.easeOut,
                  )),
                  child: Text(
                    _subtitle,
                    style: AppTextStyles.subtitle.copyWith(
                      color: const Color(0xFF1F2937),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              
              const SizedBox(height: 48),
              
              // CTA Button with FadeIn + SlideUp
              FadeTransition(
                opacity: _ctaController,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _ctaController,
                    curve: Curves.easeOut,
                  )),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: const Color(0xFFFAFAFA),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}