--[[
  Uodates: 
  
  Increment Function For integers if you just want to increment a value instead of setting it 

  Working on: 

  Changed function to signify when a value in table changes.

]]


--[[
 Hello This is a little something I made in my free time for me to exerise my brain in lua 

 Originally This was suppose to be a Repl.It DataStore with lua but unfortnaetly i have not fully graspped the knowledege of Repl.it Data store. 

 So on the contray i decdied to just make a tempoary datastore that can have multiple variables the same name be able to hold values via Table.

 The reason it can have same names is beacuse each variable or KeyName is assigned a KeyID which makes each data unique

 I am expanding this and hopefully soon this can tie into repl.it data store

 HOW TO GET STARTED

 First you must create a key using the CreateKey() function 

 For the arguments you need a key name (string) and optional The value that this key will hold 

 You can Set and Get these values using the SetValue() function and GetValue() function 

 The value you can set using Variable 2 is unlimited which means you can set tables as they key value. 

 To make things easier we have bulit in a TableToString function into the code so that if Get() return table ID then you can simple convert it to a String using TableToString(). You can use luas bulit in string to table to convert back. 

This is also open source so feel free to change anything to your liking

 -- Code Examples

CreateKey("TableOfNumbers", {1,2,3,4,5,6})

local ID = GetKeyIdFromName("TableOfNumbers")

local Table = GetValue(ID)
local Sum = 0 

for i,v in pairs(Table) do 
Sum = Sum + v 
end 

print(Sum)
-- Wil print (21)
]]


local DataStored = {}

local KeyIdHandler = {0} -- Base at 0 for production uses

local Bin = {}

function FindNum(tbl, value)
    for i, v in pairs(tbl) do
        if TableToString(v) == value then
            return i
        end
    end
    return nil
end

function TableToString(tbl) 
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..TableToString(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end
--Translates basic Variable 2 language to english
function TranslateBasicLanguage(Value) 
if Value == "v8fedvnx3y" then return "(No Value Has Been Assigned)"  else return Value end
end 
--Finds Duplicates in a table works halfway tho
function Duplicates(Table --[[Table]], DataType --[[Any]])
for index, values in pairs(Table) do
  if DataType == values then 
    return true 
    else 
     return false
    end
  end
end


-- This Function Creates a new DataKey.
function CreateKey(KeyName, Default)
  
  local Key
  repeat 
   Key = math.random(1000,9999)
  until Duplicates(KeyIdHandler, Key) == false



  table.insert(KeyIdHandler, (#KeyIdHandler + 1), Key)
   if Default ~= nil then 
  table.insert(DataStored, (#DataStored + 1), {KeyName,Key,Default} )
  elseif Default == nil then 
  table.insert(DataStored, (#DataStored + 1), {KeyName,Key, "v8fedvnx3y"} )
    end
  end
-- This function returns the key ID  of the specific Key inserted using Key. Will return nil of Key does not exist 
function GetKeyIdFromName(KeyName --[[String]])
for i,v in pairs(DataStored) do 
if v[1] == KeyName then 
  return v[2]
    end
  end
  return nil 
end

-- This Function return the key Name of the specific Key ID inserted using the key ( LOL ) Will return nil if key does not exist 
function GetKeyNameFromID(Id --[[Int]])

for i,v in pairs(DataStored) do 
if v[2] == Id then 
  return v[1]
  else 
  return nil 
    end
  end
end

--This function tells us the stats of our Entire Data
function GetStats()
print()
io.write("Welcome to Variable 2.0 Stats. Please wait as we load you stats!!!!")
local KeysCreated = #DataStored
local IdsCreated = (#KeyIdHandler - 1) or nil 
print()
io.write("You have "..KeysCreated.." Keys Created")
print()
io.write("You have "..IdsCreated.." Id's Created")
end 



--This function sets the value of the Data Key provided. This only supports the Data Key not name for now  
function SetValue(Key,Value)
  if Key == nil or Value == nil then
    print("Error, Your Key and Value must not be nil")
    elseif type(Key) ~= "number" then 
    print("Error, Key needs o be a number value")
    else 
      for i,v in pairs(DataStored) do 
      if v[2] == Key then 
        local num = FindNum(DataStored, TableToString(v))
        local KeyName = v[1]
        print(KeyName)
        table.remove(DataStored, num)
        table.insert(DataStored, num, {KeyName,Key,Value })
          end 
      end 
  end
end
--Gets the Value from a key using the keys ID
function GetValue(Key)
  if type(Key) ~= "number" then 
  print("Key must be number")
  return nil 
  else 
  for i,v in pairs(DataStored) do 
  if v[2] == Key then 
   return TranslateBasicLanguage(v[3])
   end 
end 
end
end


function Increment(Key, Value)

for i,v in pairs(DataStored) do 
if v[2] == Key then 
  if type(v[3]) == "number" then 
    local Start = v[3]
    local Total 

    Total = Start + Value
    print(Total)
    SetValue(Key, Total)

end 
end 
end
end

local tries = 0

repeat string = "{"..math.random(1,4)..","..math.random(1,4)..","..math.random(1,4)..",".."4}"
print(string)
tries = tries + 1
until string ==  "{1,2,3,4}"
print("It took ".. tries.." tries to get it correct")