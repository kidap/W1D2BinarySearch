//
//  main.m
//  W1D2BinarySearch
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>

//Binary search Part 1
NSMutableArray *searchNumber(NSArray *array, int findNumber){
  NSMutableArray *resultIndices = [[NSMutableArray alloc] init];
  int index = 0;
  
  for (NSString * number in array){
    int numberAtIndex = 0;
    
    numberAtIndex = [number intValue];
    
    if (numberAtIndex == findNumber){
      [resultIndices addObject:[NSNumber numberWithInt:index]];
    }
    index ++;
  }
  
  return resultIndices;
}


int main(int argc, const char * argv[]) {
  @autoreleasepool {

    NSArray *sortedArray = @[@2, @3, @3, @5, @6, @6];
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    int findNumber = 3;
    
    resultArray = searchNumber(sortedArray, findNumber);
    
    NSLog(@"The index of the number %d is %@", findNumber, resultArray );
    
    
  }
    return 0;
}

