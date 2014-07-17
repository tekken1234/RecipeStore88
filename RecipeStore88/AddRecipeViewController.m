//
//  AddRecipeViewController.m
//  RecipeStore88
//
//  Created by admin on 14/7/16.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "AddRecipeViewController.h"

@implementation AddRecipeViewController

-(NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)Save:(id)sender {

    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newRecipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
    [newRecipe setValue:self.nameTextField.text forKey:@"name"];
    [newRecipe setValue:self.imageTextField.text forKey:@"image"];
    [newRecipe setValue:self.prepTimeTextField.text forKey:@"prepTime"];

    NSError *error = nil;
    
    if (![context save:&error]){
        NSLog(@"Can't Save! %@  -- %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Cancel:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
