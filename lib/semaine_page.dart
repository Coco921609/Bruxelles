import 'package:flutter/material.dart';
import 'cinquantenaire_detail_page.dart';
import 'parc_leopold_detail_page.dart';
import 'parlement_europeen_page.dart';
import 'palais_justice_page.dart';
import 'place_poelaert_page.dart';
import 'sainte_catherine_page.dart';
import 'marche_poissons_page.dart';
import 'grand_place_page.dart';
import 'heysel_page.dart';
import 'laeken_page.dart';

class SemainePage extends StatelessWidget {
  const SemainePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Le fond s'adapte automatiquement (Gris doux en clair / Noir en sombre)
      appBar: AppBar(
        title: const Text("Itinéraire Semaine 🇧🇪"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          // --- QUARTIER EUROPÉEN ---
          _buildQuartierHeader("Quartier Européen", Icons.euro, isDark),
          _buildPlaceItem(context, "Le Cinquantenaire", "Arche royale, esplanade et jardins.", const CinquantenairePage(), isDark),
          _buildPlaceItem(context, "Parc Léopold", "Mur de Berlin et calme au pied du Parlement.", const ParcLeopoldPage(), isDark),
          _buildPlaceItem(context, "Parlement Européen", "Visite du Parlamentarium et de l'Hémicycle.", const ParlementEuropeenPage(), isDark),

          const Divider(color: Colors.grey, height: 40, thickness: 0.5),

          // --- QUARTIER MAROLLES ---
          _buildQuartierHeader("Quartier Marolles", Icons.location_city, isDark),
          _buildPlaceItem(context, "Palais de Justice", "Monument colossal avec vue panoramique.", const PalaisJusticePage(), isDark),
          _buildPlaceItem(context, "Place Poelaert", "Le meilleur point de vue sur la ville.", const PlacePoelaertPage(), isDark),

          const Divider(color: Colors.grey, height: 40, thickness: 0.5),

          // --- QUARTIER SAINTE-CATHERINE ---
          _buildQuartierHeader("Quartier Sainte-Catherine", Icons.restaurant, isDark),
          _buildPlaceItem(context, "Place Sainte-Catherine", "Ancien port, église et ambiance food.", const SainteCatherinePage(), isDark),
          _buildPlaceItem(context, "Marché aux Poissons", "Les meilleurs restaurants de la mer.", const MarchePoissonsPage(), isDark),

          const Divider(color: Colors.grey, height: 40, thickness: 0.5),

          // --- GRAND-PLACE ---
          _buildQuartierHeader("Grand-Place", Icons.castle, isDark),
          _buildPlaceItem(context, "La Grand-Place", "Le cœur historique et ses dorures.", const GrandPlacePage(), isDark),

          const Divider(color: Colors.grey, height: 40, thickness: 0.5),

          // --- HEYSEL ---
          _buildQuartierHeader("Heysel", Icons.rocket_launch, isDark),
          _buildPlaceItem(context, "Heysel", "Atomium, panorama et Design Museum.", const HeyselPage(), isDark),

          const Divider(color: Colors.grey, height: 40, thickness: 0.5),

          // --- LAEKEN ---
          _buildQuartierHeader("Laeken", Icons.forest, isDark),
          _buildPlaceItem(context, "Laeken", "Domaine Royal, Serres et Tour Japonaise.", const LaekenPage(), isDark),
        ],
      ),
    );
  }

  Widget _buildQuartierHeader(String title, IconData icon, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, color: Colors.amber, size: 22),
          ),
          const SizedBox(width: 12),
          Text(
              title.toUpperCase(),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: isDark ? Colors.amber : const Color(0xFF664400) // Plus foncé en mode clair
              )
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceItem(BuildContext context, String name, String subtitle, Widget? destination, bool isDark) {
    return Card(
      // Changement dynamique de couleur : Blanc pur en mode clair pour détacher du fond gris
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      elevation: isDark ? 0 : 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
              width: 1
          )
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          if (destination != null) {
            // Navigation DIRECTE sans animation
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, anim1, anim2) => destination,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        },
        leading: const Icon(Icons.location_on, color: Colors.redAccent),
        title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: isDark ? Colors.white : const Color(0xFF2D2D2D) // Texte foncé en mode clair
            )
        ),
        subtitle: Text(
            subtitle,
            style: TextStyle(
                color: isDark ? Colors.grey : Colors.black54,
                fontSize: 12
            )
        ),
        trailing: Icon(
            Icons.chevron_right,
            color: destination != null ? Colors.amber : Colors.white24
        ),
      ),
    );
  }
}