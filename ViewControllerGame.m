//
//  ViewControllerGame.m
//  Loris Flap Adventure
//
//  Created by Laera Loris on 01/06/2014.
//  Copyright (c) 2014 Laera Loris. All rights reserved.
//

#import "ViewControllerGame.h"

@interface ViewControllerGame ()

@end

@implementation ViewControllerGame

-(IBAction)StartGame:(id)sender{
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    StartGame.hidden = YES;
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    [self PlaceTunnels];
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.006 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];

}

-(void)BirdMoving{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    BirdFlight = BirdFlight - 5;
    if(BirdFlight < -15){
        BirdFlight = -15;
    }
    if (BirdFlight > 0){
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }

    if (BirdFlight < 0){
        Bird.image = [UIImage imageNamed:@"BirdD.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    BirdFlight = 20;
    
}

-(void)PlaceTunnels{
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 615;
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
}

-(void)TunnelMoving{
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if(TunnelTop.center.x < -40){
        [self PlaceTunnels];
    }
    
    if (TunnelTop.center.x == -32){
        [self Score];
        
    }

    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }

}

-(void)Score{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
}

-(void)GameOver{
    if (ScoreNumber > HighScoreNumber){
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
