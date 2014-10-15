# Validator descriptions

Given


```

data Constraint singleton v  = Constraint { const :: singleton
                                   val ::  }



"get" <prism composition> <record> := <type> 

"one" <fieldAccessor>  ["in","=>"] <record> 

["every","*"] <fieldAccessor>  ["in","=>"] <record> 

["is" , ":="]

"where"

["option", "<*>"]

"select" <as Prism> <Record> = <type>
"in" <record> <as Prism> <constraints> // Forgetful 

the `in` constraint must have all it's constraints satisfied on the record in question
         only the results that pass the constraint will be returned

```



```
tag = LocalTag

```
## Example Constrations
Location
  LocationId
  OTCList
 where
     every (LocationId) in OTCList == (get LocationId Location)
     one ParameterTagId in OTCList == 2


GCSDevice is Location
    where 
         in Location OTCList  satisfy (SlaveParameterId == 10 and Description == "High Tank Level" )  and
                                       (SlaveParameterId == 11 and Description == "Low Tank Level" )
    
SchumbergerDevice is Location
    where 
         in Location OTCList satisfy (SlaveParameterId == 10 and Description == "High Tank Level" )  and
                                       (SlaveParameterId == 11 and Description == "Low Tank Level" )



TankBattery is Location
   where
    in Location OTCList satisfy (SlaveParameterId == 1 and Description == "MainTain Tank Level")


Drive is GCSDevice or SchlumbergerDevice 

Well
  TankBattery
  Drive


ElynxWell
      Well
    where
     in Drive (SchlumbergerDevice . OTCList) satisfy (SlaveParameterId == 10 ) 
                           


