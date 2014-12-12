//
//  ViewController.m
//  Documents
//
//  Created by Joel on 12/12/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end



@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previewDocument:(id)sender {
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
}
- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}
- (IBAction)openDocument:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pdf"];
    
    if (URL) {
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];

        [self.documentInteractionController setDelegate:self];
        
        [self.documentInteractionController presentOpenInMenuFromRect:[button frame] inView:self.view animated:YES];
    }
}

- (IBAction)viewOnInstagram:(id)sender {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app?annotation=youcandoit"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}

- (IBAction)cameraOnInstagram:(id)sender {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://camera"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}

- (IBAction)mediaOnInstagram:(id)sender {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://media?id=873986334325399031_36045182"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}

- (IBAction)shareOnInstagram:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"igo"];

    if (url) {
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        
        [self.documentInteractionController setDelegate:self];
        [self.documentInteractionController setUTI:@"com.instagram.exclusivegram"];
        self.documentInteractionController.annotation = @{@"InstagramCaption": @"Lorem Ipsum" };

        [self.documentInteractionController presentOpenInMenuFromRect:[button frame] inView:self.view animated:YES];
    }
}

@end
