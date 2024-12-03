
class Localization {
  static String getLocationLabel(String locale) {
    switch (locale) {
      case 'en':
        return 'Location';
      case 'ar':
        return 'موقع';
      // Add more languages as needed
      default:
        return 'Location';
    }
  }
}
