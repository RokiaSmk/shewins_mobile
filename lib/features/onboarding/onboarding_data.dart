class OnboardingData {
  final String title;
  final String description;
  final String image;

  const OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

const onboardingPages = [

  OnboardingData(
    title: "Bienvenue sur SheWins",
    description:
        "Prenez soin de votre santé féminine avec une application pensée pour vous.",
    image: "assets/images/onboarding_1.png",
  ),

  OnboardingData(
    title: "Suivez votre cycle",
    description:
        "Enregistrez votre cycle, vos symptômes, votre humeur et votre bien-être au quotidien.",
    image: "assets/images/onboarding_2.png",
  ),

  OnboardingData(
    title: "Des recommandations personnalisées",
    description:
        "Recevez des recommandations adaptées à votre profil pour mieux comprendre votre santé.",
    image: "assets/images/onboarding_3.png",
  ),
];