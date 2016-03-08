//
//  BinarySearchTree.m
//  W1D2BinarySearch
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinaryTreeNode.h"

@implementation BinarySearchTree{
  int numberOfNodes;
}

-(instancetype)initWithObject:(NSObject *) object{
  self = [super init];
  
  //Initialize root node
  BinaryTreeNode *newNode = [[BinaryTreeNode alloc] init];
  newNode.object = object;
  self.root = newNode;
  
  return self;
}

-(void)insertObject:(NSObject *)newObject{
  //Initialize variable
  bool nodeNotFound = YES;
  BinaryTreeNode *currentNode = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *newNode = [[BinaryTreeNode alloc] init];
  newNode.object = newObject;
  
  //Start from root node
  currentNode = self.root;
  
  //Traverse the tree
  while (nodeNotFound){
    NSNumber *currentNodeNumber = (NSNumber *)currentNode.object;
    NSNumber *newNodeNumber = (NSNumber *)newNode.object;
    
    //If number is greater, go to the right side
    if ([newNodeNumber isGreaterThan:currentNodeNumber]){
      //Add to the right node if empty. Else, traverse down
      if (currentNode.rightChild == nil){
        currentNode.rightChild = newNode; //Set as right node of the current node
        newNode.parent = currentNode; //Set the current node as the parent node
        nodeNotFound = NO;
        numberOfNodes++;
        newNode.originalIndex = numberOfNodes;
      } else {
        currentNode = currentNode.rightChild;
      }
    } else {
      //If number is lesser, go to the left side
      //Add to the left node if empty. Else, traverse down
      if (currentNode.leftChild == nil){
        currentNode.leftChild = newNode; //Set as left node of the current node
        newNode.parent = currentNode; //Set the current node as the parent node
        nodeNotFound = NO;
        numberOfNodes++;
        newNode.originalIndex = numberOfNodes;
      } else {
        currentNode = currentNode.leftChild;
      }
    }
  }

}

-(BinaryTreeNode *)find:(NSObject *) object{
  //Initialize variable
  bool nodeNotFound = YES;
  BinaryTreeNode *currentNode = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *nodeToFind = [[BinaryTreeNode alloc] init];
  nodeToFind.object = object;
  
  //Start from root node
  currentNode = self.root;
  
  //Traverse the tree
  while (nodeNotFound){
    NSNumber *currentNodeNumber = (NSNumber *)currentNode.object;
    NSNumber *nodeToFindNumber = (NSNumber *)nodeToFind.object;
    
    //If number is found, return the node
    if ([nodeToFindNumber isEqualToNumber:currentNodeNumber]){
      return currentNode;
    } else if ([nodeToFindNumber isGreaterThan:currentNodeNumber]){
      //If number is greater, go to the right side
      //Add to the right node if empty. Else, traverse down
      if (currentNode.rightChild == nil){
        //currentNode.rightChild = newNode;
        nodeNotFound = NO;
      } else {
        currentNode = currentNode.rightChild;
      }
    } else {
      //If number is lesser, go to the left side
      //Add to the left node if empty. Else, traverse down
      if (currentNode.leftChild == nil){
        //currentNode.leftChild = newNode;
        nodeNotFound = NO;
      } else {
        currentNode = currentNode.leftChild;
      }
    }
  }

  return [[BinaryTreeNode alloc] init];
  
}
-(BinaryTreeNode *)deleteObject:(NSObject *) object{
  numberOfNodes--;
  
  return [[BinaryTreeNode alloc] init];
}

@end
