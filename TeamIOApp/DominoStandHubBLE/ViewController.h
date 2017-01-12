//
//  ViewController.h
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 10/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLE.h"

@interface ViewController : UIViewController <BLEDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *text;
@property (strong, nonatomic) IBOutlet UILabel *temp;
@property (strong, nonatomic) IBOutlet UILabel *hum;
@property (strong, nonatomic) IBOutlet UILabel *sound;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

