//
//  line.h
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 28/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface line : UIView

- (line *)ini:(UIImage *)img:(NSString *)text;
- (void) setImg:(NSString*)im;

@property (strong, nonatomic) UIImageView *img;
@end
