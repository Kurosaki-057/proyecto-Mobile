import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController(text: 'miguel@gmail.com');
  final _phoneController = TextEditingController(text: '3012736452');
  final _passwordController = TextEditingController(text: 'password123');
  final _addressController = TextEditingController(text: 'calle 12 #24');

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile section
                    Row(
                      children: [
                        Text(
                          "mi cuenta",
                          style: AppTypography.titleMono.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        // Profile avatar
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/profile_avatar.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  color: Colors.white54,
                                  size: 32,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Contact information section
                    Text(
                      "informacion de contacto",
                      style: AppTypography.bodyMono.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Email field
                    _buildLabel("Email"),
                    const SizedBox(height: 8),
                    _buildTextField(_emailController),
                    const SizedBox(height: 16),
                    
                    // Phone field
                    _buildLabel("numero de contacto"),
                    const SizedBox(height: 8),
                    _buildTextField(_phoneController),
                    const SizedBox(height: 16),
                    
                    // Password field
                    _buildLabel("contraseña"),
                    const SizedBox(height: 8),
                    _buildTextField(_passwordController, isPassword: true),
                    const SizedBox(height: 24),
                    
                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            "editar",
                            () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Modo edición activado",
                                    style: AppTypography.bodyMono,
                                  ),
                                  backgroundColor: AppColors.accentRed,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionButton(
                            "cambiar cont.",
                            () {
                              _showChangePasswordDialog();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    // Address section
                    Text(
                      "mi direccion",
                      style: AppTypography.bodyMono.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[700]!, width: 1),
                      ),
                      child: Text(
                        _addressController.text,
                        style: AppTypography.bodyMono.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Save button
                    SizedBox(
                      width: double.infinity,
                      child: _buildActionButton(
                        "guardar",
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Información guardada exitosamente",
                                style: AppTypography.bodyMono,
                              ),
                              backgroundColor: AppColors.accentRed,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Footer
                    Center(
                      child: Text(
                        "© 2025 SkateLand®. All rights reserved.",
                        style: AppTypography.caption.copyWith(
                          color: Colors.white54,
                        ),
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTypography.bodyMono.copyWith(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accentRed, width: 2),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: AppTypography.bodyMono.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: AppTypography.bodyMono.copyWith(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentRed,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        text,
        style: AppTypography.bodyMono.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.card,
          title: Text(
            "Cambiar Contraseña",
            style: AppTypography.titleMono.copyWith(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogTextField(currentPasswordController, "Contraseña actual", isPassword: true),
              const SizedBox(height: 16),
              _buildDialogTextField(newPasswordController, "Nueva contraseña", isPassword: true),
              const SizedBox(height: 16),
              _buildDialogTextField(confirmPasswordController, "Confirmar contraseña", isPassword: true),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancelar",
                style: AppTypography.bodyMono.copyWith(color: Colors.white54),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (newPasswordController.text == confirmPasswordController.text) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Contraseña cambiada exitosamente",
                        style: AppTypography.bodyMono,
                      ),
                      backgroundColor: AppColors.accentRed,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Las contraseñas no coinciden",
                        style: AppTypography.bodyMono,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentRed,
              ),
              child: Text(
                "Cambiar",
                style: AppTypography.bodyMono.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogTextField(TextEditingController controller, String hint, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: AppTypography.bodyMono.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.bodyMono.copyWith(color: Colors.white54),
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.accentRed),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.accentRed),
        ),
      ),
    );
  }
}
