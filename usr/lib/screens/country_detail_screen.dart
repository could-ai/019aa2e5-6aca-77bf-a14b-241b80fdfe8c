import 'package:flutter/material.dart';
import '../models/economic_model.dart';
import '../widgets/economic_widgets.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(country.name),
              background: Container(
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    country.flagEmoji,
                    style: const TextStyle(fontSize: 80),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Economic Overview',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    country.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Key Metrics',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.3,
                    children: [
                      EconomicCard(
                        title: 'Total GDP',
                        value: '\$${country.gdp}T',
                        subtitle: 'Nominal',
                        icon: Icons.account_balance,
                      ),
                      EconomicCard(
                        title: 'GDP Growth',
                        value: '${country.gdpGrowth}%',
                        subtitle: 'Annual',
                        valueColor: country.gdpGrowth >= 0 ? Colors.green : Colors.red,
                        icon: Icons.trending_up,
                      ),
                      EconomicCard(
                        title: 'Per Capita',
                        value: '\$${country.gdpPerCapita}',
                        subtitle: 'USD',
                        icon: Icons.person,
                      ),
                      EconomicCard(
                        title: 'Inflation',
                        value: '${country.inflationRate}%',
                        subtitle: 'CPI',
                        valueColor: country.inflationRate > 5 ? Colors.orange : Colors.blue,
                        icon: Icons.price_change,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Visual Analysis',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildSimpleChart(context, 'GDP Growth Trend', [2.1, 2.3, 1.8, country.gdpGrowth]),
                  const SizedBox(height: 16),
                  _buildSimpleChart(context, 'Inflation Trend', [4.5, 4.2, 3.9, country.inflationRate], color: Colors.orange),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleChart(BuildContext context, String title, List<double> data, {Color color = Colors.blue}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: data.map((value) {
                // Simple bar representation
                final height = (value.abs() * 20).clamp(10.0, 100.0);
                return Column(
                  children: [
                    Container(
                      width: 30,
                      height: height,
                      decoration: BoxDecoration(
                        color: value >= 0 ? color : Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(value.toString()),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Q1', style: TextStyle(fontSize: 10)),
                Text('Q2', style: TextStyle(fontSize: 10)),
                Text('Q3', style: TextStyle(fontSize: 10)),
                Text('Q4', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
