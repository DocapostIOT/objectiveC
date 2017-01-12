//
//  StatViewController.m
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 02/11/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import "StatViewController.h"

@interface StatViewController ()

@end

@implementation StatViewController


int dataType = 0;
int interType = 0;


- (void) entre: (UITapGestureRecognizer *)recognizer{
    [self drawrec:labJour];
    interType =0;
    [self drawValue];
}

- (void) back: (UITapGestureRecognizer *)recognizer{
    NSLog(@"sst");
    [self performSegueWithIdentifier:@"back" sender:self];
}
- (void) garniture: (UITapGestureRecognizer *)recognizer{
    [self drawrec:labSemaine];
    interType = 1;
    [self drawValue];
}

- (void) plat: (UITapGestureRecognizer *)recognizer{
    [self drawrec:labMois];
    interType = 2;
    [self drawValue];
}

/*
 switch (interType) {
 case 0:;
 NSURL *url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/tempDay"];
 NSData *data = [NSData dataWithContentsOfURL:url];
 NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
 NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
 [self drawDay: s];
 break;
 case 1:
 
 break;
 case 2:
 
 break;
 default:
 break;
 }
 break;
 */
- (void)drawValue {
    NSURL *url;
    switch (dataType) {
        case 0:
            switch (interType) {
                case 0:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/tempDay"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    NSLog(@"%@", ret);
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawDay: s];
                    }
                    break;
                case 1:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/tempWeek"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawWeek: s];
                }
                    break;
                case 2:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/tempMonth"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawMonth: s];
                }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (interType) {
            case 0:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/humDay"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawDay: s];
            }
                break;
            case 1:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/humWeek"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawWeek: s];
            }
                break;
            case 2:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/humMonth"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawMonth: s];
            }
                break;
            default:
                break;
        }

            
            break;
        case 2:
            switch (interType) {
            case 0:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/aftDay"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawDay: s];
            }
                break;
            case 1:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/aftWeek"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawWeek: s];
            }
                break;
            case 2:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/aftMonth"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawMonth: s];
            }
                break;
            default:
                break;
        }

            
            break;
        case 3:
            switch (interType) {
            case 0:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/sonDay"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawDay: s];
            }
                break;
            case 1:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/sonWeek"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawWeek: s];
            }
                break;
            case 2:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/sonMonth"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawMonth: s];
            }
                break;
            default:
                break;
        }

            
            break;
        case 4:
            switch (interType) {
            case 0:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/hDay"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawDay: s];
            }
                break;
            case 1:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/hWeek"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawWeek: s];
            }
                break;
            case 2:{
                url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/hMonth"];
                NSData *data = [NSData dataWithContentsOfURL:url];
                NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                [self drawMonth: s];
            }
                break;
            default:
                break;
        }

            
            break;
        case 5:
            switch (interType) {
                case 0:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/pDay"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawDay: s];
                }
                    break;
                case 1:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/pWeek"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawWeek: s];
                }
                    break;
                case 2:{
                    url = [NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/pMonth"];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [self drawMonth: s];
                }
                    break;
                default:
                    break;
            }

            break;
        default:
            break;
    }
}

