The solution depends on the desired behavior.  If the intention is to always have the latest string value, we'll ensure the old string is released before assigning a new one. If the intention is to accumulate strings, then we will use `NSMutableArray` to store multiple strings:

**Solution 1 (Replacing the string):**

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
}
@end
```

**Solution 2 (Accumulating strings):**

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSMutableArray *myStrings;
@end

@implementation MyClass
- (instancetype)init {
    self = [super init];
    if (self) {
        _myStrings = [NSMutableArray array];
    }
    return self;
}
- (void)someMethod {
    [self.myStrings addObject:[NSString stringWithFormat:@"Hello, world!"];
}
@end
```
Choosing the right solution depends on the program's logic.  Always carefully consider how strong references are managed to avoid memory leaks.