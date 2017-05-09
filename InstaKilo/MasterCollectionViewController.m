//
//  MasterCollectionViewController.m
//  InstaKilo
//
//  Created by Ben Weinberg on 2017-03-22.
//  Copyright © 2017 Ben Weinberg. All rights reserved.
//

#import "MasterCollectionViewController.h"
#import "Athletes.h"
#import "CollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "DetailViewController.h"

@interface MasterCollectionViewController ()
@property (nonatomic) NSMutableArray *hockeyPlayers;
@property (nonatomic) NSMutableArray *baseballPlayers;
@property (nonatomic) NSMutableArray *basketballPlayers;


@property (nonatomic) NSArray<NSMutableArray*> *sectionsArray;
@end

@implementation MasterCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat width = self.view.bounds.size.width/2;
    layout.itemSize = CGSizeMake(width, width);
    
    Athletes *hockeyMatthews = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"matthews"] withName:@"Auston Matthews"];
    Athletes *hockeyMarner = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"marner"] withName:@"Mitch Marner"];
    Athletes *hockeyNylander = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"nylander"] withName:@"William Nylander"];
    Athletes *hockeyPolak = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"polak"] withName:@"Roman Polak"];
    self.hockeyPlayers = [[NSMutableArray alloc] init];
    [self.hockeyPlayers addObject:hockeyMatthews];
    [self.hockeyPlayers addObject:hockeyMarner];
    [self.hockeyPlayers addObject:hockeyNylander];
    [self.hockeyPlayers addObject:hockeyPolak];
    
    Athletes *baseballDonaldson = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"donaldson"] withName:@"Josh Donaldson"];
    Athletes *baseballBautista = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"bautista"] withName:@"Jose Bautista"];
    Athletes *baseballStroman = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"stroman"] withName:@"Marcus Stroman"];
    Athletes *baseballTulowitzki = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"tulowitzki"] withName:@"Troy Tulowitizki"];
    self.baseballPlayers= [[NSMutableArray alloc] init];
    [self.baseballPlayers addObject:baseballDonaldson];
    [self.baseballPlayers addObject:baseballBautista];
    [self.baseballPlayers addObject:baseballStroman];
    [self.baseballPlayers addObject:baseballTulowitzki];
    
    Athletes *basketballDerozan = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"derozan"] withName:@"Demar Derozan"];
    Athletes *basketballLowry = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"lowry"] withName:@"Kyle Lowry"];
    Athletes *basketballJoseph = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"joseph"] withName:@"Corey Joseph"];
    Athletes *basketballValanciunas = [[Athletes alloc] initWithImage:[UIImage imageNamed:@"valanciunas"] withName: @"Jonas Valanciunas"];
    self.basketballPlayers = [[NSMutableArray alloc] init];
    [self.basketballPlayers addObject:basketballDerozan];
    [self.basketballPlayers addObject:basketballLowry];
    [self.basketballPlayers addObject:basketballJoseph];
    [self.basketballPlayers addObject:basketballValanciunas];
    
    
    self.sectionsArray = @[self.hockeyPlayers, self.baseballPlayers, self.basketballPlayers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Segue"]) {
        
        
        NSArray *indexPathArray = [self.collectionView indexPathsForSelectedItems];
        
        //NSIndexPath gives you the section and the row of the cell you slected 
        NSIndexPath *indexPath = [indexPathArray objectAtIndex:0];
        
        Athletes *athletesInstance = self.sectionsArray[indexPath.section][indexPath.row];
        
        DetailViewController *dvc = [segue destinationViewController];
        dvc.athletes = athletesInstance;
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionsArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sectionsArray[section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Athletes *athleteInstance = self.sectionsArray[indexPath.section][indexPath.row];
    [cell displayImage:athleteInstance];
    return cell;
}

- (UICollectionReusableView*) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReuse" forIndexPath:indexPath];
        
        NSString *labelText;
        if (indexPath.section==0) {
            labelText = @"Hockey Players";
        } else if (indexPath.section==1) {
            labelText = @"Baseball Players";
        } else if (indexPath.section==2) {
            labelText = @"Basketball Players";
        }
        
        header.headerCollectionLabel.text = labelText;
        reusableView = header;
    }
    return reusableView;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
