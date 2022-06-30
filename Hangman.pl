# Submitted By - 
#     Name         - Rohan Khanna
#     Entry Number - 2020CSB1117
#     Dated        - Feb '19 2022   
#     Indian Institute of Technology Ropar
#     CS202 Course
#     Hangman in Perl Lab 4

#!usr/local/bin/perl
@sampleList = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment"); 
@wordStatus = (); #It is the word player is making , Initially all dashes

&main(); # Called main method
$guessesLeft; # To eep track of number of guesses left
@myGuesses = (); # Will store the words I guessed
$guessLetter = ''; # It is current letter I guessed, it will be given by user as input
$completed = 0; # If win situation occurs, it becomes 1
sub main{
    # Initializing required values
    $guessesLeft = 6;
    $listSize = $#sampleList;
    @myGuesses = ();
    $correctWord = @sampleList[int(rand($listSize)) - 1]; 
    # $correctWord = "abc"; // Done for testing purpose
    $wordSize = length($correctWord);
    $completed = 0;
    @wordStatus = ();
    print "\nWelcome to Hangman game made by Rohan Khanna\n\n";
    print "To check working of code, correct word is : $correctWord \n";

    # Initialising wordStatus to all dashes i.e. '-'
    for($i = 0 ; $i < $wordSize ; $i++){
        push (@wordStatus, "-");
    }
    &displayHangman();
    print "Now, here is your word status : ";
    print "@wordStatus \n";
    while((!($completed)) && ($guessesLeft!=0))
    {
        print "Guesses so far: @myGuesses\n";

        &guessMaker($correctWord);
        # Since guessLetter is globally defined, no need to take it as a return value from guessMaker.
        # checkStatus is called to check correctness of input  
        $index = &checkStatus($correctWord, $guessLetter);
        if($index == -1){
            # guessed word Not found in correctWord
            $guessesLeft--;
            push (@myGuesses, $guessLetter);
            &displayHangman();
            print "Bad guess - you have $guessesLeft guess left.\n";
            print "WORD STATUS : @wordStatus \n" ;
        }else{
            # guessed word Found in correctWord 
            &displayHangman();
            print "Good guess - you have $guessesLeft guess left.\n";
            push (@myGuesses, $guessLetter);
            $i = 0 ;
            # Below I scanned for each character in correctWord
            # This is to update wordStatus now
            foreach $char (split('', $correctWord)) {
                if($char eq $guessLetter){
                    $wordStatus[$i] = $guessLetter ;
                }
                $i++;
            }
            print "WORD STATUS : @wordStatus \n";
        }
        # Checking if user completed the full guess
        $completed = &checkWin($correctWord);
        # When completed becomes 1, while loop gets false condition
    }

    if($guessesLeft == 0){
        print "So sorry, you lost it 🙁\n" ;
        print "The correct word is $correctWord \n";
    }else{
        print "Nailed it !! , Correctly guessed 🥳\n";
        print "The correct word is $correctWord \n";
    }
    &resetGameInput();
    
}

sub guessMaker{
    ($word) = @_ ;
    print "Make a guess: ";
    $input = <STDIN>;
    chomp $input; # To remove \n from input taken
    $guess = lc $input ; # To make it lower case, as we dont want program to be case-sensitive 
    
    # Traversing over past guessed words to find current guess
    my $flag = 0 ;
    if(length($guess) > 1 || ($guess eq " ") || ($guess eq "")){
            # We only need a single letter as input
            print "Please enter one letter only.\n";
            &guessMaker(); # Retaking input
            return;
    }
    for ($i = 0; $i <= $#myGuesses ; $i++)
    {
        if($myGuesses[$i] eq $guess){
            print "You already guessed '$guess', so try again \n";
            &guessMaker(); # Retaking input
            $flag = 1;
            last;
        }else{
            next;
        }
    }
    if($flag == 0){
        # Guesses word is valid (Can't say about correctness yet)
        $guessLetter = $guess ;
    }
    
}

# Check win
sub checkWin{
    ($correct) = @_ ;
    $char ;
    # Iterating over correct word
    for($i = 0 ; $i< length($correct); $i++){
        $char = substr($correct, $i, 1); # substr method to get char at a particular index
        if ($char ne $wordStatus [$i]) {
            return 0;
        }
    }
    return 1;

}

sub checkStatus{
    ($word, $guessed) = @_;
    return index($word, $guessed);  
    # index returns -1 if guessed is not present word, else it returns the index where it is [resent] 
}

# Display Hangman
sub displayHangman{
    # Display hangMan on the basis of guessesLeft
    $g = $guessesLeft ;
    if($g == 0){
        &hangmanDisplay0Left();
    } elsif($g == 1){
        &hangmanDisplay1Left();
    } elsif($g == 2){
        &hangmanDisplay2Left();
    } elsif($g == 3){
        &hangmanDisplay3Left();
    } elsif($g == 4){
        &hangmanDisplay4Left();
    } elsif($g == 5){
        &hangmanDisplay5Left();
    } elsif($g == 6){
        &hangmanDisplay6Left();
    } else{
        print "Something went wrong :( ";
        exit 0 ;
    }
}
sub hangmanDisplay0Left{
    # dead
    print ".____________\n";
    print "|     |\n";
    print "|     x\n";
    print "|    \\|/\n";
    print "|    / \\\n";
    print "|\n";
}
sub hangmanDisplay1Left{
    # 1 guess left only
    print ".____________\n";
    print "|     |\n";
    print "|     O\n";
    print "|    \\|/\n";
    print "|    /\n";
    print "|\n";
}
sub hangmanDisplay2Left{
    # 2 guess left only
    print ".____________\n";
    print "|     |\n";
    print "|     O\n";
    print "|    \\|/\n";
    print "|\n";
    print "|\n";
}
sub hangmanDisplay3Left{
    # 3 guesses left
    print ".____________\n";
    print "|     |\n";
    print "|     O\n";
    print "|    \\|\n";
    print "|\n";
    print "|\n";
}
sub hangmanDisplay4Left{
    # 4 guesses left
    print ".____________\n";
    print "|     |\n";
    print "|     O\n";
    print "|     |\n";
    print "|\n";
    print "|\n";
}
sub hangmanDisplay5Left{
    # 5 guesses left
    print ".____________\n";
    print "|     |\n";
    print "|     O\n";
    print "|\n";
    print "|\n";
    print "|\n";
}
sub hangmanDisplay6Left{
    # 6 guesses left
    print ".____________\n";
    print "|     |\n";
    print "|\n";
    print "|\n";
    print "|\n";
    print "|\n";
}

# Reset Game
sub resetGameInput{
    # Reset game or not ?
    print "Wanna play again (y/n)?- ";
    $response = <STDIN>;
    chomp $response;
    if($response eq 'y'){
        &main();
    }
    elsif ($response eq 'n'){
        exit;
    }
    else{
        print "Error : Please respond as y or n\n";
        &resetGameInput();
    }
}