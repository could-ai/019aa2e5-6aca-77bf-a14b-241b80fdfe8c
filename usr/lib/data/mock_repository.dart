import '../models/economic_model.dart';

class MockRepository {
  static List<Country> getCountries() {
    return [
      Country(
        id: '1',
        name: 'United States',
        flagEmoji: '🇺🇸',
        gdp: 26.95,
        gdpPerCapita: 80412,
        gdpGrowth: 2.1,
        inflationRate: 3.7,
        description: 'The United States has the world\'s largest economy by nominal GDP. It is a highly developed mixed economy with the world\'s second-largest purchasing power parity (PPP).',
      ),
      Country(
        id: '2',
        name: 'China',
        flagEmoji: '🇨🇳',
        gdp: 17.70,
        gdpPerCapita: 12541,
        gdpGrowth: 5.2,
        inflationRate: 0.1,
        description: 'China has the world\'s second-largest economy by nominal GDP and the largest by purchasing power parity (PPP). It is a socialist market economy.',
      ),
      Country(
        id: '3',
        name: 'Germany',
        flagEmoji: '🇩🇪',
        gdp: 4.43,
        gdpPerCapita: 52824,
        gdpGrowth: -0.3,
        inflationRate: 6.1,
        description: 'Germany is the largest economy in Europe. It is a social market economy with a highly skilled labor force, a large capital stock, and a high level of innovation.',
      ),
      Country(
        id: '4',
        name: 'Japan',
        flagEmoji: '🇯🇵',
        gdp: 4.23,
        gdpPerCapita: 33950,
        gdpGrowth: 1.3,
        inflationRate: 3.2,
        description: 'Japan has the world\'s fourth-largest economy by nominal GDP. It is a highly developed free-market economy.',
      ),
      Country(
        id: '5',
        name: 'India',
        flagEmoji: '🇮🇳',
        gdp: 3.73,
        gdpPerCapita: 2612,
        gdpGrowth: 6.3,
        inflationRate: 5.5,
        description: 'India is the world\'s fifth-largest economy by nominal GDP and the third-largest by purchasing power parity (PPP). It is a developing market economy.',
      ),
      Country(
        id: '6',
        name: 'United Kingdom',
        flagEmoji: '🇬🇧',
        gdp: 3.33,
        gdpPerCapita: 48912,
        gdpGrowth: 0.5,
        inflationRate: 6.7,
        description: 'The UK has a highly developed social market economy. It is the sixth-largest national economy in the world measured by nominal gross domestic product (GDP).',
      ),
    ];
  }

  static List<EconomicReport> getReports() {
    return [
      EconomicReport(
        id: '101',
        title: 'Global Economic Outlook 2024',
        author: 'Dr. Sarah Jenkins',
        date: DateTime(2024, 1, 15),
        category: 'Global Analysis',
        summary: 'An in-depth look at the projected growth rates and potential recession risks for major economies in 2024.',
        content: 'The global economy is approaching a soft landing, but risks remain. Inflation is cooling faster than expected in many regions, but geopolitical tensions could disrupt supply chains...',
      ),
      EconomicReport(
        id: '102',
        title: 'Tech Sector Impact on GDP',
        author: 'Michael Chen',
        date: DateTime(2024, 2, 10),
        category: 'Sector Review',
        summary: 'How the AI boom is reshaping economic productivity metrics across developed nations.',
        content: 'The rapid adoption of generative AI is expected to add trillions to the global economy over the next decade. This report analyzes the immediate impact on productivity figures in the US and China...',
      ),
      EconomicReport(
        id: '103',
        title: 'Emerging Markets: The Next Decade',
        author: 'Elena Rodriguez',
        date: DateTime(2024, 3, 5),
        category: 'Market Analysis',
        summary: 'Why investors are turning their eyes towards Southeast Asia and Latin America.',
        content: 'As growth slows in developed markets, emerging economies are presenting new opportunities. Structural reforms in India and Brazil are beginning to pay dividends...',
      ),
    ];
  }
}