- (void) drawWeek: (NSDictionary* ) array{

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [comps weekday];
    NSLog(@"%d", weekday);
    
    weekday = weekday - 2;
    if ( weekday == -1)
        weekday = 6;
    [UIView animateWithDuration:0.5 animations: ^{
        for (int i = 0; i < 18; i++){
            CGRect rectSe = ((UIView *)_bars[i]).frame;
            rectSe.origin.y =  rectSe.origin.y + rectSe.size.height - 2;
            rectSe.size.height = 0;
            ((UIView *)_bars[i]).frame = rectSe;
            ((UILabel *)_texts[i]).alpha = 0;
        }
    } completion:^(BOOL completed){
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
        for (int i = 0; i < 7; i++){
            ((UILabel *)_texts[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/9 + 10, self.view.frame.size.height/3.7 ,40, 40);
            switch (i) {
                case 0:
                    ((UILabel *)_texts[i]).text = @"Lun";
                    break;
                case 1:
                    ((UILabel *)_texts[i]).text = @"Mar";
                    break;
                case 2:
                    ((UILabel *)_texts[i]).text = @"Mer";
                    break;
                case 3:
                    ((UILabel *)_texts[i]).text = @"Jeu";
                    break;
                case 4:
                    ((UILabel *)_texts[i]).text = @"Ven";
                    break;
                case 5:
                    ((UILabel *)_texts[i]).text = @"Sam";
                    break;
                case 6:
                    ((UILabel *)_texts[i]).text = @"Dim";
                    break;
                default:
                    break;
            }
            
            
            ((UILabel *)_texts[i]).font = font;
            ((UILabel *)_texts[i]).numberOfLines = 1;
            ((UILabel *)_texts[i]).baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
            ((UILabel *)_texts[i]).adjustsFontSizeToFitWidth = YES;
            ((UILabel *)_texts[i]).adjustsLetterSpacingToFitWidth = YES;
            ((UILabel *)_texts[i]).clipsToBounds = YES;
            ((UILabel *)_texts[i]).backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
            ((UILabel *)_texts[i]).textColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            ((UILabel *)_texts[i]).textAlignment = NSTextAlignmentCenter;
            [((UILabel *)_texts[i]) sizeToFit];
          //  [self.view addSubview:((UILabel *)_texts[i])];
            
            if(i == weekday){
                ((UIView *)_bars[i]).frame = CGRectMake(((UILabel *)_texts[0]).frame.size.width / 2 + (i + 1) * self.view.frame.size.width/9 + 10 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,2, 0);
            }
            else{
               ((UIView *)_bars[i]).frame = CGRectMake(((UILabel *)_texts[0]).frame.size.width / 2 + (i + 1) * self.view.frame.size.width/9 + 10 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,1, 0);
            }
            
            ((UIView *)_bars[i]).backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            
          //  [self.view addSubview:((UILabel *)_bars[i])];
        }
        [UIView animateWithDuration:0.5 animations: ^{
            float max = 0;
            float min = 10000;
            for (int i = 0; i < 7; i++){
                if ([((NSString *)(array[[@(i) stringValue]]))  isEqual: @""]){
                    
                }
                else{
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] > max){
                        max = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] < min){
                        min = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                }
            }
            
            for (int i = 0; i < 7; i++){
                CGRect rectSe = ((UIView *)_bars[i]).frame;
                float val = (([((NSString *)(array[[@(i) stringValue]])) intValue]/max) * 90);
                if (val == 0){
                    val = 1;
                }
                rectSe.origin.y =  rectSe.origin.y - val;
                rectSe.size.height = val ;
                ((UIView *)_bars[i]).frame = rectSe;
                ((UILabel *)_texts[i]).alpha = 1;
            }
        } completion:^(BOOL completed){
        }];
    }];

}


- (void) drawDay: (NSDictionary* ) array{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitHour fromDate:[NSDate date]];
    int hour = [comps hour];
    NSLog(@"%d", hour);
    
    [UIView animateWithDuration:0.5 animations: ^{
        for (int i = 0; i < 18; i++){
            CGRect rectSe = ((UIView *)_bars[i]).frame;
            rectSe.origin.y =  rectSe.origin.y + rectSe.size.height - 2;
            rectSe.size.height = 0;
            ((UIView *)_bars[i]).frame = rectSe;
            ((UILabel *)_texts[i]).alpha = 0;
        }
    } completion:^(BOOL completed){
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
        for (int i = 0; i < 9; i++){
            
            ((UILabel *)_texts[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/11 + 10, self.view.frame.size.height/3.7 ,0, 0);
            
            switch (i) {
                case 0:
                    ((UILabel *)_texts[i]).text = @"10";
                    break;
                case 2:
                    ((UILabel *)_texts[i]).text = @"12";
                    break;
                case 4:
                    ((UILabel *)_texts[i]).text = @"14";
                    break;
                case 6:
                    ((UILabel *)_texts[i]).text = @"16";
                    break;
                case 8:
                    ((UILabel *)_texts[i]).text = @"18";
                    break;
                default:
                    ((UILabel *)_texts[i]).text = @"";
                    break;
            }
            
            ((UILabel *)_texts[i]).font = font;
            ((UILabel *)_texts[i]).numberOfLines = 1;
            ((UILabel *)_texts[i]).baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
            ((UILabel *)_texts[i]).adjustsFontSizeToFitWidth = YES;
            ((UILabel *)_texts[i]).adjustsLetterSpacingToFitWidth = YES;
            ((UILabel *)_texts[i]).clipsToBounds = YES;
            ((UILabel *)_texts[i]).backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
            ((UILabel *)_texts[i]).textColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            ((UILabel *)_texts[i]).textAlignment = NSTextAlignmentCenter;
            [((UILabel *)_texts[i]) sizeToFit];
            //  [self.view addSubview:((UILabel *)_texts[i])];
            
            
            if (hour == i + 10)
                ((UIView *)_bars[i]).frame = CGRectMake(((UILabel *)_texts[0]).frame.size.width / 2 + (i + 1) * self.view.frame.size.width/11 + 10 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,2, 0);
            else
                ((UIView *)_bars[i]).frame = CGRectMake(((UILabel *)_texts[0]).frame.size.width / 2 + (i + 1) * self.view.frame.size.width/11 + 10 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,1, 0);
            ((UIView *)_bars[i]).backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            
            //  [self.view addSubview:((UILabel *)_bars[i])];
        }
        [UIView animateWithDuration:0.5 animations: ^{
            int max = 0;
            int min = 10000;
            for (int i = 0; i < 9; i++){
                if ([((NSString *)(array[[@(i) stringValue]]))  isEqual: @""]){
                    
                }
                else{
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] > max){
                        max = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] < min){
                        min = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                }
            }
            
            for (int i = 0; i < 9; i++){
                CGRect rectSe = ((UIView *)_bars[i]).frame;
                float val = (([((NSString *)(array[[@(i) stringValue]])) intValue]/max) * 90);
                if (val == 0){
                    val = 1;
                }
                rectSe.origin.y =  rectSe.origin.y - val;
                rectSe.size.height = val;
                ((UIView *)_bars[i]).frame = rectSe;
                ((UILabel *)_texts[i]).alpha = 1;
            }
        } completion:^(BOOL completed){
        }];
    }];
    
}


