//
//  SectionViewController.m
//  YourRights
//
//  Created by Cyrus Najmabadi on 1/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SectionViewController.h"

#import "Model.h"
#import "QuestionsViewController.h"
#import "TitleCell.h"
#import "ViewControllerUtilities.h"

@interface SectionViewController()
@end


@implementation SectionViewController

- (void)dealloc {
    [super dealloc];
}


- (id) init {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.navigationItem.titleView =
        [ViewControllerUtilities viewControllerTitleLabel:NSLocalizedString(@"Know Your Rights", nil)];
    }
    
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Model sectionTitles] count];
}


- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath {
    NSString* text = [[Model sectionTitles] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [[[TitleCell alloc] initWithTitle:text] autorelease];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (CGFloat)         tableView:(UITableView*) tableView
      heightForRowAtIndexPath:(NSIndexPath*) indexPath {
   return [TitleCell height:[[Model sectionTitles] objectAtIndex:indexPath.row]];
}


- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    NSString* text = [[Model sectionTitles] objectAtIndex:indexPath.row];
    QuestionsViewController* controller = [[[QuestionsViewController alloc] initWithSectionTitle:text] autorelease];
    [self.navigationController pushViewController:controller animated:YES];
}



@end