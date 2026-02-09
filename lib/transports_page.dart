import 'package:flutter/material.dart';

class TransportsPage extends StatelessWidget {
  const TransportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Fond adaptatif
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Transports & Gares 🇧🇪",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: isDark ? Colors.black : Colors.blueGrey.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // SelectionArea permet la copie et la recherche internet sur tout le texte
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            // --- SECTION : SIGNIFICATIONS ---
            _buildHeader("Significations", isDark),
            _buildTransportCard(
              "STIB",
              "Société des Transports Intercommunaux de Bruxelles",
              "C'est l'opérateur public qui gère les métros, trams et bus à l'intérieur des 19 communes de la Région de Bruxelles-Capitale.",
              Icons.info_outline,
              isDark ? Colors.white : Colors.blueGrey.shade700,
              isDark,
            ),
            _buildTransportCard(
              "SNCB",
              "Société Nationale des Chemins de fer Belges",
              "Opérateur national. Elle relie Bruxelles à TOUTE la Belgique (Anvers, Gand, Bruges, Liège, Namur, etc.) ainsi qu'aux grandes villes internationales !",
              Icons.train,
              isDark ? Colors.blueGrey : Colors.blue.shade900,
              isDark,
            ),

            // --- SECTION : LE RÉSEAU URBAIN (STIB) ---
            _buildHeader("Le Réseau Urbain (STIB)", isDark),
            _buildTransportCard(
              "Le Métro",
              "4 lignes | 49,9 kilomètres",
              "Composé de 61 stations (37,5 km souterrains). Inauguré en 1976. C'est le moyen le plus rapide pour traverser la capitale.",
              Icons.subway,
              Colors.blue,
              isDark,
            ),
            _buildTransportCard(
              "Le Tram",
              "18 lignes de surface",
              "Un réseau très étendu. Les lignes 3 et 4 sont appelées 'Pré-métro' car elles circulent en souterrain dans le centre-ville.",
              Icons.tram,
              isDark ? Colors.redAccent : Colors.red.shade700,
              isDark,
            ),
            _buildTransportCard(
              "Le Bus",
              "67 lignes | 2 455 arrêts",
              "Assure la desserte fine de tous les quartiers bruxellois, complétant parfaitement le réseau ferré.",
              Icons.directions_bus,
              isDark ? Colors.orange : Colors.orange.shade800,
              isDark,
            ),

            // --- SECTION : LES GARES ---
            _buildHeader("Les Gares (National & International)", isDark),
            _buildGaresCard(isDark),

            // --- SECTION : MOBILITÉ DOUCE ---
            _buildHeader("Mobilité Douce", isDark),
            _buildTransportCard(
              "Vélos & Villo !",
              "Vélos en libre-service",
              "Plusieurs centaines de stations Villo ! permettent de louer un vélo 24h/24. La ville développe constamment ses pistes cyclables.",
              Icons.pedal_bike,
              isDark ? Colors.green : Colors.green.shade700,
              isDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
          title,
          style: TextStyle(
              color: isDark ? Colors.amber : Colors.amber.shade900,
              fontSize: 18,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }

  Widget _buildTransportCard(String title, String sub, String body, IconData icon, Color color, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 26),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text(sub, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(body,
              style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black54,
                  fontSize: 13,
                  height: 1.4
              )
          ),
        ],
      ),
    );
  }

  Widget _buildGaresCard(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
        ],
      ),
      child: Column(
        children: [
          _gareRow("Gare du Midi", "INTERNATIONAL : Eurostar (Londres, Paris, Amsterdam, Cologne).", Icons.public, isDark),
          Divider(color: isDark ? Colors.white10 : Colors.black12, height: 20),
          _gareRow("Gare Centrale", "NATIONAL : Accès direct à toute la Belgique (Bruges, Gand, Anvers).", Icons.map, isDark),
          Divider(color: isDark ? Colors.white10 : Colors.black12, height: 20),
          _gareRow("Gare du Nord", "Liaisons vers Amsterdam et le nord de l'Europe.", Icons.north, isDark),
          Divider(color: isDark ? Colors.white10 : Colors.black12, height: 20),
          _gareRow("Schuman & Luxembourg", "Quartier Européen : Trains directs vers Namur et le Luxembourg.", Icons.euro, isDark),
        ],
      ),
    );
  }

  Widget _gareRow(String name, String desc, IconData icon, bool isDark) {
    return Row(
      children: [
        Icon(icon, color: isDark ? Colors.blue : Colors.blue.shade700, size: 20),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  )
              ),
              Text(desc,
                  style: TextStyle(
                      color: isDark ? Colors.white54 : Colors.black54,
                      fontSize: 12
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}