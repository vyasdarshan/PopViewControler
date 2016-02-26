//
//  ViewController.h
//  PopViewControler
//
//  Created by Ashish Chauhan on 25/02/16.
//  Copyright (c) 2016 Ashish Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *alternateMobileNumberISDCode;

@property (weak, nonatomic) IBOutlet UILabel *lbllogin;

- (void)selectedISDTableRow:(NSString *)isdCode;
@end
