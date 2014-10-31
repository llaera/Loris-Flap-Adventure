//
//  ViewControllerGame.h
//  Loris Flap Adventure
//
//  Created by Laera Loris on 01/06/2014.
//  Copyright (c) 2014 Laera Loris. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface ViewControllerGame : UIViewController

{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;

    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
    
    
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)GameOver;
-(void)Score;

@end
