
/*!
@project	TVKTableCatalog
@header		TVKTableCatalogAppDelegate.h
@copyright	(c) 2009, Semantap
@created	11/24/09 - David
*/

#import <UIKit/UIKit.h>
#import <TableKit/TableKit.h>

@class TVKTableCatalogController;

/*!
@class TVKTableCatalogAppDelegate
@superclass NSObject <UIApplicationDelegate>
@abstract
@discussion
*/
@interface TVKTableCatalogAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *mainWindow;
	UINavigationController *navigationController;
	TVKTableCatalogController *rootController;
}

	@property (nonatomic, retain) UIWindow *mainWindow;
	@property (nonatomic, retain) UINavigationController *navigationController;
	@property (nonatomic, retain) TVKTableCatalogController *rootController;

@end
