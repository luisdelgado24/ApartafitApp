#import "WorkoutRoutineCollectionViewController.h"

#import "WorkoutExerciseCell.h"

@interface WorkoutRoutineCollectionViewController () <UICollectionViewDelegate>

@end

@implementation WorkoutRoutineCollectionViewController

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    
    if (self) {
        [self.collectionView setDataSource:self];
        [self.collectionView setDelegate:self];
        
        [self.collectionView registerClass:[WorkoutExerciseCell class] forCellWithReuseIdentifier:@"workoutExerciseCell"];
        [self.collectionView setBackgroundColor:UIColor.orangeColor];
        [self.view addSubview:self.collectionView];
    }
    
    return self;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else {
        NSAssert(NO, @"You shouldn't be here");
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WorkoutExerciseCell *exerciseCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"workoutExerciseCell" forIndexPath:indexPath];
    [exerciseCell updateSetWithText:@"1 set of foo" imageView:nil];
    return exerciseCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 60);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Foo");
}

@end
