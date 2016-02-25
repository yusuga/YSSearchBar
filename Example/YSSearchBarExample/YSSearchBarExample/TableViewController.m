//
//  TableViewController.m
//  YSSearchBarExample
//
//  Created by Yu Sugawara on 2016/02/25.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "TableViewController.h"
#import "YSSearchBar.h"
#import "SearchController.h"

@interface TableViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet YSSearchBar *searchBar1;
@property (weak, nonatomic) IBOutlet YSSearchBar *searchBar2;
@property (weak, nonatomic) IBOutlet YSSearchBar *searchBar3;
@property (weak, nonatomic) IBOutlet YSSearchBar *searchBar4;

@property (weak, nonatomic) UISearchController *searchController;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *(^createLeftButton)(void) = ^{
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [leftButton setTitle:@"LEFT" forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        return leftButton;
    };
    
    UIButton *(^createRightButton)(void) = ^{
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [rightButton setTitle:@"RIGHT" forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        return rightButton;
    };
    
    self.searchBar1.placeholder = @"Default";
    
    self.searchBar2.placeholder = @"Left button";
    self.searchBar2.leftButton = createLeftButton();
    
    self.searchBar3.placeholder = @"Right button";
    self.searchBar3.rightButton = createRightButton();
    
    self.searchBar4.placeholder = @"Both buttons";
    self.searchBar4.leftButton = createLeftButton();
    self.searchBar4.rightButton = createRightButton();
}

- (IBAction)searchButtonClicked:(id)sender
{
    UIViewController *vc = [[UIViewController alloc] init];
    
    UISearchController *searchController = [[SearchController alloc] initWithSearchResultsController:vc];
    
    YSSearchBar *searchBar = (YSSearchBar *)searchController.searchBar;
    NSParameterAssert([searchBar isKindOfClass:[YSSearchBar class]]);
    searchBar.delegate = self;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    searchBar.leftButton = cancelButton;
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    doneButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
    searchBar.rightButton = doneButton;
    
    self.searchController = searchController;
    [self presentViewController:searchController animated:YES completion:nil];
}

- (void)leftButtonClicked:(UIButton *)sender
{
    NSLog(@"%s", __func__);
}

- (void)rightButtonClicked:(UIButton *)sender
{
    NSLog(@"%s", __func__);
}

- (void)cancelButtonClicked:(UIButton *)sender
{
    NSLog(@"%s", __func__);
    self.searchController.active = NO;
}

- (void)doneButtonClicked:(UIButton *)sender
{
    NSLog(@"%s", __func__);
    self.searchController.active = NO;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end
