import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'semaine_page.dart';
import 'weekend_page.dart';
import 'specialites_page.dart';
import 'transports_page.dart';
import 'settings_page.dart';

void main() async {
  // 1. Indispensable pour interagir avec le moteur Flutter avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Bloquer l'orientation en mode portrait uniquement
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const BruxellesApp());
}

class BruxellesApp extends StatefulWidget {
  const BruxellesApp({super.key});

  @override
  State<BruxellesApp> createState() => _BruxellesAppState();
}

class _BruxellesAppState extends State<BruxellesApp> {
  ThemeMode _themeMode = ThemeMode.light;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _loadInitialConfig();
  }

  // CHARGEMENT DE LA CONFIGURATION (Thème + Premier Lancement)
  Future<void> _loadInitialConfig() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Charger le thème sauvegardé
    final String? savedTheme = prefs.getString('themeMode');
    if (savedTheme != null) {
      setState(() {
        _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      });
    }

    // 2. Vérifier si c'est le premier lancement
    final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (isFirstLaunch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showThemeSelectionDialog(prefs);
      });
    }
  }

  // FONCTION POUR CHANGER ET SAUVEGARDER LE THÈME
  void _toggleTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeMode = mode;
    });
    await prefs.setString('themeMode', mode == ThemeMode.dark ? 'dark' : 'light');
  }

  // FENÊTRE DE BIENVENUE (S'affiche une seule fois)
  void _showThemeSelectionDialog(SharedPreferences prefs) {
    if (navigatorKey.currentContext == null) return;

    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Bienvenue 🇧🇪", style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text("Choisissez votre mode d'affichage préféré. Ce choix sera mémorisé."),
        actions: [
          TextButton(
            onPressed: () async {
              _toggleTheme(ThemeMode.light);
              await prefs.setBool('isFirstLaunch', false);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text("CLAIR", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () async {
              _toggleTheme(ThemeMode.dark);
              await prefs.setBool('isFirstLaunch', false);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text("SOMBRE", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Bruxelles',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF0F0F0),
          foregroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0
        ),
        useMaterial3: true,
      ),
      home: HomePage(
        currentThemeMode: _themeMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final Function(ThemeMode) onThemeChanged;

  const HomePage({
    super.key,
    required this.currentThemeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🇧🇪 Bruxelles',
            style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(
                  currentThemeMode: currentThemeMode,
                  onThemeChanged: onThemeChanged,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Que faire aujourd'hui ?",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                                )
                            ),
                            const SizedBox(height: 5),
                            const Text("Découvrez la capitale à votre rythme.",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildModernRow(
                            context,
                            "Semaine",
                            "Parcourez les galeries couvertes, les quartiers historiques et profitez du calme des parcs bruxellois durant les jours ouvrables.",
                            Icons.calendar_today,
                            const Color(0xFFFFE082),
                            const SemainePage(),
                            isDark
                        ),
                        _buildDivider(isDark),
                        _buildModernRow(
                            context,
                            "Week-end",
                            "Vibrant et animé : découvrez les marchés locaux, les événements populaires et la vie nocturne unique du centre-ville.",
                            Icons.auto_awesome,
                            const Color(0xFFFFAB91),
                            const WeekendPage(),
                            isDark
                        ),
                        _buildDivider(isDark),
                        _buildModernRow(
                            context,
                            "Spécialités",
                            "Gaufres, chocolats, bières et frites : plongez dans le patrimoine culinaire qui fait la renommée mondiale de la Belgique.",
                            Icons.restaurant,
                            const Color(0xFFA5D6A7),
                            const SpecialitesPage(),
                            isDark
                        ),
                        _buildDivider(isDark),
                        _buildModernRow(
                            context,
                            "Transports",
                            "Guide pratique pour circuler facilement avec le métro, le tram ou le bus via le réseau STIB et les trains SNCB.",
                            Icons.train,
                            const Color(0xFF90CAF9),
                            const TransportsPage(),
                            isDark
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  Widget _buildModernRow(BuildContext context, String title, String description, IconData icon,
      Color color, Widget destination, bool isDark) {
    return InkWell(
      onTap: () => _navigateTo(context, destination),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: color),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isDark ? Colors.white : const Color(0xFF2D2D2D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Divider(
      color: isDark ? Colors.white10 : Colors.black12,
      thickness: 1,
      height: 1,
    );
  }
}