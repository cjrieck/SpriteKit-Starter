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

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if ( self ) {
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        self.backgroundColor = [UIColor whiteColor];
        
        _heroSprite = [[SKSpriteNode alloc] initWithImageNamed:@"Hero"];
        _heroSprite.xScale = 0.2;
        _heroSprite.yScale = 0.2;
        _heroSprite.position = CGPointMake(100, 100);
        [self addChild:_heroSprite];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
