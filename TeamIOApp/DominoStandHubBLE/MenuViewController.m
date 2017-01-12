//
//  MenuViewController.m
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 27/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import "MenuViewController.h"
#import "line.h"
#import "Day.h"

@interface MenuViewController ()

@end



@implementation MenuViewController



- (void) entre: (UITapGestureRecognizer *)recognizer{
    vtype = 0;
    [self drawrec:_labEntree];
    [self drawLab:((Day*)_listDay[vday]).entree];
} 

- (void) back: (UITapGestureRecognizer *)recognizer{
    NSLog(@"sst");
    [self performSegueWithIdentifier:@"back" sender:self];
}
- (void) garniture: (UITapGestureRecognizer *)recognizer{
    vtype = 1;
    [self drawrec:_labGar];
    [self drawLab:((Day*)_listDay[vday]).garniture];
}

- (void) plat: (UITapGestureRecognizer *)recognizer{
    vtype = 2;
     [self drawrec:_labPlat];
    [self drawLab:((Day*)_listDay[vday]).plat];
}

- (void) dessert: (UITapGestureRecognizer *)recognizer{
    vtype = 3;
    [self drawrec:_labDessert];
    [self drawLab:((Day*)_listDay[vday]).dessert];
}


-(void) drawLab:(NSMutableArray *)arr{
    for (int i = 0 ; i<15; i++){
        ((UILabel *)_labels[i]).text = @"";
        [((UILabel *)_labels[i]) sizeToFit];
    }
    ((UILabel *)_labels[0]).text = ((NSString*)arr[0]);
      ((UILabel *)_labels[0]).frame = CGRectMake(_labEntree.frame.origin.x + _labEntree.frame.size.width/2,_labEntree.frame.origin.y + _labEntree.frame.size.height + 70 , self.view.frame.size.width - 60 - _labEntree.frame.origin.x + _labEntree.frame.size.width/2,15);
    [((UILabel *)_labels[0]) sizeToFit];
    for(int i = 1 ; i < arr.count; i++){
        ((UILabel *)_labels[i]).text = ((NSString*)arr[i]);
          ((UILabel *)_labels[i]).frame = CGRectMake(((UILabel *)_labels[i - 1]).frame.origin.x,((UILabel *)_labels[i - 1]).frame.origin.y + ((UILabel *)_labels[i - 1]).frame.size.height + 10 , self.view.frame.size.width - 60 - _labEntree.frame.origin.x + _labEntree.frame.size.width/2,15);
        [((UILabel *)_labels[i]) sizeToFit];
      
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"sdkfmlsdf");
      [self test];
}

int vday = 0;
int vtype = 0;
bool lock = false;

- (void) test{
    
    CGPoint offset = _scrol.contentOffset;
    offset.x -= 1.0;
    offset.y -= 1.0;
    [_scrol setContentOffset:offset animated:NO];
    offset.x += 1.0;
    offset.y += 1.0;
    [_scrol setContentOffset:offset animated:NO];
    int v = ((_scrol.contentOffset.x) /(self.view.frame.size.width)*10);
    NSLog(@"%d",v);
    if(vday*10 < v && v % 10 > 2)
        v += 10;
    if (vday*10 > v && v % 10 < 7)
        v -= v % 10;
    int v2=  v/10;
    if (v2 == 5)
        v2 = 4;
    vday = v2;
    
    NSLog(@"%d",v2);
    int va = v2 * self.view.frame.size.width ;
    NSLog(@"ori %f, dest %d", _scrol.contentOffset.x, va);
    [UIView animateWithDuration:0.25 animations: ^{
        _scrol.contentOffset = CGPointMake(va, 0);
    } completion:^(BOOL completed){
       switch (vtype) {
            case 0:
                [self drawrec:_labEntree];
                [self drawLab:((Day*)_listDay[vday]).entree];
                break;
            case 1:
                [self drawrec:_labGar];
                [self drawLab:((Day*)_listDay[vday]).garniture];
                break;
            case 2:
                [self drawrec:_labPlat];
                [self drawLab:((Day*)_listDay[vday]).plat];
                break;
            case 3:
                [self drawrec:_labDessert];
                [self drawLab:((Day*)_listDay[vday]).dessert];
                break;
                
            default:
                break;
           // lock = false;
        }
        
    }];
    NSLog(@"miam");
   
}


