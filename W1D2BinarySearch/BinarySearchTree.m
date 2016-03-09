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
  while (nodeNotFound && currentNode != nil){
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
-(NSMutableArray *)findNodes:(NSObject *) object{
  NSMutableArray * resultArray = [[NSMutableArray alloc] init];
  
  //Initialize variable
  bool nodeNotFound = YES;
  bool foundOne = NO;
  BinaryTreeNode *currentNode = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *nodeToFind = [[BinaryTreeNode alloc] init];
  nodeToFind.object = object;
  
  //Start from root node
  currentNode = self.root;
  
  //Traverse the tree
  while (nodeNotFound && currentNode != nil){
    NSNumber *currentNodeNumber = (NSNumber *)currentNode.object;
    NSNumber *nodeToFindNumber = (NSNumber *)nodeToFind.object;
    
    //If number is found, return the node
    if ([nodeToFindNumber isEqualToNumber:currentNodeNumber]){
      [resultArray addObject: currentNode];
      foundOne = YES; //Flag to denote at least one node has been found
      if (currentNode.leftChild == nil){
        return resultArray;
      } else{
        currentNode = currentNode.leftChild; //Continue search the left side
      }
      
    } else if ([nodeToFindNumber isGreaterThan:currentNodeNumber]){
      //If number is greater, go to the right side
      //Add to the right node if empty. Else, traverse down
      if (currentNode.rightChild == nil){
        nodeNotFound = NO;
      } else {
        currentNode = currentNode.rightChild;
      }
    } else if ([nodeToFindNumber isLessThan:currentNodeNumber]){
      if (foundOne == YES){
        //Stop when don't find a match after finding a match in the previous level
        return resultArray;
      }
      //If number is lesser, go to the left side
      //Add to the left node if empty. Else, traverse down
      if (currentNode.leftChild == nil){
        nodeNotFound = NO;
      } else {
        currentNode = currentNode.leftChild;
      }
    } else{
      
    }
  }
  
  return [[NSMutableArray alloc] init];
  
}

-(BinaryTreeNode *)deleteObject:(NSObject *) object{
  BinaryTreeNode *nodeToDelete = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *parentNode = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *leftChild = [[BinaryTreeNode alloc] init];
  BinaryTreeNode *rightChild = [[BinaryTreeNode alloc] init];
  
  nodeToDelete = [self find:object];
  leftChild = nodeToDelete.leftChild;
  rightChild = nodeToDelete.rightChild;
  parentNode = nodeToDelete.parent;
  
  if (nodeToDelete != nil){
    //If there is only a right Child
    if(leftChild == nil && rightChild != nil){
      if (parentNode.leftChild == nodeToDelete){
        //Assign the node to the parent
        parentNode.leftChild = rightChild;
        rightChild.parent = parentNode;
        numberOfNodes--;
      } else {
        parentNode.rightChild = rightChild;
        rightChild.parent = parentNode;
        numberOfNodes--;
      }
    } else if(leftChild != nil && rightChild == nil){
      //If there is only a left Child
      //Assign the node to the parent
      if (parentNode.leftChild == nodeToDelete){
        parentNode.leftChild = leftChild;
        leftChild.parent = parentNode;
        numberOfNodes--;
      } else {
        parentNode.rightChild = leftChild;
        leftChild.parent = parentNode;
        numberOfNodes--;
      }
    } else{
      //How to select which node to move up?
    }
    
  }
  
  return [[BinaryTreeNode alloc] init];
}

@end
