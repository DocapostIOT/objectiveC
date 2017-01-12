//
//  ViewController.m
//  DominoStandHubBLE
//
//  Created by Quentin Gras on 10/10/2016.
//  Copyright © 2016 Quentin Gras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


BLE *ble;


UIFont *font;
UILabel *labSon;
UILabel *labTemp;
UILabel *labHydro;
UIImageView *Aimg;

- (IBAction)cl1:(id)sender {
    UInt8 buf[20];
    [@"c" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"c".length];
    [ble write:data];
}
- (IBAction)cl2:(id)sender {
    UInt8 buf[20];
    [@"p" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"p".length];
    [ble write:data];
}
- (IBAction)cl3:(id)sender {
    UInt8 buf[20];
    [@"a" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"a".length];
    [ble write:data];
}



//delegate added to sdk
- (void)startScanning{
    if (ble.activePeripheral)
        if(ble.activePeripheral.state == CBPeripheralStateConnected)
        {
            [[ble CM] cancelPeripheralConnection:[ble activePeripheral]];
            return;
        }
    
    if (ble.peripherals)
        ble.peripherals = nil;
    
    [ble findBLEPeripherals:2];
    
    [NSTimer scheduledTimerWithTimeInterval:(float)2.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
}

UIImageView *imv2;
int offx = 0;
int offy = 0;
int xval = 0;
int nbAfter = 0;
float reduc = 0;
float initx= 0;
float inity = 0;
float rapSc = 0;
bool once = true;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _indicator.hidesWhenStopped = true;
    nbAfter = 0;
    
    //[_indicator startAnimating];
    rapSc = self.view.frame.size.width / 375;
    font = [UIFont fontWithName:@"Helvetica" size:17];
    labSon = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 17)];
    labTemp = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 17)];
    labHydro = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 17)];
    [self initScroll];

    _scroll.delegate = self;
    self.view.backgroundColor = [UIColor colorWithRed:0.68 green:0.83 blue:0.87 alpha:1];
    
    
    imv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    CGRect rect1 = imv2.frame;
    rect1.origin.x = self.view.frame.size.width/1.9 - imv2.frame.size.width/2  ;
    rect1.origin.y =  self.view.frame.size.width / 5;
    
    rect1.size.height = rect1.size.height*rapSc;
    rect1.size.width = rect1.size.width*rapSc;
    
    
    if (rapSc < 1)
        offx = rect1.origin.x + 30 * rapSc;
    else
        offx = rect1.origin.x + 17 * rapSc;
    
    offy = rect1.origin.y - 25  ;
    initx = rect1.size.width;
    inity = rect1.size.height;
    imv2.frame = rect1;
    [self.view insertSubview:imv2 atIndex:2];
    reduc = 1 - ((xval - 35  * rapSc
                  )/imv2.frame.size.width);
    // Do any additional setup after loading the view, typically from a nib.
    if (once){
        ble = [[BLE alloc] init];
        [ble controlSetup];
        once = false;
    }
    ble.delegate = self;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //0 a 90
    CGRect rect1 = imv2.frame;
    float v2 =(_scroll.contentOffset.y / 250);
    if (v2 < 0)
        v2 = 0;
    if (v2 > 1)
        v2 = 1;
    rect1.origin.x = self.view.frame.size.width/1.9 - imv2.frame.size.width/2  - (v2)*offx ;
    rect1.origin.y = self.view.frame.size.width / 5 - (v2)*offy ;
    

    float val = (fabs( _scroll.contentOffset.y - 250)/ 250);
    if (_scroll.contentOffset.y > 250 )
        val = 0;
    rect1.size.height = inity * (1 - (reduc*(1 - val)));
    rect1.size.width = initx * (1 - (reduc*(1 -val)));
    imv2.frame = rect1;
//[_indicator stopAnimating];
   
}



-(void) bleDidConnect
{
  //  [_indicator stopAnimating];
    NSLog(@"->Connected");
    _text.text = @"Connected";
}

- (void)bleDidDisconnect
{
    NSLog(@"->Disconnected");
    _text.text = @"Not connected";
    [self startScanning];
}



