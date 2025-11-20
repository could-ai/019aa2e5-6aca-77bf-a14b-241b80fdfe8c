import 'package:flutter/material.dart';
import '../data/mock_repository.dart';
import '../models/economic_model.dart';
import '../widgets/economic_widgets.dart';
import 'country_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countries = MockRepository.getCountries();
    final reports = MockRepository.getReports();

    // Sort by GDP for top countries
    final topCountries = List<Country>.from(countries)
      ..sort((a, b) => b.gdp.compareTo(a.gdp));

    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoInsight'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Key Indicators (Global Avg)'),
            _buildKeyIndicators(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Top Economies'),
            _buildTopEconomiesList(context, topCountries.take(3).toList()),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Latest Analysis'),
            _buildReportsList(context, reports),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Global Economy',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Market Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHeaderStat('Global GDP', '\$105T', Icons.public),
                _buildHeaderStat('Avg Growth', '+2.9%', Icons.trending_up),
                _buildHeaderStat('Inflation', '5.8%', Icons.price_change),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildKeyIndicators() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(width: 160, child: EconomicCard(
            title: 'S&P 500',
            value: '4,783.45',
            subtitle: '+1.2% today',
            valueColor: Colors.green,
            icon: Icons.show_chart,
          )),
          const SizedBox(width: 16),
          const SizedBox(width: 160, child: EconomicCard(
            title: 'Gold',
            value: '\$2,045',
            subtitle: '-0.5% today',
            valueColor: Colors.red,
            icon: Icons.monetization_on,
          )),
          const SizedBox(width: 16),
          const SizedBox(width: 160, child: EconomicCard(
            title: 'Crude Oil',
            value: '\$78.23',
            subtitle: '+0.8% today',
            valueColor: Colors.green,
            icon: Icons.water_drop,
          )),
        ],
      ),
    );
  }

  Widget _buildTopEconomiesList(BuildContext context, List<Country> countries) {
    return Column(
      children: countries.map((country) => CountryListItem(
        country: country,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetailScreen(country: country),
            ),
          );
        },
      )).toList(),
    );
  }

  Widget _buildReportsList(BuildContext context, List<EconomicReport> reports) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              report.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  report.summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '${report.date.day}/${report.date.month}/${report.date.year}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        report.category,
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              // Navigate to report detail (could be implemented later)
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.5,
                  maxChildSize: 0.95,
                  expand: false,
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(report.title, style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 8),
                        Text('By ${report.author}', style: const TextStyle(color: Colors.grey)),
                        const Divider(height: 32),
                        Text(report.content, style: const TextStyle(fontSize: 16, height: 1.6)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
