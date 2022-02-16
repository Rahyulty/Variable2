# Variable 2 Uni

# Updates 

## Lua Specifc Updates

- Lua's Naming Scheme for Variable 2 had been completely updated
- Removed Name from ID function as deemed it useless 
- Added a Bin + Restore function 

## Python Updates
- Python Variable 2 is in the working and is being developed 

## Rust Updates
- Rust Variable2 Soon

## Minor General Updates 
- Bug Fixes
- Preformace Improvements 
- Made Source Code less of a eye sore 
- Updated Comments  


# Variable 2 in Lua

```lua

CreateVariable("foo",{10,34,45,787,32})
local ID = GetIdFromName("foo")
local fooData = GetDataValue(ID)
local Sum = 0 

for index, values in pairs(fooData) do 
    Sum = Sum + values
end 

print(Sum)
-- Will print 908 

SetDataValue(ID, Sum)

print("The new value for foo is "..GetDataValue(ID))

-- Wil print: The new Value for foo is 908
```



# Disclaimer 
This isnt anything special or groundbreaking just a little project im working on to help me in the longrun

Thank You!