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
@synthesize player, titleLabel, turns, button1, button2, button3, button4, button5, button6, button7, button8, button9;

- (void)viewDidLoad {
    player = 1;
    titleLabel.text = @"Welcome! X's go first!";
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)gameOver:(NSString *)playerMark {
    
    BOOL winner = [self checkWinner:playerMark];
    
    if (winner && player == 2) {
        // if player one wins
        titleLabel.text = @"Congratuations player X, you win!";
    } else if (winner && player == 1) {
        // if player two wins
        titleLabel.text = @"Congratuations player O, you win!";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)checkWinner:(NSString *)playerMark {
    
    NSString *Marker = playerMark;
    
    if (turns == 9) {
        // CHECK TO SEE IF YOU'RE OUT OF TURNS
        titleLabel.text = @"Out of Turns! Game Over";
        return YES;
    } else if (
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
    
    NSString *playerMark = @"";
    NSString *titleText = @"";
    
    switch (player) {
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
    
    NSLog(@"playerMark: %@, titleText: %@", playerMark, titleText);
    NSLog(@"winner? %d", [self checkWinner:playerMark]);
    
    if (![self checkWinner:playerMark]) {
        switch (player) {
            case 1:
                titleLabel.text = titleText;
                break;
            case 2:
                titleLabel.text = titleText;
                break;
            default:exit(0);
        }
    } else {
        [self gameOver:playerMark];
    }
    
    // [self gameOver:playerMark]
    
    
}

- (IBAction)buttonPress:(id)sender {
        
    UIButton *pressed = (UIButton *)sender;
    [pressed setEnabled:NO];
    
    switch (player) {
        case 1:
            [pressed setTitle:@"X" forState:UIControlStateNormal];
            player = 2;
            break;
        case 2:
            [pressed setTitle:@"O" forState:UIControlStateNormal];
            player = 1;
            break;
            
        default: exit(0);
    }
    
    // increment turns
    turns++;
    [self Player];
    
}



@end
