//
//  BinarySearchTree.h
//  W1D2BinarySearch
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

@interface BinarySearchTree : NSObject

@property (nonatomic, strong) BinaryTreeNode *root;

-(instancetype)initWithObject:(NSObject *) object;
-(void)insertObject:(NSObject *)newObject;
-(BinaryTreeNode *)find:(NSObject *) object;
-(BinaryTreeNode *)deleteObject:(NSObject *) object;


@end
