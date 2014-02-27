//
//  ViewController.m
//  Radix Sort
//
//  Created by Stevenson on 27/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+RadixSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *anArray = [NSMutableArray new];
    NSInteger maxNumber = 1000;
    for (int i=0; i<1000; i++) {
        NSInteger value = (NSInteger)rand()%maxNumber;
        [anArray addObject:@(value)];
    }
    NSMutableArray *sortedArray = [NSMutableArray radixSort:anArray forBase:10];
    
    NSLog(@"%@",sortedArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
