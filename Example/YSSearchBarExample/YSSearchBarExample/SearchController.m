//
//  SearchController.m
//  YSSearchBarExample
//
//  Created by Yu Sugawara on 2016/02/25.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "SearchController.h"
#import "YSSearchBar.h"

@interface SearchController ()

@end

@implementation SearchController
{
    UISearchBar *_searchBar;
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[YSSearchBar alloc] init];
    }
    return _searchBar;
}

@end
