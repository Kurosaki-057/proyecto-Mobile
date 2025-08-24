import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
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
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));
    
    _buttonScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));
    
    // Iniciar animaciones secuencialmente
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: AppColors.accentRed, width: 1.2),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botón volver con animación
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.card,
                          foregroundColor: AppColors.textPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: AppColors.accentRed, width: 1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Volver'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Imagen superior con animación
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.accentRed.withValues(alpha: 0.8),
                                  AppColors.accentRed.withValues(alpha: 0.4),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.skateboarding,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Títulos con animación
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Inicio de sesión", style: AppTypography.titleMono),
                          const SizedBox(height: 8),
                          Text(
                            "inicia sesion con tu cuenta de SkateLand",
                            style: AppTypography.bodyMono,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),

                  // Email con animación
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                              style: AppTypography.caption
                                  .copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 6),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: AppTypography.bodyMono
                                .copyWith(color: AppColors.textPrimary),
                            decoration: InputDecoration(
                              hintText: "hey@yourmail.com",
                              hintStyle:
                                  AppTypography.bodyMono.copyWith(color: Colors.grey),
                              enabledBorder: border,
                              focusedBorder: border.copyWith(
                                borderSide: const BorderSide(
                                    color: AppColors.accentRed, width: 2),
                              ),
                              filled: true,
                              fillColor: AppColors.card,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Password con animación
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contraseña",
                              style: AppTypography.caption
                                  .copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 6),
                          TextField(
                            obscureText: true,
                            style: AppTypography.bodyMono
                                .copyWith(color: AppColors.textPrimary),
                            decoration: InputDecoration(
                              hintText: "introduce tu contraseña",
                              hintStyle:
                                  AppTypography.bodyMono.copyWith(color: Colors.grey),
                              enabledBorder: border,
                              focusedBorder: border.copyWith(
                                borderSide: const BorderSide(
                                    color: AppColors.accentRed, width: 2),
                              ),
                              filled: true,
                              fillColor: AppColors.card,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),

                  // Botón login con animación
                  ScaleTransition(
                    scale: _buttonScaleAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentRed,
                            shape: const StadiumBorder(),
                            elevation: 8,
                            shadowColor: AppColors.accentRed.withValues(alpha: 0.3),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const DashboardPage()),
                            );
                          },
                          child: Text("inicia sesión", style: AppTypography.button),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Registro con animación
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: "¿no tienes cuenta? ",
                          style: AppTypography.caption,
                          children: [
                            TextSpan(
                              text: "registrate",
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
