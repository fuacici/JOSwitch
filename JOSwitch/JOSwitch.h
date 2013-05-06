//
//  JOSwitch.h
//  liulianclient
//
//  Created by Joost💟Blair on 4/26/13.
//  Copyright (c) 2013 yang alef. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JOSwitch : UIControl
@property (nonatomic,getter = isOn) BOOL on;
@property (nonatomic,strong) UIImage * onImage;
@property (nonatomic,strong) UIImage * offImage;
@property (nonatomic,strong) UIImage * thumbImage;
- (void)setOn:(BOOL)on animated:(BOOL)animated;
@end
