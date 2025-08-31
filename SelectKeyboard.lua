--- // ==== Services ==== \ ---
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--- // ==== Setup ==== \ ---
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "KeyboardSelector"
gui.ResetOnSpawn = false
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--- // ==== Frame ==== \ ---
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0, -320, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.25, 0) -- squircle-like
corner.Parent = frame

local outline = Instance.new("UIStroke")
outline.Thickness = 2
outline.Color = Color3.fromRGB(255, 255, 255)
outline.Parent = frame

--- // ==== Title ==== \ ---
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Select keyboard"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

--- // ==== Close Button ==== \ ---
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0.9, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.5, 0) 
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
 TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
  Position = UDim2.new(1, 320, 0.5, -100)
 }):Play()
 task.wait(0.65)
 gui:Destroy()
end)

--- // ==== Buttons ==== \ ---
local function createButton(name, yPos, func)
 local button = Instance.new("TextButton")
 button.Size = UDim2.new(0.8, 0, 0, 40)
 button.Position = UDim2.new(0.1, 0, 0, yPos)
 button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
 button.Text = name
 button.Font = Enum.Font.Gotham
 button.TextSize = 18
 button.TextColor3 = Color3.fromRGB(255, 255, 255)
 button.Parent = frame

 local btnCorner = Instance.new("UICorner")
 btnCorner.CornerRadius = UDim.new(0.2, 0)
 btnCorner.Parent = button

 button.MouseButton1Click:Connect(func)
end

local function slideOutAndRun(callback)
 TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
  Position = UDim2.new(1, 320, 0.5, -100)
 }):Play()
 task.wait(0.65)
 callback()
 gui:Destroy()
end

createButton("Byte keyboard", 60, function()
 slideOutAndRun(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/ByteKeyboard.lua"))()
 end)
end)

createButton("Kilobyte keyboard", 110, function()
 slideOutAndRun(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KilobyteKeyboard.lua"))()
 end)
end)

--- // ==== Spawn anim ==== \ ---
TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Position = UDim2.new(0.5, -150, 0.5, -100)
}):Play()
