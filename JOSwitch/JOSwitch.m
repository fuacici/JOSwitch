//
//  JOSwitch.m
//  liulianclient
//
//  Created by Joost💟Blair on 4/26/13.
//  Copyright (c) 2013 yang alef. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "JOSwitch.h"
@interface JOSwitch()
{
    CALayer * thumbLayer;
    CALayer * onLayer;
    CALayer * offLayer;
    CALayer * contentLayer;
}
@end
@implementation JOSwitch
- (void)initialize
{
    self.offImage = [UIImage imageNamed:@"switch_off"];
    self.onImage = [UIImage imageNamed:@"switch_on"];
    self.thumbImage = [UIImage imageNamed:@"switch_thumb"];
    contentLayer = [CALayer layer];
    contentLayer.anchorPoint = CGPointMake(0.5, 0.5);
    contentLayer.bounds = CGRectMake(0, 0, self.bounds.size.width*2, self.bounds.size.height);
    onLayer = [CALayer layer];
    onLayer.contents = (__bridge id)(self.onImage.CGImage);
    onLayer.anchorPoint = CGPointMake(1.0f, 0.5);
    onLayer.position = CGPointMake(contentLayer.bounds.size.width/2.0f, contentLayer.bounds.size.height/2.0f);
    offLayer = [CALayer layer];
    offLayer.contents = (__bridge id)(self.offImage.CGImage);
    offLayer.anchorPoint = CGPointMake(0, 0.5);
    offLayer.position = CGPointMake(contentLayer.bounds.size.width/2.0f, contentLayer.bounds.size.height/2.0f);
    thumbLayer = [CALayer layer];
    thumbLayer.contents = (__bridge id)(self.thumbImage.CGImage);
    thumbLayer.bounds = CGRectMake(0, 0, self.thumbImage.size.width, self.thumbImage.size.height);
    thumbLayer.position = CGPointMake(contentLayer.bounds.size.width/2.0f, contentLayer.bounds.size.height/2.0f);
    [contentLayer addSublayer:onLayer];
    [contentLayer addSublayer:offLayer];
    [contentLayer addSublayer:thumbLayer];
    [self.layer addSublayer: contentLayer];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.height/2.0f;
    [self setOn:NO animated:NO];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.on = NO;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    contentLayer.bounds = self.bounds;
    onLayer.bounds = self.bounds;
    offLayer.bounds = self.bounds;
    
}
- (void)setOn:(BOOL)on
{
    if (_on != on)
    {
        [self setOn: on animated:NO];
    }
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
    CGPoint t = CGPointMake(0, self.layer.bounds.size.height/2.0f);
    t.x = self.layer.bounds.size.width/2.0f-self.thumbImage.size.width/2.0f;
    if (!on)
    {
        t.x = -t.x;
    }
    
    [CATransaction setDisableActions: !animated];
    contentLayer.position = t;
    [CATransaction setDisableActions: YES];
    _on = on;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setOn:!_on animated:YES];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
@end
