import 'package:flutter/material.dart';

class LaekenPage extends StatelessWidget {
  const LaekenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs adaptatives
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Laeken : Guide Royal Complet"),
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SOMBRE ROYAL ---
              _buildDarkHeroHeader(isDark),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= 1. L'IMAGE DU HAUT =================
                    _buildImageCard('assets/16-Parc-de-Laeken-Royal-Parc-Tempat-Wisata-Favorit-dan-Terkenal-di-Brussel-930x620.jpg', "Le Domaine Royal de Laeken"),
                    const SizedBox(height: 10),

                    // ================= SECTION ACCÈS ET SAISONS =================
                    _buildSectionHeader("ACCÈS & SAISONS", Colors.green.shade700),
                    const SizedBox(height: 15),
                    _buildInfoBox(
                      "La marche depuis l'Atomium est vivement conseillée. Le sentier traverse le cœur forestier du parc.\n\n"
                          "🍂 EN AUTOMNE : Le parc se transforme en un océan de couleurs rouge et cuivre. C'est le meilleur moment pour les photographes.\n\n"
                          "🌸 AU PRINTEMPS : Les pelouses sont parsemées de fleurs sauvages et l'air est rempli du parfum des arbres en fleurs.",
                      Icons.directions_walk,
                      Colors.green.shade700,
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 35),

                    // ================= SECTION CHÂTEAU ROYAL =================
                    _buildSectionHeader("LE CHÂTEAU DE LAEKEN", Colors.blueGrey),
                    const SizedBox(height: 15),
                    _buildStatusBox("RÉSIDENCE PRIVÉE", "Visible uniquement à travers les grilles royales.", isDark),
                    const SizedBox(height: 10),
                    _buildHistoryBox(
                      "HISTOIRE : Construit au XVIIIe siècle, il est la demeure principale du Roi des Belges. "
                          "C'est ici que Napoléon a signé la déclaration de guerre contre la Russie en 1812. Un lieu chargé d'histoire mondiale.",
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 35),

                    // ================= SECTION SERRES ROYALES =================
                    _buildSectionHeader("LES SERRES ROYALES", Colors.redAccent.shade700),
                    const SizedBox(height: 15),
                    _buildStatusBox("ACCÈS LIMITÉ", "Ouvert au public uniquement quelques semaines par an (Avril/Mai).", isDark),
                    const SizedBox(height: 10),
                    _buildHistoryBox(
                      "HISTOIRE : Conçues par Alphonse Balat, elles représentent une prouesse technique de verre et de fer. "
                          "L'architecture imite une cité de cristal abritant des plantes exotiques ramenées par Léopold II.",
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 35),

                    // ================= SECTION TOUR JAPONAISE =================
                    _buildSectionHeader("LA TOUR JAPONAISE", Colors.orange.shade800),
                    const SizedBox(height: 15),
                    _buildStatusBox("EXTÉRIEUR UNIQUEMENT", "Fermé à l'intérieur pour des raisons de sécurité structurelle.", isDark),
                    const SizedBox(height: 10),
                    _buildHistoryBox(
                      "HISTOIRE : Cette pagode de 40m de haut a été construite sans un seul clou. "
                          "C’est un témoignage fascinant de l'engouement du XIXe siècle pour l'Extrême-Orient.",
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 35),

                    // ================= SECTION PAVILLON CHINOIS =================
                    _buildSectionHeader("LE PAVILLON CHINOIS", Colors.orange.shade800),
                    const SizedBox(height: 15),
                    _buildStatusBox("EXTÉRIEUR UNIQUEMENT", "Fermé définitivement au public à l'intérieur.", isDark),
                    const SizedBox(height: 10),
                    _buildHistoryBox(
                      "HISTOIRE : Ce kiosque en bois laqué rouge et or était destiné à être un restaurant de luxe. "
                          "Aujourd'hui, il reste un joyau décoratif que l'on admire pour ses boiseries importées directement de Chine.",
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 35),

                    // ================= SECTION FONTAINE DE NEPTUNE =================
                    _buildSectionHeader("FONTAINE DE NEPTUNE", Colors.blue.shade700),
                    const SizedBox(height: 15),
                    _buildInfoBox(
                      "Située entre le Pavillon et la Tour, cette fontaine est une réplique exacte de celle de Bologne. "
                          "Elle illustre le désir de Léopold II de transformer Laeken en un musée d'art mondial à ciel ouvert.",
                      Icons.waves,
                      Colors.blue.shade700,
                      isDark,
                      cardColor,
                    ),

                    const SizedBox(height: 30),
                    _buildQuickTip("CONSEIL : Prévoyez 1h30 pour faire le tour complet à pied sans vous presser.", isDark),
                    const SizedBox(height: 15),
                    _buildQuickTip("PHOTO : Les monuments sont plus beaux avec la lumière rasante de 17h00.", isDark),
                    const SizedBox(height: 15),
                    _buildPriceWarning("Accès au parc : Gratuit. Monuments : Visite visuelle uniquement.", isDark),

                    const SizedBox(height: 40),

                    // ================= SECTION GALERIE PHOTO (ORDRE CORRIGÉ) =================
                    _buildSectionHeader("GALERIE DU DOMAINE", Colors.amber.shade800),
                    const SizedBox(height: 20),

                    _buildImageCard('assets/laeken-park-brussels1-e1682966193238.jpg', "Le Château au printemps"),
                    _buildImageCard('assets/4408176583_1ebfd3938a.jpg', "Architecture des Serres"),
                    _buildImageCard('assets/1280px-La_tour_japonaise_a_Laeken.jpg', "La Tour Japonaise"),
                    _buildImageCard('assets/jardin-hiver-serres-royales-Laeken-bruxelles-mylittleroad-1170x781.jpg', "Intérieur du Jardin d'Hiver"),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET POUR LES IMAGES ---
  Widget _buildImageCard(String assetPath, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(assetPath, width: double.infinity, height: 200, fit: BoxFit.cover),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE CONSTRUCTION ---

  Widget _buildDarkHeroHeader(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F0F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF0F0F0F), Color(0xFF1B5E20)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.forest, color: Colors.greenAccent, size: 40),
          SizedBox(height: 15),
          Text(
            "DOMAINE DE LAEKEN",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.2
            ),
          ),
          SizedBox(height: 8),
          Text(
            "BALADE ROYALE SAISONNIÈRE",
            style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: color),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: color.withOpacity(0.3))),
      ],
    );
  }

  Widget _buildInfoBox(String text, IconData icon, Color color, bool isDark, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: isDark ? Colors.white70 : const Color(0xFF444444),
                  fontSize: 13,
                  height: 1.6
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBox(String status, String subtext, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(status, style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 4),
          Text(subtext, style: TextStyle(color: isDark ? Colors.white54 : Colors.black54, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildHistoryBox(String text, bool isDark, Color cardColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isDark ? Colors.white70 : const Color(0xFF555555),
            fontSize: 12,
            height: 1.6,
            fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget _buildQuickTip(String tip, bool isDark) {
    return Row(
      children: [
        const Icon(Icons.tips_and_updates, color: Colors.amber, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            tip,
            style: TextStyle(
                color: isDark ? Colors.white54 : Colors.black54,
                fontSize: 11,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceWarning(String text, bool isDark) {
    return Row(
      children: [
        Icon(Icons.info_outline, color: isDark ? Colors.white38 : Colors.black38, size: 16),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: isDark ? Colors.white38 : Colors.black38, fontSize: 11),
          ),
        ),
      ],
    );
  }
}