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
      'https://images.ctfassets.net/n2ifzifcqscw/3QRMlAcJFrYAEAbhziixZW/d4b9aa50215c5ea7a161b8a6b59f1974/hero-real-estate-facts-trends.jpeg';
  return image;
}

String get tempImage2 {
  String image =
      'https://i.pinimg.com/736x/6c/df/af/6cdfaf7b7890b598475c13a447251f96.jpg';
  return image;
}