//recieved data
-(void) bleDidReceiveData:(unsigned char *)data length:(int)length
{
    NSLog(@"Length: %d", length);
    
    data[length] = 0;
    NSString *str = [NSString stringWithCString:data encoding:NSUTF8StringEncoding];
    
    if ([str hasPrefix:@"t"]){
        labTemp.text = [[[str substringFromIndex:1] substringToIndex:2] stringByAppendingString:@" °C"];
    }
    if ([str hasPrefix:@"s"]){
        int v = [str substringFromIndex:1].intValue;
        int res = (v*100)/400;
        NSString *str =  [NSString stringWithFormat:@"%d",res];
        //str = [str substringToIndex:2];
        NSString *test = [str stringByAppendingString:@" %"];
        _sound.text = test;
        labSon.text = test;
    }
    if ([str hasPrefix:@"h"]){
        if ([[str substringFromIndex:1] hasPrefix:@"99"])
            return;
        if ([[str substringFromIndex:1] hasPrefix:@"0"])
            return;
        _hum.text = [[[str substringFromIndex:1] substringToIndex:2] stringByAppendingString:@" %"];
        labHydro.text = [[[str substringFromIndex:1] substringToIndex:2] stringByAppendingString:@" %"];
    }
    
    
    
    /*
     NSLog(@"%@", str);
    if([str isEqualToString:@"Up"]){
        _text.text = @"On Click";
        NSLog(@"Click on board");
    }
    if([str isEqualToString:@"Down"]){
        _text.text = @"Not on click";
        NSLog(@"UnClick on board");
    }
    
    static NSMutableString *message;
    
    if (message == nil)
        message = [[NSMutableString alloc] initWithString:@""];
    
    [message appendString:str];
    [message appendString:@"\n"];*/
    
}


-(void) connectionTimer:(NSTimer *)timer
{
    if (ble.peripherals.count > 0)
    {
        [ble connectPeripheral:[ble.peripherals objectAtIndex:0]];
    }
    else
    {
        [self startScanning];
    }
}

- (void) menu: (UITapGestureRecognizer *)recognizer{
    NSLog(@"Menu");
    [self performSegueWithIdentifier:@"menu" sender:self];
}

- (void) vol: (UITapGestureRecognizer *)recognizer{
    NSLog(@"volume");
    UInt8 buf[20];
    [@"s" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"s".length];
    [ble write:data];
}


- (void) miam: (UITapGestureRecognizer *)recognizer{
    NSLog(@"miam");
    UInt8 buf[20];
    [@"c" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"c".length];
    [ble write:data];
}


- (void) pose: (UITapGestureRecognizer *)recognizer{
    NSLog(@"Pose");
    UInt8 buf[20];
    [@"p" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"p".length];
    [ble write:data];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/pause"]];
    [request setHTTPMethod:@"POST"];
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(responseData)  {
        NSString *ret = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"res---%@", ret);
    }
}



- (void) after: (UITapGestureRecognizer *)recognizer{
    NSLog(@"After");
    if (nbAfter > 25)
        return;
    nbAfter += 1;
    UInt8 buf[20];
    [@"a" getCString:buf maxLength:20 encoding:NSUTF8StringEncoding];
    UILabel *line31 =  [[UILabel alloc]initWithFrame:CGRectMake(Aimg.frame.size.width/2 - Aimg.frame.size.width/7 + 1, Aimg.frame.size.height/2 + 3 - nbAfter ,Aimg.frame.size.width/7 * 1.5 ,1)];
    line31.text = @"";
    line31.backgroundColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    [Aimg addSubview:line31];
    NSData *data = [[NSData alloc] initWithBytes:buf length:@"a".length];
    [ble write:data];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://docapost-iot.cspvdi.fr/api/teamIOapp/aft"]];
    [request setHTTPMethod:@"POST"];
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(responseData)  {
        NSString *ret = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"res---%@", ret);
    }
}



- (void) stat: (UITapGestureRecognizer *)recognizer{
    NSLog(@"Stat");
    [self performSegueWithIdentifier:@"stat" sender:self];

}

- (void) porte: (UITapGestureRecognizer *)recognizer{
    NSLog(@"Porte");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Vous pourrez bientôt ouvrir la porte"
                                                    message:@"Soon..."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) propos: (UITapGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"propos" sender:self];

    NSLog(@"propos");
}

- (void) joke: (UITapGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"joke" sender:self];

    NSLog(@"Joke");
}



