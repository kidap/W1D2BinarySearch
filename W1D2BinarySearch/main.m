//
//  main.m
//  W1D2BinarySearch
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>

//-----------------------------------------------------
// Binary search Part 1
//-----------------------------------------------------
NSMutableArray *searchNumber(NSArray *array, int findNumber){
  NSMutableArray *resultIndices = [[NSMutableArray alloc] init];
  int index = 0;
  
  //Loop at all the numbers
  for (NSString * number in array){
    int numberAtIndex = 0;
    
    // Get int value of NSNumber
    numberAtIndex = [number intValue];
    
    //Check if the number equal to the current number
    if (numberAtIndex == findNumber){
      //Add the number to the result array
      [resultIndices addObject:[NSNumber numberWithInt:index]];
    }
    
    //Increment counter to monitor the index
    index ++;
  }
  
  if ([resultIndices count] == 0){
    [resultIndices addObject:[NSNumber numberWithInt:-1]];
  }
  return resultIndices;
}


int main(int argc, const char * argv[]) {
  @autoreleasepool {

    //-----------------------------------------------------
    // Binary search Part 1
    //-----------------------------------------------------
    NSArray *sortedArray = @[@2, @3, @3, @5, @6, @6];
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    int findNumber = 3;
    
    //Get the index
    resultArray = searchNumber(sortedArray, findNumber);
    
    //Print out
    NSLog(@"The index of the number %d is %@", findNumber, resultArray );
    
    
  }
    return 0;
}