- (void) drawMonth: (NSDictionary* ) array{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitDay  fromDate:[NSDate date]];
    int day = [comps day];
    NSLog(@"%d", day);
    
    [UIView animateWithDuration:0.5 animations: ^{
        for (int i = 0; i < 18; i++){
            CGRect rectSe = ((UIView *)_bars[i]).frame;
            rectSe.origin.y =  rectSe.origin.y + rectSe.size.height - 2;
            rectSe.size.height = 0;
            ((UIView *)_bars[i]).frame = rectSe;
            ((UILabel *)_texts[i]).alpha = 0;
        }
    } completion:^(BOOL completed){
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
        for (int i = 0; i < 18; i++){
            ((UILabel *)_texts[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/20 + 10, self.view.frame.size.height/3.7 ,0, 0);
            switch (i) {
                case 0:
                    ((UILabel *)_texts[i]).text = @"1";
                    break;
                case 3:
                    ((UILabel *)_texts[i]).text = @"7";
                    break;
                case 6:
                    ((UILabel *)_texts[i]).text = @"14";
                    break;
                case 9:
                    ((UILabel *)_texts[i]).text = @"19";
                    break;
                case 12:
                    ((UILabel *)_texts[i]).text = @"23";
                    break;
                case 15:
                    ((UILabel *)_texts[i]).text = @"27";
                    break;
                case 18:
                    ((UILabel *)_texts[i]).text = @"31";
                    break;
                default:
                     ((UILabel *)_texts[i]).text = @"";
                    break;
            }
            
            
            ((UILabel *)_texts[i]).font = font;
            ((UILabel *)_texts[i]).numberOfLines = 1;
            ((UILabel *)_texts[i]).baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
            ((UILabel *)_texts[i]).adjustsFontSizeToFitWidth = YES;
            ((UILabel *)_texts[i]).adjustsLetterSpacingToFitWidth = YES;
            ((UILabel *)_texts[i]).clipsToBounds = YES;
            ((UILabel *)_texts[i]).backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
            ((UILabel *)_texts[i]).textColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            ((UILabel *)_texts[i]).textAlignment = NSTextAlignmentCenter;
            [((UILabel *)_texts[i]) sizeToFit];
            //  [self.view addSubview:((UILabel *)_texts[i])];
            if (day < 22){
                if (day/2 == i){
                    ((UIView *)_bars[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/20 + 10 + ((UILabel *)_texts[0]).frame.size.width / 2 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,2, 0);
                }
                else{
                    ((UIView *)_bars[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/20 + 10 + ((UILabel *)_texts[0]).frame.size.width / 2 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,1, 0);
                }
            }
            else{
                if (day - 12 == i ){
                    ((UIView *)_bars[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/20 + 10 + ((UILabel *)_texts[0]).frame.size.width / 2 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,2, 0);
                }
                else{
                     ((UIView *)_bars[i]).frame = CGRectMake((i + 1) * self.view.frame.size.width/20 + 10 + ((UILabel *)_texts[0]).frame.size.width / 2 , ((UILabel *)_texts[i]).frame.origin.y - 5 ,1, 0);
                }
            }
           
            ((UIView *)_bars[i]).backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
            
            //  [self.view addSubview:((UILabel *)_bars[i])];
        }
        [UIView animateWithDuration:0.5 animations: ^{
            float max = 0;
            float min = 10000;
            for (int i = 0; i < 30; i++){
                if ([((NSString *)(array[[@(i) stringValue]]))  isEqual: @""]){
                    
                }
                else{
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] > max){
                        max = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                    if ([((NSString *)(array[[@(i) stringValue]])) intValue] < min){
                        min = [((NSString *)(array[[@(i) stringValue]])) intValue];
                    }
                }
            }
            
            for (int i = 0; i < 30; i++){
                
               
                
                if (i < 22){
                    
                    CGRect rectSe = ((UIView *)_bars[i/2]).frame;
                    float val = ((([((NSString *)(array[[@(i) stringValue]])) intValue]/max) * 90) + (([((NSString *)(array[[@(i + 1) stringValue]])) intValue]/max) * 90))/2;
                    if (val == 0){
                        val = 1;
                    }
                    rectSe.origin.y =  rectSe.origin.y - val ;
                    rectSe.size.height = val;
                    ((UIView *)_bars[i/2]).frame = rectSe;
                    ((UILabel *)_texts[i/2]).alpha = 1;
                    i++;
                }
                else{
                    CGRect rectSe = ((UIView *)_bars[i-12]).frame;
                    float val = ((([((NSString *)(array[[@(i) stringValue]])) intValue]/max) * 90) + (([((NSString *)(array[[@(i + 1) stringValue]])) intValue]/max) * 90))/2;
                    if (val == 0){
                        val = 1;
                    }
                    rectSe.origin.y =  rectSe.origin.y - val ;
                    rectSe.size.height = val;
                    ((UIView *)_bars[i - 12]).frame = rectSe;
                    ((UILabel *)_texts[i - 12]).alpha = 1;
                }
            }
        } completion:^(BOOL completed){
        }];
    }];
    
}

- (void) temp: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min5"];
    [l2 setImg:@"min1"];
    [l3 setImg:@"min2"];
    [l4 setImg:@"min3"];
    [l5 setImg:@"min2"];
    [l6 setImg:@"min4"];
    
    dataType = 0;
    [self drawValue];
    NSLog(@"temp");

}

- (void) hum: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min1"];
    [l2 setImg:@"min5"];
    [l3 setImg:@"min2"];
    [l4 setImg:@"min3"];
    [l5 setImg:@"min2"];
    [l6 setImg:@"min4"];


    dataType = 1;
    [self drawValue];

    NSLog(@"hum");

}