-(void) initScroll{
    
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"img5",@"img7",@"img6",@"img5",@"img4",@"img3",@"img2", nil];
    NSUInteger count = [arr count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [arr exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    UIImageView *imv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
    CGRect rect1 = imv2.frame;
    if( rapSc >= 1)
        rect1.origin.x = self.view.frame.size.width - imv2.frame.size.width  - 25 * rapSc;
    else
        rect1.origin.x = self.view.frame.size.width - imv2.frame.size.width ;

    rect1.origin.y =  self.view.frame.size.height / 3;
    
    rect1.size.height = rect1.size.height*rapSc;
    rect1.size.width = rect1.size.width*rapSc;
    
    imv2.frame = rect1;
    [_scroll insertSubview:imv2 atIndex:2];
    
    imv2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menu:)];
    [imv2 addGestureRecognizer:tapGestureRecognizer2];
    
    
    
    UIImageView *imv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[0]]];
    CGRect rect2 = imv1.frame;
    rect2.origin.x = imv2.frame.origin.x - (imv2.frame.size.width)/2 + 1;
    rect2.origin.y =  imv2.frame.origin.y + ((3 * imv2.frame.size.height)/4)-1;
    
    rect2.size.height = rect2.size.height*rapSc;
    rect2.size.width = rect2.size.width*rapSc;
    
    imv1.frame = rect2;
    [_scroll insertSubview:imv1 atIndex:2];
    
    
    UIImageView *imv3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    CGRect rect3 = imv3.frame;
    rect3.origin.x = imv2.frame.origin.x - 2*(imv2.frame.size.width) + 4;
    rect3.origin.y =  imv2.frame.origin.y ;
    
    rect3.size.height = rect3.size.height*rapSc;
    rect3.size.width = rect3.size.width*rapSc;
    
    imv3.frame = rect3;
    [_scroll insertSubview:imv3 atIndex:2];
    
    UIImageView *Vimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vol"]];
    CGRect Vrect = Vimg.frame;
    Vrect.origin.x = imv1.frame.origin.x - (imv1.frame.size.width) + 1;
    Vrect.origin.y =  imv1.frame.origin.y ;
    
    Vrect.size.height = Vrect.size.height*rapSc;
    Vrect.size.width = Vrect.size.width*rapSc;
    
    Vimg.frame = Vrect;
    [_scroll insertSubview:Vimg atIndex:2];
    
    Vimg.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGestureRecognizervol = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vol:)];
    [Vimg addGestureRecognizer:tapGestureRecognizervol];
    
    
    labSon.text = @"85 %";
    labSon.font = font;
    labSon.numberOfLines = 1;
    labSon.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labSon.adjustsFontSizeToFitWidth = YES;
    labSon.adjustsLetterSpacingToFitWidth = YES;
    labSon.clipsToBounds = YES;
    labSon.backgroundColor = [UIColor clearColor];
    labSon.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labSon.textAlignment = NSTextAlignmentCenter;
   [labSon setCenter:CGPointMake(Vimg.frame.origin.x + Vimg.frame.size.width/2 + 2, Vimg.frame.origin.y + Vimg.frame.size.height/2)  ];
    [_scroll addSubview:labSon];
    
    
    
    
    UIImageView *Mimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"miam"]];
    CGRect Mrect = Mimg.frame;
    Mrect.origin.x = Vimg.frame.origin.x - (Vimg.frame.size.width) + 1;
    Mrect.origin.y =  Vimg.frame.origin.y ;
    xval = Mrect.origin.x;
    
    Mrect.size.height = Mrect.size.height*rapSc;
    Mrect.size.width = Mrect.size.width*rapSc;
    
    Mimg.frame = Mrect;
    [_scroll insertSubview:Mimg atIndex:2];
    
    Mimg.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGestureRecognizerMiam = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(miam:)];
    [Mimg addGestureRecognizer:tapGestureRecognizerMiam];
    
    
    
    UIImageView *img4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[1]]];
    CGRect rect4 = img4.frame;
    rect4.origin.x = Vimg.frame.origin.x + (Vimg.frame.size.width)/2 - 1;
    rect4.origin.y =  Vimg.frame.origin.y + ((3 * Vimg.frame.size.height)/4)-1;
    
    rect4.size.height = rect4.size.height*rapSc;
    rect4.size.width = rect4.size.width*rapSc;
    
    img4.frame = rect4;
    [_scroll insertSubview:img4 atIndex:2];
    
    UIImageView *Pimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pose"]];
    CGRect Prect = Pimg.frame;
    Prect.origin.x = img4.frame.origin.x + (img4.frame.size.width)/2 - 1;
    Prect.origin.y =  img4.frame.origin.y + ((3 * img4.frame.size.height)/4)-1;
    
    Prect.size.height = Prect.size.height*rapSc;
    Prect.size.width = Prect.size.width*rapSc;
    
    Pimg.frame = Prect;
    [_scroll insertSubview:Pimg atIndex:2];
    
    Pimg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerPose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pose:)];
    [Pimg addGestureRecognizer:tapGestureRecognizerPose];
    
    
    UIImageView *imgC = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[2]]];
    CGRect rectC = imgC.frame;
    rectC.origin.x = Pimg.frame.origin.x - 2*(Pimg.frame.size.width) + 2;
    rectC.origin.y =  Pimg.frame.origin.y ;
    
    rectC.size.height = rectC.size.height*rapSc;
    rectC.size.width = rectC.size.width*rapSc;
    
    imgC.frame = rectC;
    [_scroll insertSubview:imgC atIndex:2];
    
    
    Aimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"after"]];
    CGRect Arect = Aimg.frame;
    Arect.origin.x = Pimg.frame.origin.x - (Pimg.frame.size.width)/2 + 1;
    Arect.origin.y =  Pimg.frame.origin.y + ((3 * Pimg.frame.size.height)/4)-1;
    
    Arect.size.height = Arect.size.height*rapSc;
    Arect.size.width = Arect.size.width*rapSc;
    
    Aimg.frame = Arect;
    [_scroll insertSubview:Aimg atIndex:2];
    
    
    Aimg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerAfter = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(after:)];
    [Aimg addGestureRecognizer:tapGestureRecognizerAfter];
    
    UIImageView *img7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[3]]];
    CGRect rect7 = img7.frame;
    rect7.origin.x = Aimg.frame.origin.x + (Aimg.frame.size.width)/2 - 1;
    rect7.origin.y =  Aimg.frame.origin.y + ((3 * Aimg.frame.size.height)/4)-1;
    
    rect7.size.height = rect7.size.height*rapSc;
    rect7.size.width = rect7.size.width*rapSc;
    
    img7.frame = rect7;
    [_scroll insertSubview:img7 atIndex:2];
    
    
    UIImageView *imgT = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1"]];
    CGRect rectT = imgT.frame;
    rectT.origin.x = img7.frame.origin.x - 2*(img7.frame.size.width) + 2;
    rectT.origin.y =  img7.frame.origin.y ;
    
    rectT.size.height = rectT.size.height*rapSc;
    rectT.size.width = rectT.size.width*rapSc;
    
    imgT.frame = rectT;
    [_scroll insertSubview:imgT atIndex:2];
    
    
    labTemp.text = @"24 °C";
    labTemp.font = font;
    labTemp.numberOfLines = 1;
    labTemp.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labTemp.adjustsFontSizeToFitWidth = YES;
    labTemp.adjustsLetterSpacingToFitWidth = YES;
    labTemp.clipsToBounds = YES;
    labTemp.backgroundColor = [UIColor clearColor];
    labTemp.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labTemp.textAlignment = NSTextAlignmentCenter;
    [labTemp setCenter:CGPointMake(imgT.frame.origin.x + imgT.frame.size.width/2 + 2, imgT.frame.origin.y + imgT.frame.size.height/2)  ];
    [_scroll addSubview:labTemp];
    
    
    UIImageView *imgH = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hygro"]];
    CGRect rectH = imgH.frame;
    rectH.origin.x = img7.frame.origin.x + (img7.frame.size.width)/2 - 1;
    rectH.origin.y =  img7.frame.origin.y + ((3 * img7.frame.size.height)/4)-1;
    
    rectH.size.height = rectH.size.height*rapSc;
    rectH.size.width = rectH.size.width*rapSc;
    
    imgH.frame = rectH;
    [_scroll insertSubview:imgH atIndex:2];
    
    
    
    labHydro.text = @"54 %";
    labHydro.font = font;
    labHydro.numberOfLines = 1;
    labHydro.baselineAdjustment = UIBaselineAdjustmentAlignCenters; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labHydro.adjustsFontSizeToFitWidth = YES;
    labHydro.adjustsLetterSpacingToFitWidth = YES;
    labHydro.clipsToBounds = YES;
    labHydro.backgroundColor = [UIColor clearColor];
    labHydro.textColor = [UIColor colorWithRed:0.35 green:0.26 blue:0.58 alpha:1];
    labHydro.textAlignment = NSTextAlignmentCenter;
    [labHydro setCenter:CGPointMake(imgH.frame.origin.x + imgH.frame.size.width/2 + 2, imgH.frame.origin.y + imgH.frame.size.height/2 - 5)  ];
    [_scroll addSubview:labHydro];
    
    
    
    UIImageView *imgS = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stat"]];
    CGRect rectS = imgS.frame;
    rectS.origin.x = imgH.frame.origin.x - 3*((imgH.frame.size.width)/2) - 1;
    rectS.origin.y =  imgH.frame.origin.y + ((3 * imgH.frame.size.height)/4)-1;
    
    rectS.size.height = rectS.size.height*rapSc;
    rectS.size.width = rectS.size.width*rapSc;
    
    imgS.frame = rectS;
    [_scroll insertSubview:imgS atIndex:2];
    
    imgS.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerStat = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stat:)];
    [imgS addGestureRecognizer:tapGestureRecognizerStat];
    
    
    
    UIImageView *imgSt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    CGRect rectSt = imgSt.frame;
    rectSt.origin.x = imgS.frame.origin.x + 1;
    rectSt.origin.y =  imgS.frame.origin.y - (imgS.frame.size.height);
    
    rectSt.size.height = rectSt.size.height*rapSc;
    rectSt.size.width = rectSt.size.width*rapSc;
    
    imgSt.frame = rectSt;
    [_scroll insertSubview:imgSt atIndex:2];
    
    
    
    
    UIImageView *img5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[4]]];
    CGRect rect5 = img5.frame;
    rect5.origin.x = imgS.frame.origin.x - (imgS.frame.size.width) + 1;
    rect5.origin.y =  imgS.frame.origin.y ;
    
    rect5.size.height = rect5.size.height*rapSc;
    rect5.size.width = rect5.size.width*rapSc;
    
    img5.frame = rect5;
    [_scroll insertSubview:img5 atIndex:2];
    
    
    UIImageView *img3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[5]]];
    CGRect re3 = imgS.frame;
    re3.origin.x = imgS.frame.origin.x + ((imgS.frame.size.width)/2) - 1;
    re3.origin.y =  imgS.frame.origin.y + ((3 * imgS.frame.size.height)/4)-1;
