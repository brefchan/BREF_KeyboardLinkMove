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
 
    //添加监听
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    [KeyBoardLinkMoveUtility keyboardWillShow:notif linkView:_inputView];
}


- (void)keyboardWillHidden:(NSNotification *)notif
{
    [KeyBoardLinkMoveUtility keyboardWillHidden:notif linkView:_inputView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
