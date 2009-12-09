
#import "TVKTableCatalogApplicationCoordinator.h"

@interface TVKTableCatalogApplicationCoordinator ()
	-(void) setupStore;
@end

#pragma mark -

static TVKTableCatalogApplicationCoordinator *sharedAppCoordinator = nil;

@implementation TVKTableCatalogApplicationCoordinator

	@synthesize objectStore;

	#pragma mark Shared Coordinator

	+(TVKTableCatalogApplicationCoordinator *) sharedCoordinator {
		if (sharedAppCoordinator == nil) {
			sharedAppCoordinator = [[super allocWithZone:NULL] init];
		}
		return sharedAppCoordinator;
	}

	+(id) allocWithZone:(NSZone *)zone {
		return [[self sharedCoordinator] retain];
	}

	-(id) copyWithZone:(NSZone *)zone {
		return self;
	}

	-(id) retain {
		return self;
	}

	-(NSUInteger) retainCount {
		return NSUIntegerMax;
	}

	-(void) release {

	}

	-(id) autorelease {
		return self;
	}


	#pragma mark Initializer

	-(id) init {
		self = [super init];
		if (self) {
			[self performSelector:@selector(start) withObject:nil afterDelay:0.5];
		}
		return self;
	}


	#pragma mark NSNotifications

	-(void) didReceiveMemoryWarning:(void *)object {
		NSLog(@"APPLICATION MEMORY WARNING!");
	}


	#pragma mark KVO

	-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
		NSLog(@"Coordinator Key Value Observation");
		NSLog(@"KeyPath = %@", keyPath);
		NSLog(@"Object  = %@", object);
		NSLog(@"Changed = %@", change);
		NSLog(@"================================================================================");
		/*
		if ([keyPath isEqualToString:@""] == TRUE) {
			NSString *previousValue	= [change objectForKey:NSKeyValueChangeOldKey];
			NSString *newValue		= [change objectForKey:NSKeyValueChangeNewKey];
		}
		*/
	}


	#pragma mark Coordinator Main

	-(void) start {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(didReceiveMemoryWarning:)
													 name:UIApplicationDidReceiveMemoryWarningNotification
												   object:nil];
		//[self setupStore];
	}
	

	#pragma mark Store
	
	-(void) setupStore {
		self.objectStore = [[STKObjectStore alloc] initWithModelName:@"TableCatalogTest" 
												 persistentStoreName:@"TableCatalog" 
														forceReplace:FALSE 
														   storeType:NSSQLiteStoreType 
														storeOptions:nil];
		self.objectStore.delegate = self;
	}


	#pragma mark <STKObjectStoreDelegate>

	-(void) store:(id <STKStore>)store didCreateNewManagedObjectContext:(NSManagedObjectContext *)context {
		NSLog(@"%@, %@", store, context);
	}


	#pragma mark Destructor

	-(void) dealloc {
		[objectStore release]; objectStore = nil;
		[super dealloc];
	}

@end