/*
    re3.size.height = re3.size.height*rapSc;
    re3.size.width = re3.size.width*rapSc;
  */
    img3.frame = re3;
    [_scroll insertSubview:img3 atIndex:2];
    
    
    UIImageView *imgSe = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"porte"]];
    CGRect rectSe = imgSe.frame;
    rectSe.origin.x = img3.frame.origin.x + (img3.frame.size.width) - 1;
    rectSe.origin.y =  img3.frame.origin.y ;
    
    rectSe.size.height = rectSe.size.height*rapSc;
    rectSe.size.width = rectSe.size.width*rapSc;
    
    imgSe.frame = rectSe;
    [_scroll insertSubview:imgSe atIndex:2];
    
    imgSe.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerPorte = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(porte:)];
    [imgSe addGestureRecognizer:tapGestureRecognizerPorte];
    
    
    UIImageView *imgP = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"propos"]];
    CGRect reP = imgP.frame;
    reP.origin.x = img3.frame.origin.x - ((img3.frame.size.width)/2) + 1;
    reP.origin.y =  img3.frame.origin.y + ((3 * img3.frame.size.height)/4)-1;
    
    reP.size.height =reP.size.height*rapSc;
    reP.size.width = reP.size.width*rapSc;
    
    imgP.frame = reP;
    [_scroll insertSubview:imgP atIndex:2];
    
    imgP.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerPropos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(propos:)];
    [imgP addGestureRecognizer:tapGestureRecognizerPropos];
    
    
    UIImageView *imgJ = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"joke"]];
    CGRect reJ = imgJ.frame;
    reJ.origin.x = imgP.frame.origin.x - ((imgP.frame.size.width)/2) + 1;
    reJ.origin.y =  imgP.frame.origin.y + ((3 * imgP.frame.size.height)/4)-1;
    
    reJ.size.height = reJ.size.height*rapSc;
    reJ.size.width = reJ.size.width*rapSc;
    
    imgJ.frame = reJ;
    [_scroll insertSubview:imgJ atIndex:2];
    
    imgJ.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizerJoke = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(joke:)];
    [imgJ addGestureRecognizer:tapGestureRecognizerJoke];
    
    
    UIImageView *imgf = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[6]]];
    CGRect rectf = imgf.frame;
    rectf.origin.x = imgJ.frame.origin.x + 2*(imgJ.frame.size.width) + 2;
    rectf.origin.y =  imgJ.frame.origin.y ;
    
    rectf.size.height = rectf.size.height*rapSc;
    rectf.size.width = rectf.size.width*rapSc;
    
    imgf.frame = rectf;
    [_scroll insertSubview:imgf atIndex:2];
    
    
   
    
    
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in _scroll.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    CGSize size = CGSizeMake(self.view.frame.size.width, contentRect.size.height + 10);
    _scroll.contentSize = size;
}



@end
