
#import "TVKTableCatalogAppDelegate.h"
#import "TVKTableCatalogApplicationCoordinator.h"
#import "TVKTableCatalogController.h"

@implementation TVKTableCatalogAppDelegate

	@synthesize mainWindow;
	@synthesize navigationController;
	@synthesize rootController;

	#pragma mark <UIApplicationDelegate>

	-(void) applicationDidFinishLaunching:(UIApplication *)application {
		CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
		CGRect appScreenBounds = [UIScreen mainScreen].bounds;
		
		NSLog(@"Application Frame : %@", NSStringFromCGRect(appFrame));
		NSLog(@"Screen Bounds : %@", NSStringFromCGRect(appScreenBounds));
	
		self.mainWindow = [[UIWindow alloc] initWithFrame:appScreenBounds];
		self.rootController = [[TVKTableCatalogController alloc] init];
		
		self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.rootController];
		
		[self.mainWindow addSubview:self.navigationController.view];
		[self.mainWindow makeKeyAndVisible];
	}

	-(void) dealloc {
		[rootController release]; rootController = nil;
		[navigationController release]; navigationController = nil;
		[mainWindow release]; mainWindow = nil;
		[super dealloc];
	}

@end