-(void) panAnim:(UIPanGestureRecognizer*) gestureRecognizer
{

    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {

      

    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    _listDay = [NSMutableArray arrayWithCapacity:10];
 
    _labels = [NSMutableArray arrayWithCapacity:15];

    _scrol.delegate = self;
    

    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAnim:)];
    panGesture.delegate = self;
    [_scrol addGestureRecognizer:panGesture];
    
    
    _scrol.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3);


    int space = 25;
    UIFont *font2 = [UIFont fontWithName:@"Helvetica" size:15];
    
   _labEntree = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height/3 + self.view.frame.size.height/23, self.view.frame.size.width, 20)];
    
    _labEntree.text = @"Entrées";
    _labEntree.font = font2;
    _labEntree.numberOfLines = 1;
    _labEntree.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    _labEntree.adjustsFontSizeToFitWidth = YES;
    _labEntree.adjustsLetterSpacingToFitWidth = YES;
    _labEntree.clipsToBounds = YES;
    _labEntree.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    _labEntree.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    _labEntree.textAlignment = NSTextAlignmentLeft;
    [_labEntree sizeToFit];
    [self.view addSubview:_labEntree];
    
    
    _labEntree.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(entre:)];
    [_labEntree addGestureRecognizer:tapGestureRecognizer2];
    
    
    
    _labGar = [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x + _labEntree.frame.size.width + space, _labEntree.frame.origin.y, self.view.frame.size.width, 20)];
    
    _labGar.text = @"Garnitures";
    _labGar.font = font2;
    _labGar.numberOfLines = 1;
    _labGar.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    _labGar.adjustsFontSizeToFitWidth = YES;
    _labGar.adjustsLetterSpacingToFitWidth = YES;
    _labGar.clipsToBounds = YES;
    _labGar.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    _labGar.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    _labGar.textAlignment = NSTextAlignmentLeft;
    [_labGar sizeToFit];
    [self.view addSubview:_labGar];
    
    _labGar.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(garniture:)];
    [_labGar addGestureRecognizer:tapGestureRecognizer1];
    
    _labPlat = [[UILabel alloc]initWithFrame:CGRectMake(_labGar.frame.origin.x + _labGar.frame.size.width + space, _labGar.frame.origin.y, self.view.frame.size.width, 20)];
    
    _labPlat.text = @"Plats";
    _labPlat.font = font2;
    _labPlat.numberOfLines = 1;
    _labPlat.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    _labPlat.adjustsFontSizeToFitWidth = YES;
    _labPlat.adjustsLetterSpacingToFitWidth = YES;
    _labPlat.clipsToBounds = YES;
    _labPlat.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    _labPlat.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    _labPlat.textAlignment = NSTextAlignmentLeft;
    [_labPlat sizeToFit];
    [self.view addSubview:_labPlat];
    
    
    _labPlat.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(plat:)];
    [_labPlat addGestureRecognizer:tapGestureRecognizer3];
    
   _labDessert = [[UILabel alloc]initWithFrame:CGRectMake(_labPlat.frame.origin.x + _labPlat.frame.size.width + space, _labPlat.frame.origin.y, self.view.frame.size.width, 20)];
    
    _labDessert.text = @"Desserts";
    _labDessert.font = font2;
    _labDessert.numberOfLines = 1;
    _labDessert.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or _labDessert
    _labDessert.adjustsFontSizeToFitWidth = YES;
    _labDessert.adjustsLetterSpacingToFitWidth = YES;
    _labDessert.clipsToBounds = YES;
    _labDessert.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    _labDessert.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    _labDessert.textAlignment = NSTextAlignmentLeft;
    [_labDessert sizeToFit];
    [self.view addSubview:_labDessert];
    
    _labDessert.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dessert:)];
    [_labDessert addGestureRecognizer:tapGestureRecognizer4];
  
    UILabel *line =  [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x, _labEntree.frame.origin.y + _labEntree.frame.size.height + space, self.view.frame.size.width, 1)];
    line.text = @"";
     line.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:line];
    
    
    UIFont *font3 = [UIFont fontWithName:@"Helvetica" size:15];

    [_labels addObject:[[UILabel alloc]initWithFrame:CGRectMake(line.frame.origin.x + _labDessert.frame.size.width/2, line.frame.origin.y + space, self.view.frame.size.width - 50 - _labEntree.frame.origin.x + _labEntree.frame.size.width/2,15)]];
    
    ((UILabel *)_labels[0]).text = @"";
    ((UILabel *)_labels[0]).font = font3;
    ((UILabel *)_labels[0]).numberOfLines = 0;
    ((UILabel *)_labels[0]).baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or _labDessert
    ((UILabel *)_labels[0]).adjustsFontSizeToFitWidth = YES;
    ((UILabel *)_labels[0]).adjustsLetterSpacingToFitWidth = YES;
    ((UILabel *)_labels[0]).clipsToBounds = YES;
    ((UILabel *)_labels[0]).backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    ((UILabel *)_labels[0]).textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    ((UILabel *)_labels[0]).textAlignment = NSTextAlignmentLeft;
    [((UILabel *)_labels[0]) sizeToFit];
    [self.view addSubview:((UILabel *)_labels[0])];
    for(int i = 1; i <15 ; i++){
        [_labels addObject:[[UILabel alloc]initWithFrame:CGRectMake(((UILabel *)_labels[i - 1]).frame.origin.x,((UILabel *)_labels[i - 1]).frame.origin.y + ((UILabel *)_labels[i - 1]).frame.size.height + 10 , self.view.frame.size.width - 50 - line.frame.origin.x + _labDessert.frame.size.width/2,15)]];
     
        ((UILabel *)_labels[i]).text = @"";
        ((UILabel *)_labels[i]).font = font3;
        ((UILabel *)_labels[i]).numberOfLines = 0;
        ((UILabel *)_labels[i]).baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or _labDessert
        ((UILabel *)_labels[i]).adjustsFontSizeToFitWidth = YES;
        ((UILabel *)_labels[i]).adjustsLetterSpacingToFitWidth = YES;
        ((UILabel *)_labels[i]).clipsToBounds = YES;
        ((UILabel *)_labels[i]).backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
        ((UILabel *)_labels[i]).textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
        ((UILabel *)_labels[i]).textAlignment = NSTextAlignmentLeft;
        [((UILabel *)_labels[i]) sizeToFit];
        [self.view addSubview:((UILabel *)_labels[i])];
    }

    

   
    // Do any additional setup after loading the view.
    _line1 =  [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x - 8, _labEntree.frame.origin.y  -8  , _labEntree.frame.size.width +  16, 1)];
    _line1.text = @"";
    _line1.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    
    [self.view addSubview:_line1];
    
    
    _line2 =  [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x - 8, _labEntree.frame.origin.y + _labEntree.frame.size.height  + 8  , _labEntree.frame.size.width +  16, 1)];
    _line2.text = @"";
    _line2.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:_line2];
    
    
    _line3 =  [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x - 8, _labEntree.frame.origin.y - 8  , 1, _labEntree.frame.size.height + 16)];
    _line3.text = @"";
    _line3.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:_line3];
    
    _line4 =  [[UILabel alloc]initWithFrame:CGRectMake(_labEntree.frame.origin.x + 8  +_labEntree.frame.size.width, _labEntree.frame.origin.y - 8  , 1, _labEntree.frame.size.height + 17)];
    _line4.text = @"";
    _line4.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [self.view addSubview:_line4];
    
    
    UIImageView *Vimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fleche"]];
    CGRect Vrect = Vimg.frame;
    Vrect.origin.x = 15;
    Vrect.origin.y = 40 ;
    //Vimg.backgroundColor = [UIColor whiteColor];
    
    Vimg.frame = Vrect;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 60, 30)];
    //lab.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lab];
    lab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    [lab addGestureRecognizer:tapGestureRecognizer6];
   // [self async];
    [self performSelectorInBackground:@selector(async) withObject:nil];
    
}


