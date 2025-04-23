const String tempString =
    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى';

String tempLongString({int length = 100}) {
  String text = '';

  for (int i = 1; i <= length; i++) {
    text += 'TEXT ';
  }
  return text;
}

String get tempImage {
  String image =
      'https://c4.wallpaperflare.com/wallpaper/150/648/844/moon-purple-4k-8k-wallpaper-preview.jpg';
  return image;
}


String get tempImage2 {
  String image =
      'https://i.pinimg.com/736x/6c/df/af/6cdfaf7b7890b598475c13a447251f96.jpg';
  return image;
}
