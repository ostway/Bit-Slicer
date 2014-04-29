/*
 * Created by Mayur Pawashe on 3/11/10.
 *
 * Copyright (c) 2012 zgcoder
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * Neither the name of the project's author nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ZGPreferencesController.h"
#import "ZGUpdatePreferencesViewController.h"
#import "ZGHotKeyPreferencesViewController.h"
#import "ZGHotKeyCenter.h"
#import "ZGAppUpdaterController.h"
#import "ZGDebuggerController.h"

@interface ZGPreferencesController ()

@property (nonatomic) ZGHotKeyCenter *hotKeyCenter;
@property (nonatomic) ZGAppUpdaterController *appUpdaterController;
@property (nonatomic) ZGDebuggerController *debuggerController;

@property (nonatomic) ZGUpdatePreferencesViewController *updatePreferencesViewController;
@property (nonatomic) ZGHotKeyPreferencesViewController *hotKeyPreferencesViewController;

@end

#define ZGSoftwareUpdateIdentifier @"ZGSoftwareUpdateIdentifier"
#define ZGDebuggerHotKeysIdentifier @"ZGDebuggerHotKeysIdentifier"

#define ZGSoftwareUpdateIconPath @"/System/Library/CoreServices/Software Update.app/Contents/Resources/SoftwareUpdate.icns"

@implementation ZGPreferencesController

- (id)initWithHotKeyCenter:(ZGHotKeyCenter *)hotKeyCenter debuggerController:(ZGDebuggerController *)debuggerController appUpdaterController:(ZGAppUpdaterController *)appUpdaterController
{
	self = [super initWithWindowNibName:@"Preferences"];
	
	if (self != nil)
	{
		self.hotKeyCenter = hotKeyCenter;
		self.appUpdaterController = appUpdaterController;
		self.debuggerController = debuggerController;
	}
	
	return self;
}

- (void)windowDidLoad
{
	[self.window.toolbar setAllowsUserCustomization:NO];
	[self.window.toolbar setSelectedItemIdentifier:ZGSoftwareUpdateIdentifier];
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:ZGSoftwareUpdateIconPath])
	{
		for (NSToolbarItem *toolbarItem in self.window.toolbar.items)
		{
			if ([toolbarItem.itemIdentifier isEqualToString:ZGSoftwareUpdateIdentifier])
			{
				toolbarItem.image = [[NSImage alloc] initWithContentsOfFile:ZGSoftwareUpdateIconPath];
				break;
			}
		}
	}
	
	[self setUpdatePreferencesView];
}

- (void)setUpdatePreferencesView
{
	if (self.updatePreferencesViewController == nil)
	{
		self.updatePreferencesViewController = [[ZGUpdatePreferencesViewController alloc] initWithAppUpdaterController:self.appUpdaterController];
	}
	
	self.window.contentView = self.updatePreferencesViewController.view;
	[self.window setTitle:@"Software Update"];
}

- (void)setHotKeyPreferencesView
{
	if (self.hotKeyPreferencesViewController == nil)
	{
		self.hotKeyPreferencesViewController = [[ZGHotKeyPreferencesViewController alloc] initWithHotKeyCenter:self.hotKeyCenter debuggerController:self.debuggerController];
	}
	
	self.window.contentView = self.hotKeyPreferencesViewController.view;
	[self.window setTitle:@"Hot Keys"];
}

- (IBAction)changePreferencesView:(NSToolbarItem *)toolbarItem
{
	if ([toolbarItem.itemIdentifier isEqualToString:ZGSoftwareUpdateIdentifier])
	{
		[self setUpdatePreferencesView];
	}
	else if ([toolbarItem.itemIdentifier isEqualToString:ZGDebuggerHotKeysIdentifier])
	{
		[self setHotKeyPreferencesView];
	}
}

@end