- (void) after: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min1"];
    [l2 setImg:@"min1"];
    [l3 setImg:@"min6"];
    [l4 setImg:@"min3"];
    [l5 setImg:@"min2"];
    [l6 setImg:@"min4"];

    dataType = 2;
    [self drawValue];

    NSLog(@"afte");

}

- (void) vol: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min1"];
    [l2 setImg:@"min1"];
    [l3 setImg:@"min2"];
    [l4 setImg:@"min7"];
    [l5 setImg:@"min2"];
    [l6 setImg:@"min4"];

    dataType = 3;
    [self drawValue];

    NSLog(@"vol");

}

- (void) humeur: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min1"];
    [l2 setImg:@"min1"];
    [l3 setImg:@"min2"];
    [l4 setImg:@"min3"];
    [l5 setImg:@"min6"];
    [l6 setImg:@"min4"];

    dataType = 4;
  //  [self drawValue];

    NSLog(@"hume");
}

- (void) pause: (UITapGestureRecognizer *)recognizer{
    [l setImg:@"min1"];
    [l2 setImg:@"min1"];
    [l3 setImg:@"min2"];
    [l4 setImg:@"min3"];
    [l5 setImg:@"min2"];
    [l6 setImg:@"min8"];

    dataType = 5;
    [self drawValue];

    NSLog(@"pause");
}
UILabel *labJour ;
UILabel *labSemaine ;
UILabel *labMois ;


line *l;
line *l2;
line *l3;
line *l4;
line *l5;
line *l6;


UILabel *line11;
UILabel *line21;
UILabel *line31;
UILabel *line41;


