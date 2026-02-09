import 'package:flutter/material.dart';

class CinquantenairePage extends StatelessWidget {
  const CinquantenairePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Le Cinquantenaire 🇧🇪"),
      ),
      // SelectionArea permet de copier et d'avoir l'option recherche internet sur tout le texte
      body: SelectionArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- DESCRIPTION DÉTAILLÉE ---
              _buildSectionTitle("L'Histoire du Lieu", Icons.history_edu),
              Text(
                "Construit en 1880 pour célébrer les 50 ans de la Belgique sous le règne de Léopold II. "
                    "L'arche majestueuse (Arc de Triomphe) est surmontée d'un quadrige en bronze "
                    "représentant le Brabant élevant le drapeau national. C'est un chef-d'œuvre de style néoclassique "
                    "entouré de jardins symétriques à la française.",
                style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: isDark ? Colors.white70 : const Color(0xFF444444)
                ),
              ),

              const SizedBox(height: 25),

              // --- TABLEAU 1 : PLANIFICATION & SAISONS ---
              _buildSectionTitle("Planification & Météo 🗓️", Icons.event_note),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(
                    color: isDark ? Colors.white10 : Colors.black12,
                    width: 1,
                    borderRadius: BorderRadius.circular(10)
                ),
                columnWidths: const {0: FlexColumnWidth(1.2), 1: FlexColumnWidth(2)},
                children: [
                  _buildTableRow("Saisons Top", "Printemps (avril) & Automne (octobre)", Colors.greenAccent, isDark),
                  _buildTableRow("À Éviter (Hiver)", "Très venteux, froid humide, ciel gris plat", Colors.blueAccent, isDark),
                  _buildTableRow("À Éviter (Été)", "Chaleur étouffante sur le gravier, pas d'ombre", Colors.redAccent, isDark),
                  _buildTableRow("Heure Éviter", "12h-14h (Surtout en Été : lumière écrasante)", Colors.redAccent, isDark),
                ],
              ),

              const SizedBox(height: 25),

              // --- TABLEAU 2 : DÉTAILS PHOTO PAR SAISON ---
              _buildSectionTitle("Conseils Photo Experts 📸", Icons.camera_alt),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(
                    color: isDark ? Colors.white10 : Colors.black12,
                    width: 1,
                    borderRadius: BorderRadius.circular(10)
                ),
                children: [
                  _buildTableRow("Printemps", "18h30-20h : Fleurs roses et lumière douce", Colors.pinkAccent, isDark),
                  _buildTableRow("Été", "07h00 (Seul au monde) ou 21h (Heure bleue)", Colors.lightBlueAccent, isDark),
                  _buildTableRow("Automne", "16h30-18h : Arbres dorés, lumière rasante", Colors.orangeAccent, isDark),
                  _buildTableRow("Hiver", "10h ou 15h30 : Contrastes forts, ciel dramatique", isDark ? Colors.white70 : Colors.black54, isDark),
                ],
              ),

              const SizedBox(height: 35),

              // --- ITINÉRAIRE PRÉCIS ET DÉTAILLÉ ---
              _buildSectionTitle("Itinéraire à Pied 🚶‍♂️", Icons.map),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // Blanc pur en mode clair, gris foncé en mode sombre
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.2)),
                  boxShadow: isDark ? [] : [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  children: [
                    _buildMapStep("Commission (Bâtiment Berlaymont)", "L'icône en forme de croix.", Icons.business, Colors.blue, isDark),
                    _buildWalkingTime("8 min à pied"),
                    _buildMapStep("LE CINQUANTENAIRE", "L'Arche et les jardins royaux.", Icons.account_balance, Colors.amber, isDark),
                    _buildWalkingTime("10 min à pied"),
                    _buildMapStep("Parc Léopold", "Parlement Européen & Étangs.", Icons.park, Colors.green, isDark),
                    // Détail Mur de Berlin
                    Padding(
                      padding: const EdgeInsets.only(left: 45, top: 8),
                      child: Row(
                        children: const [
                          Icon(Icons.subdirectory_arrow_right, color: Colors.grey, size: 20),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Mur de Berlin 🇩🇪 : Segment authentique situé près du Parlement.",
                              style: TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // --- ALERTE FINALE ---
              _buildWarningBox(
                  "DÉTAIL ÉTÉ : Entre 12h et 14h, la place réfléchit toute la chaleur du soleil. "
                      "C'est une fournaise sans aucun coin d'ombre sur l'esplanade centrale. "
                      "Portez une casquette et prévoyez de l'eau si vous traversez à cette heure-là.",
                  isDark
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGETS DE MISE EN FORME ---

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 24),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber)),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, Color color, bool isDark) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
              value,
              style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white : const Color(0xFF333333)
              )
          ),
        ),
      ],
    );
  }

  Widget _buildMapStep(String title, String subtitle, IconData icon, Color color, bool isDark) {
    return Row(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1A1A1A)
                  )
              ),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWalkingTime(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          const Icon(Icons.more_vert, color: Colors.grey),
          const SizedBox(width: 25),
          const Icon(Icons.directions_walk, size: 16, color: Colors.grey),
          const SizedBox(width: 5),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildWarningBox(String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
          const SizedBox(width: 15),
          Expanded(
              child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: isDark ? Colors.white : const Color(0xFF442222)
                  )
              )
          ),
        ],
      ),
    );
  }
}