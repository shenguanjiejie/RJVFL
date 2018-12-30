//
//  TableViewController.m
//  RJVFL
//
//  Created by shenruijie on 2018/12/29.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"四周对齐约束";
            break;
        case 1:
            cell.textLabel.text = @"宽高约束及外部四周约束";
            break;
        case 2:
            cell.textLabel.text = @"Center约束";
            break;
        case 3:
            cell.textLabel.text = @"串约束";
            break;
        case 4:
            cell.textLabel.text = @"不规则串约束";
            break;
        case 5:
            cell.textLabel.text = @"复杂约束";
            break;
        default:
            cell.textLabel.text = @"";
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /**RJ 2018-12-29 18:54:27 这里跳转正常来说应该定义一个枚举,demo偷懒了*/
    ViewController *viewController = [[ViewController alloc] init];
    viewController.index = indexPath.row;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
