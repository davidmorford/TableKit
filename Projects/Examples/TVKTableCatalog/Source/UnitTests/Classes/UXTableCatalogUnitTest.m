
/*!
@project	UXTableCatalog
@header		UXTableCatalogUnitTest.h
@copyright	(c) 2009, Semantap
@created	11/24/09 - David
*/

#define USE_APPLICATION_UNIT_TEST 1

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

/*!
@class UXTableCatalogUnitTest
@superclass SenTestCase
@abstract Application unit tests contain unit test code that must be 
injected into an application to run correctly.
@discussion Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is 
designed to be linked into an independent test executable.
*/
@interface UXTableCatalogUnitTest : SenTestCase {

}

	#if USE_APPLICATION_UNIT_TEST
	-(void) testAppDelegate;
	#else
	-(void) testMath;
	#endif

@end

#pragma mark -

@implementation UXTableCatalogUnitTest

	#if USE_APPLICATION_UNIT_TEST
	-(void) testAppDelegate {
		id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
		STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
	}
	#else
	-(void) testMath {
		STAssertTrue((1 + 1) == 2, @"Compiler isn't feeling well today :-(" );
	}
	#endif

@end
