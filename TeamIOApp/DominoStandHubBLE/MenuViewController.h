
//
//  MenuViewController.h
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 27/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrol;


@property (strong, nonatomic) UILabel *labEntree ;
@property (strong, nonatomic) UILabel *labGar ;
@property (strong, nonatomic) UILabel *labPlat ;
@property (strong, nonatomic) UILabel *labDessert ;
@property (strong, nonatomic) UILabel *labDay;
@property (strong, nonatomic) NSMutableArray *listDay;







@property (strong, nonatomic) NSMutableArray *listDessert;
@property (strong, nonatomic) NSMutableArray *listEntree;
@property (strong, nonatomic) NSMutableArray *listGarniture;
@property (strong, nonatomic) NSMutableArray *listPlat;
@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) UILabel *line1;
@property (strong, nonatomic) UILabel *line2;
@property (strong, nonatomic) UILabel *line3;
@property (strong, nonatomic) UILabel *line4;


@end
