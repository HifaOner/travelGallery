import 'package:oua_flutter_travel_gallery/components/onboarding_info.dart';

class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Explore Photos",
      description: "Explore photos shared by other travellers",
      image: "assets/images/photo.gif",
    ),
    OnboardingInfo(
      title: "Save Gallery",
      description: "Save your photos to the travel gallery by categories.",
      image: "assets/images/girls.gif",
    ),
    OnboardingInfo(
      title: "Find Location",
      description: "Find your location easily wherever you go.",
      image: "assets/images/current_loc.gif",
    ),
  ];
}
