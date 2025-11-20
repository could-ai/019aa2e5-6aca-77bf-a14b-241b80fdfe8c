class Country {
  final String id;
  final String name;
  final String flagEmoji;
  final double gdp; // In Trillions USD
  final double gdpPerCapita; // In USD
  final double gdpGrowth; // Percentage
  final double inflationRate; // Percentage
  final String description;

  Country({
    required this.id,
    required this.name,
    required this.flagEmoji,
    required this.gdp,
    required this.gdpPerCapita,
    required this.gdpGrowth,
    required this.inflationRate,
    required this.description,
  });
}

class EconomicReport {
  final String id;
  final String title;
  final String author;
  final DateTime date;
  final String summary;
  final String content;
  final String category;

  EconomicReport({
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.summary,
    required this.content,
    required this.category,
  });
}
