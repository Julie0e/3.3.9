//
//  ViewController.m
//  3.3.9
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 100

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *data;
    NSInteger dollar;
}

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gamePrice;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UIButton *p1;
@property (weak, nonatomic) IBOutlet UIButton *p2;
@property (weak, nonatomic) IBOutlet UIButton *p3;
@property (weak, nonatomic) IBOutlet UIButton *p4;
@property (weak, nonatomic) IBOutlet UIButton *p5;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (IBAction)p1:(id)sender {
    dollar = 1;
    dollar = dollar * 100;
        self.price.text =[NSString stringWithFormat:@"%d", (int)dollar];
}
- (IBAction)p2:(id)sender {
    dollar = 1;
    dollar = dollar * 200;
    self.price.text =[NSString stringWithFormat:@"%d", (int)dollar];
}
- (IBAction)p3:(id)sender {
    dollar = 1;
    dollar = dollar * 300;
    self.price.text =[NSString stringWithFormat:@"%d", (int)dollar];
}

- (IBAction)p4:(id)sender {
    dollar = 1;
    dollar = dollar * 400;
    self.price.text =[NSString stringWithFormat:@"%d", (int)dollar];
}
- (IBAction)p5:(id)sender {
    dollar = 1;
    dollar = dollar * 500;
    self.price.text =[NSString stringWithFormat:@"%d", (int)dollar];
}

- (IBAction)startRandom:(id)sender {
    
    int r1 = arc4random() % MAX_NUM;
    int r2 = arc4random() % MAX_NUM;
    int r3 = arc4random() % MAX_NUM;
    [self.picker selectRow:r1 inComponent:0 animated:YES];
    [self.picker selectRow:r2 inComponent:1 animated:YES];
    [self.picker selectRow:r3 inComponent:2 animated:YES];
    
    if (r1%10 == r2%10 && r1%10 == r3%10)
    {
        dollar = dollar*100;
        self.totalPrice.text =[NSString stringWithFormat:@"%d", (int)dollar];
        dollar = dollar/100;
    }
    
    else if (r1%10 == r2%10 || r1%10 == r3%10 || r2%10 == r3%10)
    {
        dollar = dollar*10;
        self.totalPrice.text = [NSString stringWithFormat:@"%d", (int)dollar];
        dollar = dollar/10;
    }
    

    else
    {
        self.totalPrice.text =[NSString stringWithFormat:@"다음기회에"];
        
    }

}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0 || component == 1 || component == 2 ) {
        return MAX_NUM;
    }
    else{
        return [data count];
    }
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    NSString *imagePath = [NSString stringWithFormat:@"image%d.png",(int)row%10];
    UIImage *image = [UIImage imageNamed:imagePath];
    UIImageView * imageView;

    if (view == nil) {
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0,0,100,60);
    }
    else
    {
        imageView = (UIImageView *)view;
        imageView.image = image;
    }
    return imageView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
