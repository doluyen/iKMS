//
//  ContactListViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactObject.h"
#import "CellContactList.h"
#import "ContactDetailViewController.h"
#import "SVPullToRefresh.h"

@interface ContactListViewController ()

@end

@implementation ContactListViewController
@synthesize listContacts;
- (void)viewDidLoad {
    [super viewDidLoad];
    listContacts = [NSMutableArray new];
//    [self sendRequestContactList];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onProcessAddContact)];
    self.navigationItem.rightBarButtonItem = item;
    __weak ContactListViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf sendRequestContactList];
    }];
    self.navigationItem.title = @"Contacts";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView triggerPullToRefresh];
}

-(void)sendRequestContactList{
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetContactAll parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.tableView.pullToRefreshView stopAnimating];
        NSLog(@"response GetContactAll: %@", responseObject);
        [listContacts removeAllObjects];
        if ([responseObject count]>0) {
            
            for (int i=0; i<[responseObject count]; i++) {
                ContactObject *object = [[ContactObject alloc] initWithData:[responseObject objectAtIndex:i]];
                [listContacts addObject:object];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.tableView.pullToRefreshView stopAnimating];
        NSLog(@"error GetContactAll: %@", error.description);
    }];
}

-(void)onProcessAddContact{
    ContactDetailViewController *controller = (ContactDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ContactDetailViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [listContacts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellContactList *cell = [tableView dequeueReusableCellWithIdentifier:@"CellContactList"];
    [cell loadUIWithData:[listContacts objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactDetailViewController *controller = (ContactDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ContactDetailViewController"];
    controller.m_object = [listContacts objectAtIndex:indexPath.row];
    controller.m_current_index = indexPath.row;
    controller.listContacts = listContacts;
    [self.navigationController pushViewController:controller animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
