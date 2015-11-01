//
//  ViewController.m
//  tictactoe
//
//  Created by Alex Camara on 10/31/15.
//  Copyright © 2015 Acama. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize player, titleLabel, turns, button1, button2, button3, button4, button5, button6, button7, button8, button9, playAgain, totalTurns, allButtons;

- (void)viewDidLoad {
    
    // initialize player, reset button, and title text
    // total turns
    allButtons = [NSArray arrayWithObjects:button1, button2, button3, button4, button5, button6, button7, button8, button9, nil];

    player = 1;
    turns = 0;
    totalTurns = 9;
    playAgain.hidden = YES;
    titleLabel.text = @"Welcome! X's go first!";
    
    [super viewDidLoad];
}

- (void)gameOver:(NSUInteger)winCondition {
    
    // set all buttons to not enabled
    [self lockBoard];
    
    if (winCondition == 3) {
        // if turns have been exhausted
        titleLabel.text = @"Out of Turns! Game Over";
        playAgain.hidden = NO;
    }
    else if (winCondition == 2) {
        // if player one wins
        titleLabel.text = @"Congratuations player X, you win!";
        playAgain.hidden = NO;
    } else if (winCondition == 1) {
        // if player two wins
        titleLabel.text = @"Congratuations player O, you win!";
        playAgain.hidden = NO;
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)checkWinner:(NSString *)playerMark {
    
    // check win conditions
    NSString *Marker = playerMark;
    
    if (
        // CHECK HORIZONTALS
        ([button1.currentTitle isEqualToString:Marker] &&
          [button2.currentTitle isEqualToString:Marker] &&
          [button3.currentTitle isEqualToString:Marker] )
        ||
          ([button4.currentTitle isEqualToString:Marker] &&
           [button5.currentTitle isEqualToString:Marker] &&
           [button6.currentTitle isEqualToString:Marker])
        ||
          ([button7.currentTitle isEqualToString:Marker] &&
           [button8.currentTitle isEqualToString:Marker] &&
           [button9.currentTitle isEqualToString:Marker] )
        )
        {
        return YES;
    } else if (
        // CHECK VERTICALS
       ([button1.currentTitle isEqualToString:Marker] &&
        [button4.currentTitle isEqualToString:Marker] &&
        [button7.currentTitle isEqualToString:Marker] )
       ||
       ([button2.currentTitle isEqualToString:Marker] &&
        [button5.currentTitle isEqualToString:Marker] &&
        [button8.currentTitle isEqualToString:Marker])
       ||
       ([button3.currentTitle isEqualToString:Marker] &&
        [button6.currentTitle isEqualToString:Marker] &&
        [button9.currentTitle isEqualToString:Marker] )
               ) {
        return YES;
    } else if (
        // CHECK DIAGNOLS
       ([button1.currentTitle isEqualToString:Marker] &&
        [button5.currentTitle isEqualToString:Marker] &&
        [button9.currentTitle isEqualToString:Marker] )
       ||
       ([button3.currentTitle isEqualToString:Marker] &&
        [button5.currentTitle isEqualToString:Marker] &&
        [button7.currentTitle isEqualToString:Marker])
       )
    {
        return YES;
    }
    return NO;
}

- (void)Player {
    
    // initialize the variables for playerMark and titls
    NSString *playerMark = @"";
    NSString *titleText = @"";
    
    switch (player) {
        // set the variables based on player number
        case 1:
            playerMark = [playerMark stringByAppendingString:@"O"];
            titleText = [titleText stringByAppendingString:@"Ready Player 1? Pick Your X"];
            break;
        case 2:
            playerMark = [playerMark stringByAppendingString:@"X"];
            titleText = [titleText stringByAppendingString:@"Ready Player 2? Pick Your O"];
            break;
        default: exit(0);
    }
    
    BOOL isThereAWinner = [self checkWinner:playerMark];
    
    // if there isn't a winner and we totalTurn isn't
    // exhausted
    if (!isThereAWinner && turns < totalTurns) {
        
        // update the title text for the player's
        // current turn
        switch (player) {
            case 1:
                titleLabel.text = titleText;
                break;
            case 2:
                titleLabel.text = titleText;
                break;
            default:exit(0);
        }
    }
    else if (isThereAWinner) {
        // If there is a winner, send the player number
        [self gameOver:player];
    }
    else {
        // if there isn't a winner and totalTurns are up
        // send gameOver condition 3, out of turns
        [self gameOver:3];
    }
    
    // [self gameOver:playerMark]
    
    
}

- (IBAction)buttonPress:(id)sender {
    
    // create UIButton variable
    // set the sender to enabled:NO, so value
    // cannot be changed
    UIButton *pressed = (UIButton *)sender;
    [pressed setEnabled:NO];
    
    switch (player) {
        // if player is 1, they're x's, update button title
        // switch to player 2
        case 1:
            [pressed setTitle:@"X" forState:UIControlStateNormal];
            player = 2;
            break;
        // if player is 2, they're o's, update button title
        // switch to player 1
        case 2:
            [pressed setTitle:@"O" forState:UIControlStateNormal];
            player = 1;
            break;
            
        default: exit(0);
    }
    
    // increment turns
    turns++;
    // check player method to update board
    // check win conditions
    [self Player];
    
    
}

-(void)lockBoard {
    NSArray *buttons = [NSArray arrayWithArray:allButtons];
    
    for (UIButton *button in buttons) {
        [button setEnabled:NO];
    }
}



- (IBAction)playAgain:(id)sender {
    
    // build array of all button objects
    // got this on Stack Overflow. Good stuff!
    NSArray *buttons = [NSArray arrayWithArray:allButtons];
    
    
    // loop through array and update the title to blank
    // ste enabled to YES so that they're active
    for (UIButton *button in buttons) {
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setEnabled:YES];
    }
    
    // reload view to reset the game
    [self viewDidLoad];
    
    
}
@end
