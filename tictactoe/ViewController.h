//
//  ViewController.h
//  tictactoe
//
//  Created by Alex Camara on 10/31/15.
//  Copyright © 2015 Acama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property int player;
@property int turns;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *playAgain;

- (IBAction)buttonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
- (IBAction)playAgain:(id)sender;

@end

