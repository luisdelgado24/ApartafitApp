#import "WorkoutRoutineCollectionViewController.h"

#import "WorkoutExerciseCell.h"

static const CGFloat kCellHeight = 85;

@interface WorkoutRoutineCollectionViewController () <UICollectionViewDelegate>

@property(nonatomic, readonly) NSDictionary<NSString *,UIImageView *> *config;
@property(nonatomic, readonly) NSArray<NSString *> *keys;

@end

@implementation WorkoutRoutineCollectionViewController

- (instancetype)initWithConfig:(NSDictionary<NSString *,UIImageView *> *)config {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    
    if (self) {
        _config = config;
        _keys = [_config allKeys];
        [self.collectionView setDataSource:self];
        [self.collectionView setDelegate:self];
        
        [self.collectionView registerClass:[WorkoutExerciseCell class] forCellWithReuseIdentifier:@"workoutExerciseCell"];
        UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:1];
        [self.collectionView setBackgroundColor:backgroundColor];
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
        return self.keys.count;
    } else {
        NSAssert(NO, @"You shouldn't be here");
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WorkoutExerciseCell *exerciseCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"workoutExerciseCell" forIndexPath:indexPath];
    NSString *cellText = self.keys[indexPath.item];
    UIImageView *imageView = self.config[cellText];
    [exerciseCell updateSetWithText:cellText imageView:imageView];
    return exerciseCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, kCellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Foo");
}

@end
