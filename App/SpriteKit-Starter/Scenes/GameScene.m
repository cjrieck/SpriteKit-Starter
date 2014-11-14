//
//  GameScene.m
//  SpriteKit-Starter
//
//  Created by Clayton Rieck on 11/14/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "GameScene.h"

@interface GameScene ()

@property (strong, nonatomic) SKSpriteNode *heroSprite;

@property (assign, nonatomic) NSTimeInterval lastSpawnInterval;
@property (assign, nonatomic) NSTimeInterval lastUpdateInterval;

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if ( self ) {
        self.backgroundColor = [UIColor whiteColor];
        
        _heroSprite = [[SKSpriteNode alloc] initWithImageNamed:@"Hero"];
        _heroSprite.xScale = 0.2;
        _heroSprite.yScale = 0.2;
        _heroSprite.position = CGPointMake(100, 100);
        [self addChild:_heroSprite];
    }
    return self;
}

- (void)addMonster
{
    SKSpriteNode *monsterNode = [SKSpriteNode spriteNodeWithImageNamed:@"Orange-Monster"];
    monsterNode.xScale = 0.1;
    monsterNode.yScale = 0.1;
    
    int minY = monsterNode.size.height / 2.0f;
    int maxY = self.frame.size.height - minY;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    monsterNode.position = CGPointMake(self.frame.size.width + monsterNode.size.width / 2, actualY);
    [self addChild:monsterNode];
    
    int minDuration = 2.0f;
    int maxDuration = 4.0f;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    SKAction *moveAction = [SKAction moveTo:CGPointMake(-monsterNode.size.width/2, actualY) duration:actualDuration];
    SKAction *moveDoneAction = [SKAction removeFromParent];
    [monsterNode runAction:[SKAction sequence:@[moveAction, moveDoneAction]]];
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    self.lastSpawnInterval += timeSinceLast;
    if ( self.lastSpawnInterval >= 1 ) {
        self.lastSpawnInterval = 0.0;
        [self addMonster];
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateInterval;
    self.lastUpdateInterval = currentTime;
    if ( timeSinceLast >= 1 ) {
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateInterval = currentTime;
    }
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
}

@end
