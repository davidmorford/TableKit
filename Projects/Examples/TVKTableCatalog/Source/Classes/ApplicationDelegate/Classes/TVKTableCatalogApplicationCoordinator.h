
/*!
@project	TVKTableCatalog
@header		TVKTableCatalogApplicationCoordinator.h
@copyright	(c) 2009, Semantap
@created    11/16/2009
*/

#import <UIKit/UIKit.h>
#import <StorageKit/STKObjectStore.h>

/*!
@class TVKTableCatalogApplicationCoordinator
@superclass NSObject <STKStoreDelegate>
@abstract
@discussion
*/
@interface TVKTableCatalogApplicationCoordinator : NSObject  <STKStoreDelegate> {
	STKObjectStore *objectStore;
}

	@property (retain, nonatomic) STKObjectStore *objectStore;

	+(TVKTableCatalogApplicationCoordinator *) sharedCoordinator;

@end
