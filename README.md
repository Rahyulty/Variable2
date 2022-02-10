# Variable 2

Hello my name is Rahyulty and im a developer on roblox.

I started this project because I wanted to broaden my knowledge of fundamental lua, which I believe would benefit me in roblox studio.

None of this is something that im actually going to use nor will it be helpful to you 


# Basics of Variable 2

This is a program that allows you to temp store data under the same name just under different id's


The data type is just like variables but allows more versatiltiy and more flexibilty and allows you to customizate it to your own liking.

This is very light weight and easy so you can use tie it into your own data

Example Code 

```lua
CreateKey("TableOfNumbers", {1,2,3,4,5,6})

local ID = GetKeyIdFromName("TableOfNumbers")

local Table = GetValue(ID)
local Sum = 0 

for i,v in pairs(Table) do 
  Sum = Sum + v 
end 

print(Sum)
-- Wil print (21)

```
again as stated above this isnt anything special or groundbreaking just a little project im working on to help me in the longrun

Thank You!