class UtilsFunctions {
  //function to get the weather animation based on the weather condition

  String getWeatherAnimation({required String condition}) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudyAnimationLottie.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainAnimationLottie.json";

      case "thunderstorm":
        return "assets/thunderAnimationLottie.json";

      case "clear":
        return "assets/sunnyAnimationLottie.json";

      default:
        return "assets/sunnyAnimationLottie.json";
    }
  }
}
