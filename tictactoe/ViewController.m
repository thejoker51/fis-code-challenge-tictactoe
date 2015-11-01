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
    titleLabel.text = @"Ready Player 1? Pick Your X";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gameOver {
    
    if (turns == 9) {
        titleLabel.text = @"Out of Turns! Game Over";
        return YES;
    }
    
    return NO;

}

-(BOOL)checkWinner:(NSString *)playerMark {
    
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

- (IBAction)buttonPress:(id)sender {
        
    UIButton *pressed = (UIButton *)sender;
    [pressed setEnabled:NO];
    
    switch (player) {
        case 1:
            [pressed setTitle:@"X" forState:UIControlStateNormal];
            player = 2;
            titleLabel.text = @"Ready Player 2? Pick Your O";
            
            break;
        case 2:
            [pressed setTitle:@"O" forState:UIControlStateNormal];
            player = 1;
            titleLabel.text = @"Ready Player 1? Pick Your X";
            
            break;
            
        default: exit(0);
    }
    
    // increment turns
    turns++;
    
    BOOL checkGameOver = [self gameOver];
    if (checkGameOver) {
        // if the game is over
    } else {
        NSString *playerMark = @"";
        if (player == 2) {
            playerMark = [playerMark stringByAppendingString:@"X"];
        } else {
            playerMark = [playerMark stringByAppendingString:@"O"];
        }
        
        BOOL winner = [self checkWinner:playerMark];
        
        if (winner && player == 2) {
            titleLabel.text = @"Congratuations player X, you win!";
        } else if (winner && player == 1) {
            titleLabel.text = @"Congratuations player O, you win!";
        }
        
    }
    
    
    
    }
@end
