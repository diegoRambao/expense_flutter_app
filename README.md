# 💰 Wallat - Expense Tracker App

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![License](https://img.shields.io/badge/license-Private-red)

Una aplicación móvil de gestión de gastos personales construida con Flutter, implementando Clean Architecture y principios SOLID.

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Arquitectura](#-arquitectura)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación](#-instalación)
- [Configuración](#️-configuración)
- [Ejecutar la Aplicación](#-ejecutar-la-aplicación)
- [Testing](#-testing)
- [Tecnologías y Paquetes](#-tecnologías-y-paquetes)
- [Convenciones de Código](#-convenciones-de-código)
- [Contribuir](#-contribuir)

## ✨ Características

- 🔐 **Autenticación de usuarios** - Sistema completo de registro e inicio de sesión
- 🌍 **Multilenguaje** - Soporte para español e inglés
- 🎨 **Temas claro/oscuro** - Adaptación automática al sistema
- 📊 **Gestión de gastos** - Crear, visualizar y organizar gastos
- 🏗️ **Clean Architecture** - Código mantenible y escalable
- 💉 **Inyección de dependencias** - Usando GetIt
- 🔄 **State Management** - Provider para gestión de estado

## 🏛️ Arquitectura

El proyecto sigue **Clean Architecture** con separación en capas:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Pages, Widgets, Providers)        │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│          Domain Layer                   │
│  (Entities, UseCases, Repository        │
│   Interfaces)                           │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│           Data Layer                    │
│  (Models, DataSources, Repository       │
│   Implementations, Mappers)             │
└─────────────────────────────────────────┘
```

### 🔄 Flujo de Datos

1. **UI (Presentation)** → El usuario interactúa con las páginas y widgets
2. **Provider (ViewModel)** → Maneja el estado y la lógica de presentación
3. **UseCase (Domain)** → Ejecuta la lógica de negocio específica
4. **Repository (Domain Interface)** → Define el contrato de acceso a datos
5. **Repository Implementation (Data)** → Implementa la lógica de acceso a datos
6. **DataSource (Data)** → Se comunica con APIs o bases de datos locales

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada de la aplicación
│
└── src/
    ├── core/                          # Código compartido entre features
    │   ├── constants/                 # Constantes globales
    │   │   ├── app_colors.dart        # Paleta de colores
    │   │   └── app_styles.dart        # Estilos de texto y widgets
    │   │
    │   ├── di/                        # Inyección de dependencias
    │   │   └── injection_container.dart
    │   │
    │   ├── errors/                    # Manejo de errores
    │   │   └── exceptions.dart        # Excepciones personalizadas
    │   │
    │   ├── localization/              # Archivos de internacionalización
    │   │   ├── app_locale.dart        # Configuración de locales
    │   │   ├── welcome_locale.dart    # Textos de bienvenida
    │   │   ├── sign_locale.dart       # Textos de inicio de sesión
    │   │   ├── sign_up_locale.dart    # Textos de registro
    │   │   └── settings_locale.dart   # Textos de configuración
    │   │
    │   ├── theme/                     # Temas de la aplicación
    │   │   └── app_theme.dart         # Tema claro y oscuro
    │   │
    │   └── utils/                     # Utilidades generales
    │       └── validators.dart        # Validadores de formularios
    │
    └── features/                      # Módulos por funcionalidad
        │
        ├── auth/                      # Feature de autenticación
        │   ├── data/
        │   │   ├── datasources/
        │   │   │   └── user_remote_datasource.dart
        │   │   ├── entities/
        │   │   │   ├── create_user_model.dart
        │   │   │   ├── user_model.dart
        │   │   │   └── user_response_model.dart
        │   │   ├── mappers/
        │   │   │   └── user_mapper.dart
        │   │   └── repositories/
        │   │       └── user_repository_impl.dart
        │   │
        │   ├── domain/
        │   │   ├── models/
        │   │   │   ├── create_user_entity.dart
        │   │   │   └── user_entity.dart
        │   │   ├── repositories/
        │   │   │   └── user_repository.dart
        │   │   └── usecases/
        │   │       ├── create_user_usecase.dart
        │   │       └── get_users_usecase.dart
        │   │
        │   └── presentation/
        │       ├── components/
        │       │   └── labeled_text_field.dart
        │       ├── pages/
        │       │   ├── welcome_page.dart
        │       │   ├── sign_in_page.dart
        │       │   └── sign_up_page.dart
        │       └── providers/
        │           ├── welcome_provider.dart
        │           └── sign_up_view_model.dart
        │
        └── home/                      # Feature principal
            └── presentation/
                └── pages/
                    └── home_page.dart
```

### 🗂️ Descripción de Carpetas

#### **Core**

Contiene código compartido entre todos los features:

- **constants**: Colores, estilos y constantes de la app
- **di**: Configuración de inyección de dependencias con GetIt
- **errors**: Excepciones y manejo de errores personalizados
- **localization**: Archivos de traducción para i18n
- **theme**: Configuración de temas claro y oscuro
- **utils**: Funciones de utilidad y validadores

#### **Features**

Cada feature es un módulo independiente con sus propias capas:

**Data Layer**:

- **datasources**: Comunicación con APIs y bases de datos
- **entities/models**: Modelos de datos (DTOs)
- **mappers**: Conversión entre models y entities del dominio
- **repositories**: Implementación concreta de los repositorios

**Domain Layer**:

- **models/entities**: Objetos de negocio puros
- **repositories**: Interfaces/contratos de repositorios
- **usecases**: Lógica de negocio específica

**Presentation Layer**:

- **components/widgets**: Widgets reutilizables del feature
- **pages**: Pantallas completas
- **providers**: ViewModels para gestión de estado

## 🛠️ Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versión 3.9.2 o superior)
- [Dart SDK](https://dart.dev/get-dart) (versión 3.9.2 o superior)
- IDE recomendado: [VS Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)
- Extensiones de Flutter y Dart para tu IDE
- Emulador Android/iOS o dispositivo físico para pruebas

## 📥 Instalación

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/diegoRambao/expense_flutter_app.git
   cd spend_flutter_app
   ```

2. **Instalar dependencias**

   ```bash
   flutter pub get
   ```

3. **Verificar la instalación de Flutter**
   ```bash
   flutter doctor
   ```
   Asegúrate de que todos los checks estén en verde ✓

## ⚙️ Configuración

### Variables de Entorno

El proyecto puede requerir configuración adicional para APIs externas. Crea un archivo de configuración si es necesario.

### Configurar Backend API

Si estás usando un backend propio, actualiza la URL base en el datasource correspondiente:

```dart
// lib/src/features/auth/data/datasources/user_remote_datasource.dart
final baseUrl = 'https://tu-api.com';
```

### Configurar Idioma por Defecto

El idioma por defecto se configura en `main.dart`:

```dart
localization.init(
  mapLocales: [
    MapLocale('en', AppLocale.en),
    MapLocale('es', AppLocale.es),
  ],
  initLanguageCode: 'es', // Cambia esto según prefieras
);
```

## 🚀 Ejecutar la Aplicación

### Modo Debug

```bash
flutter run
```

### Modo Release

```bash
flutter run --release
```

### Ejecutar en dispositivo específico

```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter run -d <device_id>
```

### Hot Reload

Durante el desarrollo, usa:

- `r` para hot reload (recarga rápida)
- `R` para hot restart (reinicio completo)
- `q` para salir

## 🧪 Testing

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con cobertura
flutter test --coverage

# Ejecutar tests específicos
flutter test test/features/auth/domain/usecases/create_user_usecase_test.dart
```

## 📦 Tecnologías y Paquetes

### Dependencias Principales

| Paquete                                                               | Versión | Propósito                 |
| --------------------------------------------------------------------- | ------- | ------------------------- |
| [provider](https://pub.dev/packages/provider)                         | ^6.1.5  | State management          |
| [get_it](https://pub.dev/packages/get_it)                             | ^9.0.5  | Inyección de dependencias |
| [http](https://pub.dev/packages/http)                                 | ^1.5.0  | Cliente HTTP para APIs    |
| [flutter_localization](https://pub.dev/packages/flutter_localization) | ^0.3.3  | Internacionalización      |
| [google_fonts](https://pub.dev/packages/google_fonts)                 | ^6.3.2  | Fuentes personalizadas    |
| [flutter_svg](https://pub.dev/packages/flutter_svg)                   | ^2.2.1  | Soporte para SVG          |
| [fluttertoast](https://pub.dev/packages/fluttertoast)                 | ^9.0.0  | Notificaciones toast      |

### Dependencias de Desarrollo

- `flutter_test`: Testing framework
- `flutter_lints`: Reglas de linting recomendadas

## 📝 Convenciones de Código

### Nomenclatura

- **Archivos y carpetas**: `snake_case`
- **Clases**: `PascalCase`
- **Variables y funciones**: `camelCase`
- **Constantes**: `UPPER_SNAKE_CASE` o `kConstantName`

### Estructura de Archivos

```dart
// ✅ Buena práctica
user_repository.dart
create_user_usecase.dart
sign_in_page.dart

// ❌ Evitar
UserRepository.dart
createUserUseCase.dart
SignInPage.dart
```

### Organización por Features

Cada feature debe ser **autocontenida** e incluir sus propias capas de data, domain y presentation.

**Ejemplo**: El feature `auth` contiene todo lo relacionado con autenticación:

```
auth/
├── data/          # Implementaciones de datos
├── domain/        # Lógica de negocio
└── presentation/  # UI y estado
```

### Principios SOLID

- **S**ingle Responsibility: Cada clase tiene una sola responsabilidad
- **O**pen/Closed: Abierto para extensión, cerrado para modificación
- **L**iskov Substitution: Las implementaciones pueden sustituir sus interfaces
- **I**nterface Segregation: Interfaces pequeñas y específicas
- **D**ependency Inversion: Dependencias hacia abstracciones, no concreciones

### Comentarios

- Usa comentarios para explicar **por qué**, no **qué**
- Documenta clases y métodos públicos con dartdoc
- Usa `TODO:` para marcar trabajo pendiente
- Usa `FIXME:` para marcar código que necesita corrección

**Ejemplo**:

````dart
/// Valida que el email tenga un formato correcto.
///
/// Retorna `true` si el email es válido, `false` en caso contrario.
///
/// Ejemplo:
/// ```dart
/// validateEmail('test@example.com') // true
/// validateEmail('invalid-email')    // false
/// ```
bool validateEmail(String email) {
  // Usamos regex en lugar de .contains('@') porque es más preciso
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}
````

### Linting

El proyecto usa `flutter_lints`. Ejecuta el análisis con:

```bash
flutter analyze
```

## 🤝 Contribuir

### Flujo de Trabajo

1. **Crea una rama** desde `main`

   ```bash
   git checkout -b feature/nueva-funcionalidad
   # o
   git checkout -b fix/correccion-bug
   ```

2. **Realiza tus cambios** siguiendo las convenciones

3. **Commit con mensajes descriptivos**

   ```bash
   git commit -m "feat: agregar pantalla de estadísticas"
   ```

4. **Push a tu rama**

   ```bash
   git push origin feature/nueva-funcionalidad
   ```

5. **Crea un Pull Request** hacia `main`

### Convención de Commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` Nueva funcionalidad
- `fix:` Corrección de bugs
- `docs:` Cambios en documentación
- `style:` Formateo, punto y coma faltantes, etc.
- `refactor:` Refactorización de código
- `test:` Agregar o corregir tests
- `chore:` Mantenimiento y tareas varias

**Ejemplos**:

```bash
feat: agregar pantalla de estadísticas mensuales
fix: corregir error al guardar gastos sin categoría
docs: actualizar README con instrucciones de instalación
refactor: simplificar lógica de validación de formularios
test: agregar tests para CreateUserUseCase
```

### Checklist antes de Pull Request

- [ ] El código compila sin errores (`flutter analyze`)
- [ ] Todos los tests pasan (`flutter test`)
- [ ] Se agregaron tests para nuevas funcionalidades
- [ ] Se actualizó la documentación si es necesario
- [ ] El código sigue las convenciones del proyecto
- [ ] Se probó en al menos un dispositivo/emulador

## 🐛 Reportar Bugs

Si encuentras un bug, por favor crea un issue con:

1. **Descripción clara** del problema
2. **Pasos para reproducir** el error
3. **Comportamiento esperado** vs comportamiento actual
4. **Screenshots** si es aplicable
5. **Información del dispositivo** (OS, versión de Flutter)

## 📧 Contacto

- **Repositorio**: [github.com/diegoRambao/expense_flutter_app](https://github.com/diegoRambao/expense_flutter_app)
- **Issues**: [Reportar un problema](https://github.com/diegoRambao/expense_flutter_app/issues)

---

Desarrollado con ❤️ usando Flutter
