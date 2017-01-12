//
//  line.m
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 28/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import "line.h"

@implementation line

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void) setImg:(NSString*)im{
    _img.image = [UIImage imageNamed:im];
}

- (line *)ini:(UIImage *)im:(NSString *)text{
    
    _img = [[UIImageView alloc] initWithImage:im];
    CGRect rect4 = _img.frame;
    rect4.origin.x = 0;
    rect4.origin.y =  0;

    
    _img.frame = rect4;
    [self addSubview:_img];
    
    UIFont *font2 = [UIFont fontWithName:@"Helvetica" size:15];

    
    UILabel *labMois = [[UILabel alloc]initWithFrame:CGRectMake(_img.frame.size.width*2 , _img.frame.size.height/2 - 8, 200, 15)];
    
    labMois.text = text;
    labMois.font = font2;
    labMois.numberOfLines = 1;
    labMois.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labMois.adjustsFontSizeToFitWidth = YES;
    labMois.adjustsLetterSpacingToFitWidth = YES;
    labMois.clipsToBounds = YES;
    labMois.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    labMois.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labMois.textAlignment = NSTextAlignmentLeft;
    [labMois sizeToFit];
    [self addSubview:labMois];
    self.frame = CGRectMake(0, 0, _img.frame.size.width*2+labMois.frame.size.width, _img.frame.size.height);
    return self;
}
/*
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context,r, g, b ,1);
    CGContextSetRGBStrokeColor(context,r, g, b, 1);
    CGContextFillRect(context, rect2);
    
}*/

@end
