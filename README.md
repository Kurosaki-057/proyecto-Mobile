# SkateLand® 🛹

Una aplicación móvil Flutter para la comunidad skater y sneaker enthusiasts. SkateLand combina la cultura urbana del skateboarding con el estilo auténtico de los sneakers en una experiencia móvil única.

## 🎯 Características

- **Catálogo de Productos**: Explora marcas y productos de skate y sneakers
- **Historial de Compras**: Rastrea tus compras anteriores
- **Soporte y Redes Sociales**: Conecta con la comunidad SkateLand
- **Tema Oscuro**: Diseño moderno con colores personalizados
- **Animaciones Fluidas**: Experiencia de usuario premium
- **Arquitectura Limpia**: Implementación con Clean Architecture

## 🏗️ Arquitectura

El proyecto sigue los principios de **Clean Architecture** con la siguiente estructura:

```
lib/
├── core/
│   └── theme/           # Colores y tipografía personalizados
├── features/
│   └── home/
│       ├── domain/      # Entidades y repositorios
│       ├── usecases/    # Casos de uso de negocio
│       └── presentation/ # UI y providers
├── app.dart            # Configuración principal de la app
└── main.dart           # Punto de entrada
```

## 🚀 Instalación y Ejecución

### Prerrequisitos
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Dispositivo Android/iOS o emulador

### Pasos de instalación

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd mobile
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Ejecutar la aplicación**
```bash
flutter run
```

### Comandos útiles

```bash
# Ejecutar en modo debug
flutter run

# Ejecutar en modo release
flutter run --release

# Generar APK
flutter build apk

# Ejecutar tests
flutter test

# Analizar código
flutter analyze
```

## 🎨 Tema y Diseño

SkateLand utiliza un tema oscuro personalizado con:
- **Colores principales**: Rojo accent (#FF3B30) y fondos oscuros
- **Tipografía**: Space Mono para un look urbano y moderno
- **Animaciones**: Transiciones suaves y efectos visuales

## 📱 Pantallas Principales

- **Home**: Página principal con navegación
- **Sales**: Catálogo de productos y ofertas
- **Purchase History**: Historial de compras del usuario
- **Support**: Información de contacto y redes sociales

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo móvil
- **Provider**: Gestión de estado
- **Clean Architecture**: Patrón arquitectónico
- **Custom Animations**: Animaciones personalizadas
- **Material Design**: Componentes de UI

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

© 2025 SkateLand®. All rights reserved.

## 📞 Contacto

- **Instagram**: @skateland
- **Facebook**: SkateLand Official
- **YouTube**: SkateLand Channel

---

**¡Únete a la comunidad SkateLand y vive la cultura urbana! 🛹✨**
