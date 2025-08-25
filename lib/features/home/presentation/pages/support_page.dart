import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'dart:async';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _socialController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _socialAnimation;
  
  final TextEditingController _emailController = TextEditingController();
  bool _isSubscribed = false;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _socialController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));
    
    _socialAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _socialController,
      curve: Curves.bounceOut,
    ));
    
    // Start animations
    _fadeController.forward();
    Timer(const Duration(milliseconds: 300), () {
      _slideController.forward();
    });
    Timer(const Duration(milliseconds: 600), () {
      _socialController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _socialController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: AppColors.accentRed,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Text(
                    "SKTLND®",
                    style: AppTypography.titleMono.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Hero Image Section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/IS-SO.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "NUESTRAS REDES",
                                style: AppTypography.titleMono.copyWith(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Social Media Icons
                    SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _SocialMediaIcon(
                              icon: 'instagram',
                              color: const Color(0xFFE4405F),
                              animation: _socialAnimation,
                              delay: 0,
                              onTap: () => _showSocialDialog('Instagram'),
                            ),
                            _SocialMediaIcon(
                              icon: 'facebook',
                              color: const Color(0xFF1877F2),
                              animation: _socialAnimation,
                              delay: 200,
                              onTap: () => _showSocialDialog('Facebook'),
                            ),
                            _SocialMediaIcon(
                              icon: 'youtube',
                              color: const Color(0xFFFF0000),
                              animation: _socialAnimation,
                              delay: 400,
                              onTap: () => _showSocialDialog('YouTube'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // About Us Section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ACERCA DE NOSOTROS.",
                              style: AppTypography.bodyMono.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "En SkateLand somos más que una tienda, somos una comunidad que respira cultura urbana. Nacimos con la pasión por el skate y el estilo auténtico que representan los sneakers, viviendo en un solo lugar lo mejor de ambos mundos.",
                              style: AppTypography.bodyMono.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Newsletter Section
                    SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "NEWSLETTER",
                              style: AppTypography.titleMono.copyWith(
                                color: AppColors.accentRed,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Introduce tu correo\npara saber más de promos!",
                              style: AppTypography.bodyMono.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            
                            // Email Input and Button
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    style: AppTypography.bodyMono.copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "tu correo",
                                      hintStyle: AppTypography.bodyMono.copyWith(
                                        color: Colors.white54,
                                        fontSize: 14,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[900],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  child: ElevatedButton(
                                    onPressed: _subscribeNewsletter,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.accentRed,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      _isSubscribed ? "✓" : "enviar",
                                      style: AppTypography.bodyMono.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Footer
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "© 2025 SkateLand®. All rights reserved.",
                        style: AppTypography.caption.copyWith(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _subscribeNewsletter() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        _isSubscribed = true;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "¡Suscrito exitosamente!",
            style: AppTypography.bodyMono,
          ),
          backgroundColor: AppColors.accentRed,
          duration: const Duration(seconds: 2),
        ),
      );
      
      // Reset after 3 seconds
      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isSubscribed = false;
            _emailController.clear();
          });
        }
      });
    }
  }

  void _showSocialDialog(String platform) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(
          "Síguenos en $platform",
          style: AppTypography.titleMono.copyWith(color: Colors.white),
        ),
        content: Text(
          "¡Únete a nuestra comunidad en $platform para contenido exclusivo!",
          style: AppTypography.bodyMono.copyWith(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cerrar",
              style: AppTypography.bodyMono.copyWith(color: AppColors.accentRed),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Abriendo $platform...",
                    style: AppTypography.bodyMono,
                  ),
                  backgroundColor: AppColors.accentRed,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentRed,
            ),
            child: Text(
              "Ir a $platform",
              style: AppTypography.bodyMono.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialMediaIcon extends StatefulWidget {
  final String icon;
  final Color color;
  final Animation<double> animation;
  final int delay;
  final VoidCallback onTap;

  const _SocialMediaIcon({
    required this.icon,
    required this.color,
    required this.animation,
    required this.delay,
    required this.onTap,
  });

  @override
  State<_SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<_SocialMediaIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _bounceAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.animation.value,
          child: ScaleTransition(
            scale: _bounceAnimation,
            child: GestureDetector(
              onTap: () {
                _bounceController.forward().then((_) {
                  _bounceController.reverse();
                });
                widget.onTap();
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  widget.icon == 'instagram'
                      ? Icons.camera_alt
                      : widget.icon == 'facebook'
                          ? Icons.facebook
                          : Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
