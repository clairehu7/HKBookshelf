//
//  AppDelegate.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/20.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

