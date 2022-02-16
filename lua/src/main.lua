local DataStored = {}

local IdHolder = {0} -- Base at 0

local Bin = {}

function FindNum(tbl, value)
    for i, v in pairs(tbl) do
        if TableToString(v) == value then
            return i
        end
    end
    return nil
end

function GetPositionInTableDatStore(ID)
  for i,v in pairs(DataStored) do 
    if v[2] == ID then 
      local Position = FindNum(DataStored, TableToString(v))
      return Position 
    end 
  end        
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

--Translates basic Variable 2 special keys for better understanding
function TranslateBasicLanguage(Value) 
if Value == "v8fedvnx3y" then return "(No Value Has Been Assigned)"  else return Value end
end 

--Find Duplicates
function IsDuplicate(Table --[[Table]], DataType --[[Any]])
for index, values in pairs(Table) do
  if DataType == values then 
    return true 
    else 
     return false
    end
  end
end


-- This Function Creates a new DataKey.
function CreateVariable(KeyName, Default)
  
  local Key

  repeat 
   Key = math.random(1000,9999)
  until IsDuplicate(IdHolder, Key) == false



  table.insert(IdHolder, (#IdHolder + 1), Key)

   if Default ~= nil then 
    table.insert(DataStored, (#DataStored + 1), {KeyName,Key,Default} )
   elseif Default == nil then 
    table.insert(DataStored, (#DataStored + 1), {KeyName,Key, "v8fedvnx3y"} )
    end
  end

-- This function returns the key ID  of the specific Key inserted using Key. Will return nil of Key does not exist 
function GetIdFromName(KeyName --[[String]])
for i,v in pairs(DataStored) do 
  if v[1] == KeyName then 
    return v[2]
      end
    end
  return nil 
end

--This function tells us the stats of our Entire Data
function GetStats()
  local KeysCreated = #DataStored
  local IdsCreated = (#IdHolder - 1) or nil 

  print()
  io.write("Welcome to Variable 2.0 Stats. Please wait as we load you stats!!!!")
  print()
  io.write("You have "..KeysCreated.." Keys Created")
  print()
  io.write("You have "..IdsCreated.." Id's Created")
end 



--This function sets the value of the Data Key provided. This only supports the Data Key not name for now  
function SetDataValue(Key,Value)
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
function GetDataValue(Key)
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
        SetDataValue(Key, Total)
      else
      end 
   end 
  end
end

--Tempoarily Bins Data
function BinData(ID)
local  Position = GetPositionInTableDatStore(ID)
local Data = DataStored[Position]
local IdPosition
for i,v in pairs(IdHolder) do 
  if v == ID then 
    IdPosition = i 
  end 
end 

print(IdPosition)

table.remove(IdHolder, IdPosition)
table.remove(DataStored, Position)
table.insert(Bin, #Bin + 1, Data)

end


function RestoreData(ID)
  local Position
    for i,v in pairs(Bin) do 
      if ID == v[2] then 
        Position = i
      end   
    end     

    local Data = Bin[Position]
    table.remove(Bin,Position)
    table.insert(DataStored, #DataStored + 1, Data)
end