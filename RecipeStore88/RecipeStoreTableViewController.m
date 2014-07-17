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
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    recipes = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSManagedObjectContext *recipe = [recipes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [recipe valueForKey:@"name"];
    
    NSString *description = [[NSString alloc]initWithFormat:@"%@ - %@", [recipe valueForKey:@"image"],
                             [recipe valueForKey:@"prepTime"]];
    
    cell.detailTextLabel.text = description;
    
    return cell;
}
@end
