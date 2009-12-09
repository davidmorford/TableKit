
#import "TVKTableCatalogController.h"
#import "TVKGroupedTableTestController.h"
#import "TVKPlainTableTestController.h"

@implementation TVKTableCatalogController

	#pragma mark Initializer

	-(id) init {
		self = [super initWithTableViewStyle:UITableViewStyleGrouped];
		if (self) {
		}
		return self;
	}

	#pragma mark UIViewController

	-(void) loadView {
		[super loadView];
		self.title = @"Table Catalog";		

		/*
		self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
		*/

		TVKTableGroup *plainGroup	= [[TVKTableGroup alloc] initWithName:@"Plain"];
		TVKTableGroup *groupedGroup	= [[TVKTableGroup alloc] initWithName:@"Grouped"];
		
		[self.tableController addSection:plainGroup];
		[self.tableController addSection:groupedGroup];
		
		TVKTableItem *plainItem = [[TVKTableItem alloc] initWithText:@"Plain" image:nil];
		plainItem.target = self;
		plainItem.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		[plainGroup addRow:plainItem];
		[plainItem release];
		
		TVKTableItem *plainStyledItem = [[TVKTableItem alloc] initWithText:@"Plain Styled" image:nil];
		plainStyledItem.target = self;
		plainStyledItem.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		[plainGroup addRow:plainStyledItem];
		[plainStyledItem release];

		TVKTableItem *groupedItem		= [[TVKTableItem alloc] initWithText:@"Grouped" image:nil];
		groupedItem.target = self;
		groupedItem.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		[groupedGroup addRow:groupedItem];
		[groupedItem release];

		TVKTableItem *groupedStyledItem = [[TVKTableItem alloc] initWithText:@"Grouped Styled" image:nil];
		groupedStyledItem.target = self;
		groupedStyledItem.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		[groupedGroup addRow:groupedStyledItem];
		[groupedStyledItem release];
		
		[plainGroup release];
		[groupedGroup release];
	}

	-(void) viewDidLoad {
		[super viewDidLoad];
	}
	
	-(void) viewDidAppear:(BOOL)animated {
		[super viewDidAppear:TRUE];
		if (self.navigationController.toolbarHidden == FALSE) {
			[self.navigationController setToolbarHidden:TRUE animated:TRUE];
		}
	}

	-(void) createModel {
	}
	

	#pragma mark <TVKTableControllerDelegate>

	-(void) tableController:(TVKTableController *)controller didSelectRow:(id <TVKTableRow>)row {
		if (row.target && row.target == self) {
			TVKTableGroup *tableGroup	= row.section;
			NSUInteger tableGroupIndex	= [self.tableController indexForSection:tableGroup];
			NSUInteger tableRowIndex	= [row.section indexForRow:row];
			
			TVKTableViewController * tableViewController;
			
			if (tableGroupIndex == 0) {
				if (tableRowIndex == 0) {
					tableViewController = [[TVKPlainTableTestController alloc] init];
					[self.navigationController pushViewController:tableViewController animated:TRUE];
					[tableViewController release];
					return;
				}
				else if (tableRowIndex == 1) {
					tableViewController = [[TVKPlainStyledTableTestController alloc] init];
					[self.navigationController pushViewController:tableViewController animated:TRUE];
					[tableViewController release];
					return;
				}
			}
			else if (tableGroupIndex == 1) {
				if (tableRowIndex == 0) {
					tableViewController = [[TVKGroupedTableTestController alloc] init];
					[self.navigationController pushViewController:tableViewController animated:TRUE];
					[tableViewController release];
					return;
				}
				else if (tableRowIndex == 1) {
					tableViewController = [[TVKGroupedStyledTableTestController alloc] init];
					[self.navigationController pushViewController:tableViewController animated:TRUE];
					[tableViewController release];
					return;
				}
			}
		}
	}


	#pragma mark Destructor

	-(void) dealloc {
		[super dealloc];
	}

@end
