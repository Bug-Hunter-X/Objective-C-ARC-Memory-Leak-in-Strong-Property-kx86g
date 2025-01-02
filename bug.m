In Objective-C, a common yet subtle issue arises when dealing with object ownership and memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some code ...
}
@end
```

While seemingly correct, a potential problem exists if `someMethod` is called multiple times. Each invocation creates a new `NSString`, and the old one is retained until the next call. This results in a chain of retained `NSString` objects, consuming memory. If `someMethod` is frequently called, a memory leak can occur. This is because `self.myString` is a strong property.