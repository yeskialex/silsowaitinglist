# Design System Rules for Suksok iOS App

This document provides comprehensive design system rules for integrating Figma designs into the Suksok iOS Flutter application using the Model Context Protocol (MCP).

## Project Overview

**Framework**: Flutter (Dart)
**Primary Language**: Dart
**Target Platform**: iOS
**App Type**: Child development tracking application with character creation

## 1. Design System Structure

### Token Definitions

The application uses a **hardcoded design token approach** with consistent color values and spacing throughout the codebase:

#### Color Palette
```dart
// Primary Colors
Color(0xFF007BEB)  // Primary blue - main brand color
Color(0xFF1976D2)  // Secondary blue - registration flow
Color(0xFFFFD724)  // Accent yellow - progress indicators, highlights
Color(0xFFF8F8F8)  // Light gray - text on colored backgrounds
Color(0xFFF5F5F5)  // Background gray - page backgrounds
Color(0xFFE4E1E1)  // Light border/divider gray
Color(0xFFA2A2A2)  // Medium gray - subtitle text

// Semantic Colors
Colors.white       // Pure white backgrounds
Colors.grey        // Disabled states
```

#### Typography Scale
```dart
// Font Family: Pretendard (Korean optimized)
fontFamily: 'Pretendard'

// Font Weights
FontWeight.w400   // Regular
FontWeight.w500   // Medium
FontWeight.w600   // Semi-bold
FontWeight.w700   // Bold

// Font Sizes (responsive using screenWidth)
screenWidth * 0.027  // Small text (10-11px)
screenWidth * 0.03   // Body text (12-13px)
screenWidth * 0.035  // Medium text (14-15px)
screenWidth * 0.055  // Large text (20-22px)
screenWidth * 0.0593 // Headline text (22-24px)
```

#### Spacing System
```dart
// Consistent spacing using screenHeight/screenWidth multipliers
screenHeight * 0.003  // Extra small (2-3px)
screenHeight * 0.01   // Small (7-8px)
screenHeight * 0.02   // Medium (15-16px)
screenHeight * 0.03   // Large (22-24px)
screenHeight * 0.04   // Extra large (30-32px)

screenWidth * 0.054   // Horizontal padding (20px)
screenWidth * 0.035   // Container padding (13px)
```

#### Border Radius
```dart
BorderRadius.circular(8.37)   // Standard rounded corners
BorderRadius.circular(21.27)  // Button rounded corners
BorderRadius.circular(69.52)  // Circular elements
```

### 2. Component Library

#### Component Architecture Pattern
- **Stateful Widgets**: For interactive components requiring state management
- **Stateless Widgets**: For static display components
- **Builder Methods**: Private methods like `_buildChildProfileCard()` for reusable UI sections

#### Key Component Patterns

**Container with Decoration Pattern**:
```dart
Container(
  decoration: ShapeDecoration(
    color: const Color(0xFF007BEB),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.37),
    ),
  ),
  child: // content
)
```

**Responsive Sizing Pattern**:
```dart
// Always use MediaQuery for responsive dimensions
final screenWidth = MediaQuery.of(context).size.width;
final screenHeight = MediaQuery.of(context).size.height;

width: screenWidth * 0.89,
height: screenHeight * 0.287,
```

**Text Style Pattern**:
```dart
Text(
  'Content',
  style: TextStyle(
    color: const Color(0xFF007BEB),
    fontSize: screenWidth * 0.055,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  ),
)
```

### 3. Frameworks & Libraries

#### Core Dependencies
```yaml
dependencies:
  flutter: sdk: flutter
  cupertino_icons: ^1.0.8    # iOS-style icons
  flutter_svg: ^2.0.10+1     # SVG asset support

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^5.0.0      # Code quality
```

#### UI Framework
- **Flutter Material Design**: Primary UI framework
- **Custom styling**: Overrides Material Design with brand colors and Pretendard typography
- **SVG Support**: flutter_svg for scalable vector graphics

#### Build System
- **Flutter SDK**: ^3.9.2
- **Dart**: Native Flutter build system
- **iOS**: Xcode-based compilation

### 4. Asset Management

#### Asset Structure
```
assets/
├── fonts/
│   └── poppins/           # Alternative font family (unused)
├── *.svg                  # Vector graphics (logos, icons, characters)
├── *.png                  # Raster images (examples, gradients)
└── (referenced in pubspec.yaml)

fonts/                     # Primary font location
├── Pretendard-Regular.ttf
├── Pretendard-Medium.ttf
└── Pretendard-Bold.ttf
```

