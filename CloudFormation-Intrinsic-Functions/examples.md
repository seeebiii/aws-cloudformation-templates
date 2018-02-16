# AWS CloudFormation: Intrinsic Functions

Examples of (probably most used) intrinsic functions.

### !Sub
- Replaces certain variables and returns a string
```
!Sub arn:aws:SERVICE:${AWS::Region}:${AWS::AccountId}:NAME
 
!Sub
  - My String In Region ${region}
  - { region: AWS::Region }
```

### !Ref
- Reference a logical id (e.g. a serverless function) and returns (usually) the name of the service, but there are exceptions
```
!Ref ServiceWithLogicalId
```


### !Join
- Joins all array elements together
- Delimiter must be the first value
```
!Join ['', ['part1', 'part2', 'part3']]  # => part1part2part3
 
!Join ['-', ['part1', 'part2', 'part3']] # => part1-part2-part3
```


### !GetAtt
- Get given attribute from another resource
```
!GetAtt [MyServerlessFunction, Arn]
```