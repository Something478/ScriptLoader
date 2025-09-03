local Players = game:GetService("Players")

local TAG_NAME = "NameTag"

local TAG_GROUPS = {
 { 
  Names = { "IdkMyNameBro_012", "Treezz_w", "XDsomeoneX3" },
  Text = "ChillbyteHD\nScript Owner",
  Color = Color3.fromRGB(86, 8, 255)
 },
 {
  Names = { "Theo_TheoBenzo" },
  Text = "Theo\nThe GOAT",
  Color = Color3.fromRGB(255, 255, 0)
 },
 {
  Names = { "buratitat7" },
  Text = "Goofy lil\ngoober",
  Color = Color3.fromRGB(255, 255, 0)
 },
 {
  Names = { "yourgames9" },
  Text = "(Youtuber)\nZombie",
  Color = Color3.fromRGB(40, 168, 8)
 }
}

local NameToTag = {}
for _, group in ipairs(TAG_GROUPS) do
 for _, name in ipairs(group.Names) do
  NameToTag[name] = { Text = group.Text, Color = group.Color }
 end
end

local playersWithTags = {}

local function createTag(player)
 local success, err = pcall(function()
  if playersWithTags[player] then
   return
  end
  
  local char = player.Character
  if not char then return end

  local head = char:FindFirstChild("Head") or char:WaitForChild("Head", 3)
  if not head then return end

  local existing = head:FindFirstChild(TAG_NAME)
  if existing then
   return
  end

  local tagInfo = NameToTag[player.Name]
  if not tagInfo then return end

  local billboard = Instance.new("BillboardGui")
  billboard.Name = TAG_NAME
  billboard.Size = UDim2.new(0, 100, 0, 40)
  billboard.StudsOffset = Vector3.new(0, 2.5, 0)
  billboard.Adornee = head
  billboard.AlwaysOnTop = true
  billboard.Parent = head

  local label = Instance.new("TextLabel")
  label.Size = UDim2.new(1, 0, 1, 0)
  label.BackgroundTransparency = 1
  label.TextStrokeTransparency = 0
  label.TextScaled = true
  label.Font = Enum.Font.Sarpanch
  label.Text = tagInfo.Text
  label.TextColor3 = tagInfo.Color
  label.Parent = billboard
  
  playersWithTags[player] = true
 end)

 if not success then
  warn("Failed to create NameTag for " .. player.Name .. ": " .. tostring(err))
 end
end

Players.PlayerRemoving:Connect(function(player)
 playersWithTags[player] = nil
 local char = player.Character
 if char then
  local head = char:FindFirstChild("Head")
  if head then
   local tag = head:FindFirstChild(TAG_NAME)
   if tag then
    tag:Destroy()
   end
  end
 end
end)

for _, player in ipairs(Players:GetPlayers()) do
 if NameToTag[player.Name] then
  player.CharacterAdded:Connect(function()
   task.wait(1)
   createTag(player)
  end)

  if player.Character then
   createTag(player)
  end
 end
end

Players.PlayerAdded:Connect(function(player)
 if NameToTag[player.Name] then
  player.CharacterAdded:Connect(function()
   task.wait(1)
   createTag(player)
  end)
 end
end)