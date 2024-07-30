get_icon(String main_condition){
  main_condition= main_condition.toLowerCase();
  if (main_condition.contains('clear')||main_condition.contains('sun')){
    return 'sun.png';
  }
  else if(main_condition.contains('rain')||main_condition.contains('sleet')||
      main_condition.contains('drizzle')){
    return 'rain.png';
  }
  else if(main_condition.contains('snow')){
    return 'snow.png';
  }
  else if (main_condition.contains('storm') || (main_condition.contains('thunder'))){
    return 'thunder.png';
  }
  else{
    return 'cloudy.png';
  }

}