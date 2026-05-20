import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  int quantity = 1;

  void increase() => setState(() => quantity++);
  void decrease() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //  PREMIUM BOTTOM BAR
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
          ),
        ),
        child: Row(
          children: [
            // Counter Glass
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: decrease,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: increase,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Premium Button
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF59E0B), Color(0xFFFFD700)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          // FULL BACKGROUND
          Positioned.fill(
            child: Image.asset("assets/images/car1.jpg", fit: BoxFit.cover),
          ),

          //  DARK + VIGNETTE EFFECT
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                //  TOP BAR
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      _circleBtn(Icons.arrow_back_ios_new, () {
                        Navigator.pop(context);
                      }),
                      const Spacer(),
                      _circleBtn(Icons.favorite_border, () {}),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                //  HERO IMAGE CARD (GLASS STYLE)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    height: 420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.6),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        "assets/images/car1.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // TITLE
                const Text(
                  "BMW M3 Competition",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Luxury Performance Machine",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),

                const SizedBox(height: 14),

                //  SPECS GLASS CARDS
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    _GlassTile(icon: Icons.speed, text: "503 HP"),
                    _GlassTile(icon: Icons.bolt, text: "3.9s"),
                    _GlassTile(icon: Icons.settings, text: "8-Speed"),
                    _GlassTile(icon: Icons.local_gas_station, text: "Petrol"),
                  ],
                ),

                const SizedBox(height: 14),

                // DESCRIPTION
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "A high-performance luxury sports car designed for precision, "
                    "speed and comfort. Built for drivers who demand excellence.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class _GlassTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _GlassTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFF59E0B), size: 16),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
