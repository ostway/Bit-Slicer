//
//  ZGDocumentSearchController.h
//  Bit Slicer
//
//  Created by Mayur Pawashe on 7/21/12.
//  Copyright (c) 2012 zgcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_INTERFACE_UPDATE_TIME_INTERVAL	0.33

@class ZGDocument;
@class ZGSearchData;
@class ZGTimer;

@interface ZGDocumentSearchController : NSObject

@property (readonly) ZGSearchData *searchData;

- (BOOL)canStartTask;
- (BOOL)canCancelTask;
- (void)prepareTask;
- (void)resumeFromTask;

- (void)clear;
- (void)search;
- (void)storeAllValues;

@end
