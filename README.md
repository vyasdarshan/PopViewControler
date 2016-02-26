# PopViewControler
1.We have developerd popup view for iphone/ipad projects,developer should add manuly popover folder into project.
2. import #import "FPPopoverController.h" into your project.
3. create property for view controler to access popup view .
"@property (strong, nonatomic) FPPopoverController *popover;"
4. add below code in your action , it will show pop up in viewcontroler .

 // assing which viewcontroller you want to pop up
    self.isLoginpop = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
    // set frame of the pop up
    self.isLoginpop.view.frame = CGRectMake(0, 0, 200, 200);
    // set which view controller you want to show in popup view
    self.popover = [[FPPopoverController alloc]initWithViewController:self.isLoginpop];
     self.popover.contentSize = CGSizeMake(self.view.frame.size.width-20,self.view.frame.size.height/2);
    self.popover.border = NO;
 [self.popover presentPopoverFromView:self.lbllogin];
 
 5. made changes as per your requirement .
