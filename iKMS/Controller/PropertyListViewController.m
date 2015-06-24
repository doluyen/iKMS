//
//  PropertyListViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "PropertyListViewController.h"
#import "PropertyObject.h"
#import "CellPropertyList.h"
#import "PropertyDetailViewController.h"
#import "SVPullToRefresh.h"

@interface PropertyListViewController ()

@end

@implementation PropertyListViewController
@synthesize listResources;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    listResources = [NSMutableArray new];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onProcessAddProperty)];
    self.navigationItem.rightBarButtonItem = item;
    __weak PropertyListViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf sendRequestProperty];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView triggerPullToRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendRequestProperty{
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetPropertyAll parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.tableView.pullToRefreshView stopAnimating];
//        NSLog(@"response GetGetPropertyAll: %@", responseObject);
        [listResources removeAllObjects];
        if ([responseObject count]>0) {
            for (int i=0; i<[responseObject count]; i++) {
                PropertyObject *object = [[PropertyObject alloc] initWithData:[responseObject objectAtIndex:i]];
                [listResources addObject:object];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.tableView.pullToRefreshView stopAnimating];
        NSLog(@"error GetPropertyAll: %@", error.description);
    }];
}

-(void)onProcessAddProperty{
    PropertyDetailViewController *controller = (PropertyDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"PropertyDetailViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [listResources count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellPropertyList *cell = (CellPropertyList *)[tableView dequeueReusableCellWithIdentifier:@"CellPropertyList"];
    [cell loadUIWithData:[listResources objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PropertyDetailViewController *controller = (PropertyDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"PropertyDetailViewController"];
    controller.m_property = [listResources objectAtIndex:indexPath.row];
    controller.m_current_index = indexPath.row;
    controller.listContacts = listResources;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
