void main()
{
  int number = 55 ;
  bool premier = false ; 
  for (int i=3; i<number ;i++){
    if(number%i == 0){
      premier = false ; 
      break; }
  }
  if (premier==true){print("nombre premier");} 
  else {print("nombre n'est pas premier");}
}