#### Asset Declaration (pubspec.yaml)
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/

  fonts:
    - family: Pretendard
      fonts:
        - asset: fonts/Pretendard-Regular.ttf
          weight: 400
        - asset: fonts/Pretendard-Medium.ttf
          weight: 500
        - asset: fonts/Pretendard-Bold.ttf
          weight: 700
```

#### Asset Usage Pattern
```dart
// SVG Assets
SvgPicture.asset(
  'assets/logo2.svg',
  width: screenWidth * 0.0755,
  height: screenHeight * 0.0390,
)

// Font Usage
fontFamily: 'Pretendard'  // Always specify in TextStyle
```

### 5. Icon System

#### Icon Storage
- **Location**: `assets/` directory
- **Format**: SVG files for scalability
- **Naming**: Descriptive names (e.g., `camera_icon.svg`, `character_at_home.svg`)

#### Icon Naming Convention
```
{purpose}_{description}.svg
Examples:
- logo.svg, logo2.svg
- camera_icon.svg
- character_at_home.svg
- character_face_orange.svg
- microphone-2.svg
- check.svg, circle.svg
```

#### Icon Usage Pattern
```dart
SvgPicture.asset(
  'assets/{icon_name}.svg',
  width: {responsive_width},
  height: {responsive_height},
)
```

### 6. Styling Approach

#### CSS Methodology
- **Inline Styling**: All styles defined directly in widget constructors
- **No CSS Files**: Flutter uses Dart-based styling
- **Responsive Design**: MediaQuery-based responsive multipliers

#### Global Theme Configuration
```dart
// main.dart theme setup
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Pretendard',  // Global font
  ),
)
```

#### Responsive Implementation
```dart
// Consistent responsive patterns
final screenWidth = MediaQuery.of(context).size.width;
final screenHeight = MediaQuery.of(context).size.height;

// Use percentage-based sizing
width: screenWidth * 0.89,     // 89% of screen width
fontSize: screenWidth * 0.055,  // Proportional text
padding: EdgeInsets.symmetric(
  horizontal: screenWidth * 0.054,
  vertical: screenHeight * 0.03,
)
```

### 7. Project Structure

#### File Organization
```
lib/
├── main.dart                    # App entry point, theme setup
├── home.dart                    # Main dashboard screen
├── previous_result.dart         # Results display
├── level2.dart                  # Additional feature screen
└── registration/
    ├── children_regis.dart      # Registration flow
    └── character_creation/
        ├── 1_camera.dart        # Camera capture screen
        ├── 2_camera_ready.dart  # Camera preparation
        ├── 3_picture.dart       # Photo review
        ├── 4_loading.dart       # Processing screen
        ├── 5_baby_face.dart     # Face detection
        ├── 6_baby_face_received.dart
        ├── 7_baby_face_done.dart
        └── 8_done.dart          # Completion screen
```

#### Feature Organization Pattern
- **Flow-based**: Screens grouped by user journey (registration, character_creation)
- **Numbered sequences**: Step-by-step flows use numbered files
- **Descriptive names**: Clear purpose-driven naming

## Figma Integration Guidelines

### When Converting Figma Designs:

1. **Extract exact hex colors** and use `Color(0xFF{hex})` format
2. **Maintain responsive sizing** using `screenWidth/screenHeight` multipliers
3. **Use Pretendard font family** with appropriate weights
4. **Apply standard border radius** (8.37px for cards, 21.27px for buttons)
5. **Implement SVG assets** with `flutter_svg` package
6. **Follow Container + ShapeDecoration** pattern for styled elements
7. **Use Stack widgets** for layered/overlapping designs (see home.dart:78-318)
8. **Implement GestureDetector** for custom interactive elements

### Design Token Reference:
- Primary brand color: `#007BEB`
- Accent color: `#FFD724`
- Background: `#F8F8F8` or `#F5F5F5`
- Text on colored bg: `#F8F8F8`
- Standard border radius: `8.37px`
- Button border radius: `21.27px`

### Asset Requirements:
- Save icons/illustrations as SVG in `assets/` directory
- Update `pubspec.yaml` if adding new assets
- Use descriptive filenames following the established pattern
- Maintain consistent sizing with responsive multipliers

This design system ensures consistency across the Suksok application while maintaining the flexibility to implement new Figma designs following established patterns and conventions.