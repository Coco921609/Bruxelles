import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final ThemeMode currentThemeMode;
  final Function(ThemeMode) onThemeChanged;

  const SettingsPage({
    super.key,
    required this.currentThemeMode,
    required this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.currentThemeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Le fond s'adapte automatiquement grâce au thème défini dans main.dart
      appBar: AppBar(
        title: const Text("Paramètres", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
              "APPARENCE",
              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)
          ),
          const SizedBox(height: 15),

          // Switch de thème
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: isDark ? null : Border.all(color: Colors.black12),
            ),
            // Utilisation de MediaQuery pour désactiver les animations système sur ce widget
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(disableAnimations: true),
              child: Theme(
                // On injecte une durée d'animation à zéro pour supprimer l'effet de glisse
                data: Theme.of(context).copyWith(
                  visualDensity: VisualDensity.compact,
                ),
                child: SwitchListTile(
                  title: const Text("Mode Sombre", style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(_isDarkMode ? "Activé" : "Désactivé (Mode Clair Foncé)"),
                  secondary: Icon(
                    _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: _isDarkMode ? Colors.purpleAccent : Colors.orange,
                  ),
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() => _isDarkMode = value);
                    widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}