- (void)async{
    
    NSLog(@"start");
    NSURL *url = [NSURL URLWithString:@"https://rietourcristal.votreextranet.fr/iframeRestauration.cfm?zr=29"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *m1 = ret;
    
    _scrol.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
 

    int index = 0;
   
    while ([m1 rangeOfString:@"date-title"].location != NSNotFound){
        
        [_listDay addObject:[Day alloc]];
        m1 = [m1 substringFromIndex:[m1 rangeOfString:@"<h3 class=\"h3 date-title\">"].location + 26];
        NSString *D2 = [m1 substringToIndex:[m1 rangeOfString:@" "].location];

        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
        UILabel *labDay = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width * index, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
        
        
        labDay.text = [D2 uppercaseString];
        labDay.font = font;
        labDay.numberOfLines = 1;
        labDay.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
        labDay.adjustsFontSizeToFitWidth = YES;
        labDay.adjustsLetterSpacingToFitWidth = YES;
        labDay.clipsToBounds = YES;
        labDay.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
        labDay.textColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
        labDay.textAlignment = NSTextAlignmentCenter;
        
        
        
        [_scrol addSubview:labDay];
        
        self.view.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
        
        ((Day*)_listDay[index]).entree = [NSMutableArray arrayWithCapacity:15];
        ((Day*)_listDay[index]).garniture = [NSMutableArray arrayWithCapacity:15];
        ((Day*)_listDay[index]).plat = [NSMutableArray arrayWithCapacity:15];
        ((Day*)_listDay[index]).dessert = [NSMutableArray arrayWithCapacity:15];

        while([m1 rangeOfString:@"<li>"].location < [m1 rangeOfString:@"</ul>"].location){
            m1 = [m1 substringFromIndex:[m1 rangeOfString:@"<li>"].location + 11];
            NSLog(@"ret=%@",[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]);
            [((Day*)_listDay[index]).entree addObject:[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]];
        }
        
        
        do{
            m1 = [m1 substringFromIndex:[m1 rangeOfString:@"<li>"].location + 11];
            NSLog(@"ret=%@",[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]);
            [((Day*)_listDay[index]).garniture addObject:[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]];
            
        }
        while([m1 rangeOfString:@"<li>"].location < [m1 rangeOfString:@"</ul>"].location);
        
        
        do{
            m1 = [m1 substringFromIndex:[m1 rangeOfString:@"<li>"].location + 11];
            NSLog(@"ret=%@",[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]);
            [((Day*)_listDay[index]).plat addObject:[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]];
            
        }
        while([m1 rangeOfString:@"<li>"].location < [m1 rangeOfString:@"</ul>"].location);
        
        
        do{
            m1 = [m1 substringFromIndex:[m1 rangeOfString:@"<li>"].location + 11];
            NSLog(@"ret=%@",[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]);
            [((Day*)_listDay[index]).dessert addObject:[m1 substringToIndex:[m1 rangeOfString:@"</span>"].location]];
            
        }
        while([m1 rangeOfString:@"<li>"].location < [m1 rangeOfString:@"</ul>"].location);
        index +=1;
    }
    CGSize size = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height/3);
    _scrol.contentSize = size;
    _scrol.showsHorizontalScrollIndicator = false;
    UIImageView *Vimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fleche"]];
    CGRect Vrect = Vimg.frame;
    Vrect.origin.x = 15;
    Vrect.origin.y = 40 ;
    
    Vimg.frame = Vrect;
    [self.view addSubview:Vimg];
    vtype = 2;
    [self drawrec:_labPlat];
    [self drawLab:((Day*)_listDay[0]).plat];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)drawrec:(UILabel *)lab{
    
    _line1.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y  -8  , lab.frame.size.width +  16, 1);
    
    
    _line2.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y + lab.frame.size.height  + 8  , lab.frame.size.width +  16, 1);
    
    
    _line3.frame = CGRectMake(lab.frame.origin.x - 8, lab.frame.origin.y - 8  , 1, lab.frame.size.height + 16);
    
    
    _line4.frame = CGRectMake(lab.frame.origin.x + 8  +lab.frame.size.width, lab.frame.origin.y - 8  , 1, lab.frame.size.height + 17);
}



@end
