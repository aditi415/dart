MaterialApp vs CupertinoApp
dart
// Material Design (Android-style)
MaterialApp(
  title: 'Material App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.system, // Follow system theme
  home: HomeScreen(),
  debugShowCheckedModeBanner: false,
  navigatorKey: _navigatorKey,
  onGenerateRoute: (settings) {
    // Custom route generation
  },
  supportedLocales: [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ],
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
)

// Cupertino Design (iOS-style)
CupertinoApp(
  title: 'Cupertino App',
  theme: CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    barBackgroundColor: CupertinoColors.systemBackground,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.label,
    ),
  ),
  home: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('Home'),
    ),
    child: Center(
      child: CupertinoButton(
        onPressed: () {},
        child: Text('iOS Button'),
      ),
    ),
  ),
)

// Platform-aware app
MaterialApp(
  theme: ThemeData(
    // Android style
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      elevation: 4,
    ),
  ),
  home: Platform.isIOS 
      ? CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('iOS')),
          child: Center(child: Text('iOS Style')),
        )
      : Scaffold(
          appBar: AppBar(title: Text('Android')),
          body: Center(child: Text('Android Style')),
        ),
)
Purpose: MaterialApp for Android/Material design, CupertinoApp for iOS design. Most apps use MaterialApp with platform-specific widgets where needed.


  
ThemeData - Complete App Styling
dart
ThemeData(
  // Color scheme
  colorScheme: ColorScheme(
    primary: Colors.blue,
    primaryVariant: Colors.blue.shade800,
    secondary: Colors.green,
    secondaryVariant: Colors.green.shade800,
    surface: Colors.white,
    background: Colors.grey[100]!,
    error: Colors.red,
    onPrimary: Colors.white, // Text/icon color on primary
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  
  // Alternative: Use seed color
  colorSchemeSeed: Colors.blue,
  useMaterial3: true, // Use Material 3 design
  
  // Typography
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
  ),
  
  // App bar theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  
  // Button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(64, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.blue,
    ),
  ),
  
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.blue),
    ),
  ),
  
  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    filled: true,
    fillColor: Colors.grey[100],
    contentPadding: EdgeInsets.all(16),
  ),
  
  // Card theme
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: EdgeInsets.all(8),
  ),
  
  // Dialog theme
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 8,
  ),
  
  // Chip theme
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[200],
    labelStyle: TextStyle(color: Colors.black),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  ),
  
  // Other properties
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Roboto',
  splashColor: Colors.blue.withOpacity(0.2),
  highlightColor: Colors.blue.withOpacity(0.1),
  hoverColor: Colors.blue.withOpacity(0.05),
  focusColor: Colors.blue.withOpacity(0.3),
  disabledColor: Colors.grey[400],
  
  // Platform-specific
  platform: TargetPlatform.android,
  
  // Material 3
  useMaterial3: true,
)
Using Themes
dart
// Access theme in widget
Theme.of(context).primaryColor
Theme.of(context).textTheme.headline6

// Custom theme for specific widget
Theme(
  data: Theme.of(context).copyWith(
    cardColor: Colors.red,
  ),
  child: Card(child: Text('Custom themed card')),
)

// Dark theme
ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.blue,
  ),
)

// Complete example
MaterialApp(
  theme: ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    accentColor: Colors.orange,
  ),
  darkTheme: ThemeData.dark().copyWith(
    primaryColor: Colors.blue[700],
    accentColor: Colors.orange[700],
  ),
  themeMode: ThemeMode.system,
  home: MyHomePage(),
)
Purpose: ThemeData defines the visual design of your entire app (colors, typography, shapes). Consistency across app.

