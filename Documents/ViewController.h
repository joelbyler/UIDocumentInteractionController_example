//
//  ViewController.h
//  Documents
//
//  Created by Joel on 12/12/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

