import 'package:flutter/material.dart';
import '../models/economic_model.dart';

class EconomicCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color? valueColor;
  final IconData icon;

  const EconomicCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    this.valueColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.grey[600], size: 20),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: valueColor ?? Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryListItem extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryListItem({super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      child: ListTile(
        leading: Text(
          country.flagEmoji,
          style: const TextStyle(fontSize: 32),
        ),
        title: Text(
          country.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('GDP: \$${country.gdp}T • Growth: ${country.gdpGrowth}%'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
