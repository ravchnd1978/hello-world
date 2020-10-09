#https://thomasleeper.com/Rcourse/Tutorials/vectorindexing.html
#https://aosmith.rbind.io/2018/06/05/a-closer-look-at-replicate-and-purrr/

func_monty_python_single_run<-function()
{
  
  #The prize is behind this door - decided at the beginning of a game, not known to the user
  #There are three doors, pick 1 door at random, from a sample of 1,2,3
  door_prize<-sample(c(1:3),1)
  
  #The user picks a door, makes a choice
  #The user also randomly selects a number between 1 and 3. 
  #Note: 1/3rd of a time, he gets lucky and picks the door with the prize
  door_user_choice<- sample(c(1:3),1)
  
  #one third of the time, the user's choice of door and the prize(d) door will  be the same
  #in the above scenario, Monty will randomly pick either of the two non-prize(d) doors, randomly
  
  #Two thirds of the time, the user will pick a NON-prize(d)-door. Then, Monty (with his before-game knowledge of the prized door), WILL unlock the door without a prize.
  #That is, user picked a non-prize door, Monty revealed a door with no prize behind it, there are two doors now - unopened, one selected by the user, one containing the prize
  
  #Monty can never unlock the prized door 
  
  #Monty's pick cannot be the prized door or the user's door choice - that is, Monty's picks the door that definitely does NOT contain the prize
  door_monty_pick<-sample(c(1:3),1)[-c(door_prize,door_user_choice)]
  
  #Does switching result in a win?
  #If prized door and the user's choice door are one and the same, then switching results in losing - aka - winning=FALSE
  
  #If the user switches when he/she has picked the prized-door, then he/she loses
  #else, the user wins
  #Action is switching, result = TRUE(win the prize), FALSE(lose the prize)
  result<-ifelse(door_prize==door_user_choice,"LOSE","WIN")
  #result<-ifelse(door_prize==door_user_choice,TRUE,FALSE)
  
  return(result)
}

#if the user switched a 1000 times, how many times does he win?
replicate(1000,func_monty_python_single_run<-function())
