import 'package:flutter/material.dart';

class SpecialitesPage extends StatefulWidget {
  const SpecialitesPage({super.key});

  @override
  State<SpecialitesPage> createState() => _SpecialitesPageState();
}

class _SpecialitesPageState extends State<SpecialitesPage> {
  String currentFilter = "tous";

  final List<Map<String, dynamic>> items = [
    // --- 20 SALÉS ---
    {"name": "Frites Belges", "desc": "Cuites au gras de bœuf.", "tip": "Prenez la sauce Andalouse.", "icon": Icons.fastfood, "color": Colors.amber, "type": "salé"},
    {"name": "Stoemp Carottes", "desc": "Purée de légumes au beurre.", "tip": "Avec une saucisse de poulet.", "icon": Icons.flatware, "color": Colors.orange, "type": "salé"},
    {"name": "Waterzooï Poulet", "desc": "Poulet à la crème de Gand.", "tip": "Plat très doux et onctueux.", "icon": Icons.soup_kitchen, "color": Colors.blue, "type": "salé"},
    {"name": "Boulettes Tomate", "desc": "Bœuf sauce tomate basilic.", "tip": "Un classique des familles.", "icon": Icons.restaurant, "color": Colors.red, "type": "salé"},
    {"name": "Carbonnades Bœuf", "desc": "Mijoté au sirop de Liège.", "tip": "Sauce brune sans alcool.", "icon": Icons.outdoor_grill, "color": Colors.brown, "type": "salé"},
    {"name": "Chicon au Gratin", "desc": "Endives et blanc de poulet.", "tip": "Version savoureuse sans porc.", "icon": Icons.layers, "color": Colors.yellow, "type": "salé"},
    {"name": "Oiseau sans tête", "desc": "Roulade de bœuf farcie.", "tip": "Mijoté longuement en sauce.", "icon": Icons.lunch_dining, "color": Colors.brown, "type": "salé"},
    {"name": "Croquette Crevettes", "desc": "Farce onctueuse aux crevettes.", "tip": "Servi avec du persil frit.", "icon": Icons.set_meal, "color": Colors.pink, "type": "salé"},
    {"name": "Filet Américain", "desc": "Bœuf haché frais préparé.", "tip": "Se mange avec des frites.", "icon": Icons.restaurant_menu, "color": Colors.redAccent, "type": "salé"},
    {"name": "Soupe aux Pois", "desc": "Soupe épaisse traditionnelle.", "tip": "Très nourrissant l'hiver.", "icon": Icons.soup_kitchen, "color": Colors.green, "type": "salé"},
    {"name": "Choux de Bruxelles", "desc": "Rôtis avec un peu de miel.", "tip": "Le légume phare de la capitale.", "icon": Icons.eco, "color": Colors.greenAccent, "type": "salé"},
    {"name": "Gratin Dauphinois", "desc": "Pommes de terre à la crème.", "tip": "Accompagnement parfait.", "icon": Icons.grid_on, "color": Colors.orangeAccent, "type": "salé"},
    {"name": "Asperges à la Flamande", "desc": "Asperges, œufs et beurre.", "tip": "Spécialité du printemps.", "icon": Icons.agriculture, "color": isGreenDark, "type": "salé"},
    {"name": "Purée de Panais", "desc": "Légume oublié remis au goût.", "tip": "Goût légèrement sucré.", "icon": Icons.waves, "color": Colors.blueGrey, "type": "salé"},
    {"name": "Pistolet Fourré", "desc": "Petit pain rond typique.", "tip": "Idéal pour un déjeuner rapide.", "icon": Icons.bakery_dining, "color": Colors.orange, "type": "salé"},
    {"name": "Potage poireaux", "desc": "Soupe onctueuse maison.", "tip": "Simple et efficace.", "icon": Icons.soup_kitchen, "color": Colors.lightGreen, "type": "salé"},
    {"name": "Riz au Curry Poulet", "desc": "Mélange belge-oriental.", "tip": "Très populaire en Belgique.", "icon": Icons.rice_bowl, "color": Colors.yellow, "type": "salé"},
    {"name": "Quiche aux Poireaux", "desc": "Tarte salée sans porc.", "tip": "Fondante et croustillante.", "icon": Icons.pie_chart, "color": Colors.amberAccent, "type": "salé"},
    {"name": "Croque-Monsieur Poulet", "desc": "Pain toasté et blanc de poulet.", "tip": "Rapide et chaud.", "icon": Icons.vaping_rooms, "color": Colors.orange, "type": "salé"},
    {"name": "Vol-au-vent", "desc": "Bouchée à la reine au poulet.", "tip": "Servi avec des frites.", "icon": Icons.blur_on, "color": Colors.blueGrey, "type": "salé"},

    // --- 20 SUCRÉS ---
    {"name": "Gaufre de Liège", "desc": "Pâte au sucre perlé.", "tip": "Se mange à la main.", "icon": Icons.bakery_dining, "color": Colors.pinkAccent, "type": "sucré"},
    {"name": "Gaufre Bruxelles", "desc": "Légère et rectangulaire.", "tip": "Avec sucre glace.", "icon": Icons.grid_view, "color": Colors.orangeAccent, "type": "sucré"},
    {"name": "Le Misérable", "desc": "Biscuit amande et crème.", "tip": "Pâtisserie de luxe.", "icon": Icons.cake, "color": Colors.brown, "type": "sucré"},
    {"name": "Cuberdons", "desc": "Bonbons à la framboise.", "tip": "Cœur très coulant.", "icon": Icons.category, "color": Colors.deepPurple, "type": "sucré"},
    {"name": "Tarte au Sucre", "desc": "Cassonade et beurre.", "tip": "La spécialité wallonne.", "icon": Icons.circle, "color": Colors.orange, "type": "sucré"},
    {"name": "Spéculoos", "desc": "Biscuit aux épices.", "tip": "Indétrônable avec le café.", "icon": Icons.cookie, "color": Colors.brown, "type": "sucré"},
    {"name": "Cramique", "desc": "Brioche au sucre.", "tip": "Parfait au réveil.", "icon": Icons.breakfast_dining, "color": Colors.orange, "type": "sucré"},
    {"name": "Craquelin", "desc": "Pain au sucre perlé.", "tip": "Le cousin du cramique.", "icon": Icons.breakfast_dining, "color": Colors.amber, "type": "sucré"},
    {"name": "Dame Blanche", "desc": "Glace vanille, chocolat chaud.", "tip": "Le dessert des restos.", "icon": Icons.icecream, "color": Colors.blueGrey, "type": "sucré"},
    {"name": "Tarte au Riz", "desc": "Flan au riz cuit au four.", "tip": "Spécialité de Verviers.", "icon": Icons.circle_notifications, "color": Colors.yellow, "type": "sucré"},
    {"name": "Javanais", "desc": "Gâteau café et chocolat.", "tip": "Fines couches de plaisir.", "icon": Icons.layers, "color": Colors.brown, "type": "sucré"},
    {"name": "Boule de Berlin", "desc": "Beignet fourré crème.", "tip": "Très gourmand.", "icon": Icons.circle, "color": Colors.orange, "type": "sucré"},
    {"name": "Éclair Chocolat", "desc": "Pâte à choux et crème.", "tip": "Chocolat belge pur.", "icon": Icons.reorder, "color": Colors.brown, "type": "sucré"},
    {"name": "Merveilleux", "desc": "Meringue et crème chantilly.", "tip": "Léger comme un nuage.", "icon": Icons.cloud, "color": Colors.blueGrey, "type": "sucré"},
    {"name": "Pain à la grecque", "desc": "Biscuit sec au sucre.", "tip": "Spécialité bruxelloise.", "icon": Icons.linear_scale, "color": Colors.brown, "type": "sucré"},
    {"name": "Tarte aux pommes", "desc": "Pommes locales caramélisées.", "tip": "Un classique indémodable.", "icon": Icons.pie_chart, "color": Colors.green, "type": "sucré"},
    {"name": "Frangipane", "desc": "Tartelette aux amandes.", "tip": "Goût intense d'amande.", "icon": Icons.lens, "color": Colors.orangeAccent, "type": "sucré"},
    {"name": "Baisers de Malmedy", "desc": "Meringues accolées.", "tip": "Fond dans la bouche.", "icon": Icons.reddit, "color": Colors.pink, "type": "sucré"},
    {"name": "Massepain", "desc": "Pâte d'amande douce.", "tip": "Souvent sculpté.", "icon": Icons.auto_awesome, "color": Colors.pinkAccent, "type": "sucré"},
    {"name": "Glace Spéculoos", "desc": "Crème glacée artisanale.", "tip": "Le goût belge en froid.", "icon": Icons.icecream, "color": Colors.brown, "type": "sucré"},

    // --- 9 BOISSONS ---
    {"name": "Jus de Pomme Pur", "desc": "Pressé d'Aubel.", "tip": "100% fruit frais.", "icon": Icons.local_drink, "color": Colors.green, "type": "boisson"},
    {"name": "Jus de Poire", "desc": "Doux et velouté.", "tip": "Vergers locaux.", "icon": Icons.wine_bar, "color": Colors.lightGreenAccent, "type": "boisson"},
    {"name": "Sirop de Menthe", "desc": "Fait maison, très frais.", "tip": "Avec des glaçons.", "icon": Icons.water_drop, "color": Colors.tealAccent, "type": "boisson"},
    {"name": "Sirop de Grenadine", "desc": "Sucre et fruits rouges.", "tip": "Préféré des enfants.", "icon": Icons.water_drop, "color": Colors.redAccent, "type": "boisson"},
    {"name": "Chocolat Chaud", "desc": "Copeaux fondus.", "tip": "Vrai chocolat belge.", "icon": Icons.coffee_maker, "color": Colors.brown, "type": "boisson"},
    {"name": "Eau de Spa", "desc": "Eau minérale naturelle.", "tip": "La pureté des Ardennes.", "icon": Icons.opacity, "color": Colors.lightBlueAccent, "type": "boisson"},
    {"name": "Limonade Citron", "desc": "Pétillante et acide.", "tip": "Désaltérante.", "icon": Icons.settings_input_antenna, "color": Colors.yellow, "type": "boisson"},
    {"name": "Thé à la Menthe", "desc": "Feuilles fraîches.", "tip": "Infusion chaude.", "icon": Icons.emoji_food_beverage, "color": Colors.green, "type": "boisson"},
    {"name": "Cécémel", "desc": "Lait chocolaté célèbre.", "tip": "Froid ou chaud.", "icon": Icons.emoji_food_beverage, "color": Colors.orange, "type": "boisson"},
  ];

