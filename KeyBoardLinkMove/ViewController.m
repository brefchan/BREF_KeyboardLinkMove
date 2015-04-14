//
//  ViewController.m
//  KeyBoardLinkMove
//
//  Created by bref on 15/4/11.
//  Copyright (c) 2015年 bref. All rights reserved.
//

#import "ViewController.h"
#import "KeyBoardLinkMoveUtility.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *inputView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [[KeyBoardLinkMoveUtility sharedInstance] addObserverWithLinkView:_inputView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
