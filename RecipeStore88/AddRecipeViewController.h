//
//  AddRecipeViewController.h
//  RecipeStore88
//
//  Created by admin on 14/7/16.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRecipeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *imageTextField;
@property (weak, nonatomic) IBOutlet UITextField *prepTimeTextField;
- (IBAction)Save:(id)sender;
- (IBAction)Cancel:(id)sender;

@end