  static const Color isGreenDark = Colors.green;

  void _showFilterMenu(bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption("Salé", Icons.restaurant, "salé", isDark),
              _buildFilterOption("Sucré", Icons.bakery_dining, "sucré", isDark),
              _buildFilterOption("Boisson", Icons.local_drink, "boisson", isDark),
              _buildFilterOption("Tous", Icons.all_inclusive, "tous", isDark),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String label, IconData icon, String filterValue, bool isDark) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(label, style: TextStyle(color: isDark ? Colors.white : Colors.black87)),
      onTap: () {
        setState(() => currentFilter = filterValue);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredItems = items.where((item) {
      if (currentFilter == "tous") return true;
      return item['type'] == currentFilter;
    }).toList();

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Spécialités Belges", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: isDark ? Colors.black : Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: SelectionArea( // Active le copier-coller et la recherche internet
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showFilterMenu(isDark),
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber.withOpacity(0.5)),
                  boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FILTRE : ${currentFilter.toUpperCase()}",
                        style: TextStyle(color: isDark ? Colors.amber : Colors.amber.shade900, fontWeight: FontWeight.bold)),
                    Icon(Icons.filter_list, color: isDark ? Colors.amber : Colors.amber.shade900),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) => _buildCard(filteredItems[index], isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> item, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5, offset: const Offset(0, 2))],
        border: isDark ? null : Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(item['icon'], color: item['color'], size: 22),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(item['name'],
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.bold))
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(item['type'].toUpperCase(),
                    style: TextStyle(color: item['color'], fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(item['desc'], style: TextStyle(color: isDark ? Colors.white60 : Colors.black54, fontSize: 13)),
          const SizedBox(height: 8),
          Text("💡 ${item['tip']}",
              style: TextStyle(
                color: isDark ? Colors.amber : Colors.amber.shade800,
                fontSize: 11,
                fontStyle: FontStyle.italic,
                fontWeight: isDark ? FontWeight.normal : FontWeight.w500,
              )),
        ],
      ),
    );
  }
}