import 'package:oua_flutter_travel_gallery/components/onboarding_info.dart';

class OnboardingData{
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Travel Gallery",
      description: "Save photos in the travel gallery by categories.",
      image: "assets/images/girls.gif",
  ),
  OnboardingInfo(
      title: "Explore Photos",
      description: "Explore photos shared by other travellers",
      image: "assets/images/photo.gif",
  ),
  OnboardingInfo(
      title: "Find Location",
      description: "Find your location easily wherever you go.",
      image: "assets/images/current_loc.gif",
  ),

  ];
}