- (void)viewDidAppear:(BOOL)animated{
    [self drawValue];
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
    
    
    UILabel *labSon = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
    
    
    labSon.text = @"";
    labSon.font = font;
    labSon.numberOfLines = 1;
    labSon.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labSon.adjustsFontSizeToFitWidth = YES;
    labSon.adjustsLetterSpacingToFitWidth = YES;
    labSon.clipsToBounds = YES;
    labSon.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labSon.textColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    labSon.textAlignment = NSTextAlignmentCenter;
    self.view.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    
    [self.view addSubview:labSon];
    
    _texts = [NSMutableArray arrayWithCapacity:18];
    _bars = [NSMutableArray arrayWithCapacity:18];
    for(int i = 0; i <18 ; i++){
        [_texts addObject:[[UILabel alloc]initWithFrame:CGRectMake(0,0,0,0)]];
        [self.view addSubview:((UILabel *)_texts[i])];

    }
    for(int i = 0; i <18 ; i++){
        [_bars addObject:[[UIView alloc]initWithFrame:CGRectMake(0,0,0,0)]];
        [self.view addSubview:((UIView *)_bars[i])];

        

    }

    
   // UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
    
    
    
    
    int space = 25;
    UIFont *font2 = [UIFont fontWithName:@"Helvetica" size:15];
    
    labJour = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4, labSon.frame.size.height + self.view.frame.size.height/23, self.view.frame.size.width, 20)];
    
    labJour.text = @"Jour";
    labJour.font = font2;
    labJour.numberOfLines = 1;
    labJour.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labJour.adjustsFontSizeToFitWidth = YES;
    labJour.adjustsLetterSpacingToFitWidth = YES;
    labJour.clipsToBounds = YES;
    labJour.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    labJour.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labJour.textAlignment = NSTextAlignmentLeft;
    [labJour sizeToFit];
    [self.view addSubview:labJour];
    
    
    labJour.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(entre:)];
    [labJour addGestureRecognizer:tapGestureRecognizer2];
    
    
    
    labSemaine = [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x + labJour.frame.size.width + space *2.5, labJour.frame.origin.y, self.view.frame.size.width, 20)];
    
    labSemaine.text = @"Semaine";
    labSemaine.font = font2;
    labSemaine.numberOfLines = 1;
    labSemaine.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labSemaine.adjustsFontSizeToFitWidth = YES;
    labSemaine.adjustsLetterSpacingToFitWidth = YES;
    labSemaine.clipsToBounds = YES;
    labSemaine.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    labSemaine.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labSemaine.textAlignment = NSTextAlignmentLeft;
    [labSemaine sizeToFit];
    [self.view addSubview:labSemaine];
    
    labSemaine.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(garniture:)];
    [labSemaine addGestureRecognizer:tapGestureRecognizer1];
    
    labMois = [[UILabel alloc]initWithFrame:CGRectMake(labSemaine.frame.origin.x + labSemaine.frame.size.width + space * 2.5, labSemaine.frame.origin.y, self.view.frame.size.width, 20)];
    
    labMois.text = @"Mois";
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
    [self.view addSubview:labMois];
    
    
    labMois.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(plat:)];
    [labMois addGestureRecognizer:tapGestureRecognizer3];
    
    
    UILabel *line0 =  [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6, labJour.frame.origin.y + labJour.frame.size.height + space, self.view.frame.size.width, 1)];
    line0.text = @"";
    line0.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line0];
    
    
    
    
    
    l = [[[line alloc] init] ini:[UIImage imageNamed:@"min5"] :@"Température"];
    CGRect r = l.frame;
    r.origin.x = labJour.frame.origin.x - [UIImage imageNamed:@"min1"].size.width/2;
    r.origin.y = line0.frame.origin.y + space;
   // l.backgroundColor =  [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    l.frame = r;
    
    [self.view addSubview:l];
    
    l.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(temp:)];
    [l addGestureRecognizer:tapGestureRecognizer11];
    
    
    UILabel *line1 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, line0.frame.origin.y ,1, l.frame.origin.y - line0.frame.origin.y )];
    line1.text = @"";
    line1.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line1];
    
    UILabel *line2 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, l.frame.origin.y + l.frame.size.height ,1, space/2)];
    line2.text = @"";
    line2.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line2];
    
    
    l2 = [[[line alloc] init] ini:[UIImage imageNamed:@"min1"] :@"Humidité"];
    CGRect r2 = l2.frame;
    r2.origin.x = l.frame.origin.x;
    r2.origin.y = l.frame.origin.y +l.frame.size.height + space/2;
    l2.frame = r2;
    
    [self.view addSubview:l2];
    
    l2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hum:)];
    [l2 addGestureRecognizer:tapGestureRecognizer12];
    
    
    UILabel *line3 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, l2.frame.origin.y + l2.frame.size.height ,1, space/2)];
    line3.text = @"";
    line3.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line3];

    l3 = [[[line alloc] init] ini:[UIImage imageNamed:@"min2"] :@"After Works"];
    CGRect r3 = l3.frame;
    r3.origin.x = l.frame.origin.x;
    r3.origin.y = l2.frame.origin.y + l2.frame.size.height +  space/2;
    l3.frame = r3;
    
    [self.view addSubview:l3];
    
    l3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer13 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(after:)];
    [l3 addGestureRecognizer:tapGestureRecognizer13];
    
    
    UILabel *line4 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, l3.frame.origin.y + l3.frame.size.height ,1, space/2)];
    line4.text = @"";
    line4.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line4];
    
    l4 = [[[line alloc] init] ini:[UIImage imageNamed:@"min3"] :@"Volume sonore"];
    CGRect r4 = l4.frame;
    r4.origin.x = l.frame.origin.x;
    r4.origin.y = l3.frame.origin.y + l3.frame.size.height +  space/2;
    l4.frame = r4;
    
    [self.view addSubview:l4];
    
    l4.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer14 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vol:)];
    [l4 addGestureRecognizer:tapGestureRecognizer14];
    
    UILabel *line5 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, l4.frame.origin.y + l4.frame.size.height ,1, space/2)];
    line5.text = @"";
    line5.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line5];
    
    l5 = [[[line alloc] init] ini:[UIImage imageNamed:@"min2"] :@"Humeur"];
    CGRect r5 = l5.frame;
    r5.origin.x = l.frame.origin.x;
    r5.origin.y = l4.frame.origin.y + l4.frame.size.height +  space/2;
    l5.frame = r5;
    
    [self.view addSubview:l5];
    
    l5.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer15 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(humeur:)];
    [l5 addGestureRecognizer:tapGestureRecognizer15];
    
    
    UILabel *line6 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 1, l5.frame.origin.y + l5.frame.size.height ,1, space/2)];
    line6.text = @"";
    line6.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line6];
    
    l6 = [[[line alloc] init] ini:[UIImage imageNamed:@"min4"] :@"Quantité de pauses"];
    CGRect r6 = l6.frame;
    r6.origin.x = l.frame.origin.x;
    r6.origin.y = l5.frame.origin.y + l5.frame.size.height +  space/2;
    l6.frame = r6;
    
    [self.view addSubview:l6];
    
    
    l6.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer16 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pause:)];
    [l6 addGestureRecognizer:tapGestureRecognizer16];
    
    // Do any additional setup after loading the view.
    line11 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 8, labJour.frame.origin.y  -8  , labJour.frame.size.width +  16, 1)];
    line11.text = @"";
    line11.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    
    [self.view addSubview:line11];
    
    
    line21 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 8, labJour.frame.origin.y + labJour.frame.size.height  + 8  , labJour.frame.size.width +  16, 1)];
    line21.text = @"";
    line21.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line21];
    
    
    line31 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x - 8, labJour.frame.origin.y - 8  , 1, labJour.frame.size.height + 16)];
    line31.text = @"";
    line31.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line31];
    
    line41 =  [[UILabel alloc]initWithFrame:CGRectMake(labJour.frame.origin.x + 8  +labJour.frame.size.width, labJour.frame.origin.y - 8  , 1, labJour.frame.size.height + 17)];
    line41.text = @"";
    line41.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line41];
    
    UIImageView *Vimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fleche"]];
    CGRect Vrect = Vimg.frame;
    Vrect.origin.x = 15;
    Vrect.origin.y = 40 ;
    //Vimg.backgroundColor = [UIColor whiteColor];
    
    Vimg.frame = Vrect;
    [labSon addSubview:Vimg];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 60, 30)];
    //lab.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lab];
    lab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    [lab addGestureRecognizer:tapGestureRecognizer6];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)drawrec:(UILabel *)lab{
    
    line11.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y  -8  , lab.frame.size.width +  16, 1);
    
    
    line21.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y + lab.frame.size.height  + 8  , lab.frame.size.width +  16, 1);
    
    
    
    line31.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y - 8  , 1, lab.frame.size.height + 16);
    
    
    
    line41.frame = CGRectMake(lab.frame.origin.x + 8  +lab.frame.size.width, lab.frame.origin.y - 8  , 1, lab.frame.size.height + 17);
}


@end
