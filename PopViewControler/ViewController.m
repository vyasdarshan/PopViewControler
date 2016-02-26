//
//  ViewController.m
//  PopViewControler
//
//  Created by Ashish Chauhan on 25/02/16.
//  Copyright (c) 2016 Ashish Chauhan. All rights reserved.
//

#import "ViewController.h"
#import "ISDCodeSelectionTableViewController.h"
#import "Loginpop.h"
#import "FPPopoverController.h"

@interface ViewController ()
@property (nonatomic, strong) ISDCodeSelectionTableViewController *isdSelectionController;
@property (nonatomic, strong) Loginpop *isLoginpop;


@property (strong, nonatomic) FPPopoverController *popover;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectISDCodes)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.alternateMobileNumberISDCode addGestureRecognizer:tapGestureRecognizer];
    self.alternateMobileNumberISDCode.userInteractionEnabled = YES;

    
    
    
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(poplogin)];
    tapGestureRecognizer1.numberOfTapsRequired = 1;
    [self.lbllogin addGestureRecognizer:tapGestureRecognizer1];
    self.lbllogin.userInteractionEnabled = YES;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)selectedISDTableRow:(NSString *)isdCode {
    
    NSLog(@"Get Isdcode from %@ ",isdCode);
    
    [self.popover dismissPopoverAnimated:YES completion:^{
        self.alternateMobileNumberISDCode.text = isdCode;
    }];
}


-(void)poplogin
{
    // assing which viewcontroller you want to pop up
    self.isLoginpop = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
    // set frame of the pop up
    self.isLoginpop.view.frame = CGRectMake(0, 0, 200, 200);
    // set which view controller you want to show in popup view
    self.popover = [[FPPopoverController alloc]initWithViewController:self.isLoginpop];
     self.popover.contentSize = CGSizeMake(self.view.frame.size.width-20,self.view.frame.size.height/2);
    self.popover.border = NO;
 [self.popover presentPopoverFromView:self.lbllogin];

}


- (void)selectISDCodes {
    self.isdSelectionController = [self.storyboard instantiateViewControllerWithIdentifier:@"ISDCodeSelectionTableViewController"];
    
    self.isdSelectionController.view.frame = CGRectMake(0, 0, self.view.frame.size.width,200);
    self.popover = [[FPPopoverController alloc] initWithViewController:self.isdSelectionController];
    self.isdSelectionController.delegate = self;
    self.popover.tint = FPPopoverDefaultTint;
    self.popover.border = YES;
    self.popover.arrowDirection = FPPopoverArrowDirectionLeft;
    self.popover.contentSize = CGSizeMake(self.view.frame.size.width-5,self.view.frame.size.height-80);
    [self.popover presentPopoverFromView:self.alternateMobileNumberISDCode];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
