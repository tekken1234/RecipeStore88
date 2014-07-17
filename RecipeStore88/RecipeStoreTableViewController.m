//
//  RecipeStoreTableViewController.m
//  RecipeStore88
//
//  Created by admin on 14/7/16.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "RecipeStoreTableViewController.h"

@implementation RecipeStoreTableViewController {
    NSMutableArray *recipes;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectCon


sdfksdfksdlfjklsdjfklsdfsd