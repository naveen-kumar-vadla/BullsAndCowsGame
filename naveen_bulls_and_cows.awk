#-------------------------------------------Function to set the secret number-------------------------------------#
function set_secret_number(){
  flag=0
  no_of_digits=0
  for(i=1;i<=5;i++){
    random_number=int(1+rand()*9)
    is_number_there(i)
    if(flag==0){
      numbers[i]=random_number
      no_of_digits+=1
    }
  }
}
#--------------------------------Function to check repeated numbers in secret number------------------------------#
function is_number_there(r){
  for(j=0;j<r;j++){
    if(numbers[j]==random_number)
      flag+=1
  }
}
#-----------------------------------------Function to print game instruction--------------------------------------#
function about_game(no_of_digits,chances){
  print "-----------------------------------------------------------------------------------------------------------------------"
  print "--------------------------------------------WELCOME TO BULLS AND COWS GAME---------------------------------------------"
  print "-----------------------------------------------------------------------------------------------------------------------\n\n"
  print "-----------------------------------------------------------------------------------------------------------------------"
  print"------------------------------------------------------ABOUT GAME-------------------------------------------------------"
  print "-----------------------------------------------------------------------------------------------------------------------"
  print "A secret number is set randomly\nYou Have to guess that "no_of_digits" digit number in "chances" chances\nThe digits must be all different. For every chance it gives you the number of matches. If the matching digits are in their right positions, they are bulls, if in different positions, they are cows. \n\nExample:\n-->Secret number: 5678\n-->Users entry: 8652\n-->Answer: 1 bull and 2 cows. (The bull is "6", the cows are "5" and "8".)" 
  print "-----------------------------------------------------------------------------------------------------------------------"
}
#-----------------------------------------Function to get input from user-----------------------------------------#
function get_input(no_of_digits){
  print "\nEnter a "no_of_digits" digits number and Try your luck\npress q if you want to quit"
  getline input
  if(input=="q")
    print_answer(numbers,no_of_digits)
  extract_and_assign(no_of_digits,input)
}
#-----------------------------------Function to extract digits from user input------------------------------------#
function extract_and_assign(no_of_digits,input){
  for(i=no_of_digits;i>=1;i--){
    user_input[i]=input%10
    input=int(input/10)
  }
}
#-----------------------------------Function to check the no of matches in user input-----------------------------#
function check_bulls_cows(chances,numbers,user_input){
  bulls=0
  cows=0
  for(i=1;i<=no_of_digits;i++){
    for(j=1;j<=no_of_digits;j++){
      if(numbers[i]==user_input[j]){
        if(i==j){
          bulls++
        }
        else{
          cows++
        }
      }
    }
  }
}

#---------------------------------------------------Function for game---------------------------------------------#
function Game(no_of_digits,numbers){
  get_input(no_of_digits)
  check_bulls_cows(chances,numbers,user_input)
  print bulls" bulls and "cows" cows"
  chances--
  print "Remaining Chances="chances
  if(bulls==no_of_digits){
   print "Congrats you guessed correctly"
   exit 
  }
  else if(chances==0){
    print_answer(numbers,no_of_digits)
  }
  else{
    Game(no_of_digits,numbers)
  }
}
#-----------------------------------------Function to print the correct answer------------------------------------#
function print_answer(numbers,no_of_digits){
  print "\nSorry the Correct Answer is"
  for(i=1;i<=no_of_digits;i++){
    printf numbers[i]
  }
  print "\nBetter luck next time"
  exit
}
#-------------------------------------------------Main Function---------------------------------------------------#
BEGIN{
  srand()
  about_game(no_of_digits,chances)
  while(no_of_digits<3){
    set_secret_number()
  }
  chances=(no_of_digits*no_of_digits)
  print "No. of chances = "chances
  Game(no_of_digits,numbers)
}
