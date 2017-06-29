//
//  ViewController1.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "ViewController1.h"
#import "VC1DetailViewController.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClicked)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBarButtonItemClicked
{
    VC1DetailViewController *viewController = [[VC1DetailViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
