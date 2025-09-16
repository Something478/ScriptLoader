local function CreateCrosshair(config)
    config = config or {}
    
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    local localPlayer = Players.LocalPlayer
    local playerGui = localPlayer:WaitForChild("PlayerGui")

    local crosshairGui = Instance.new("ScreenGui")
    crosshairGui.Name = "CrosshairGui"
    crosshairGui.ResetOnSpawn = false
    crosshairGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    crosshairGui.Parent = playerGui

    local defaultConfig = {
        size = 12,
        thickness = 2,
        gap = 4,
        dot = true,
        rainbowSpeed = 5
    }
    
    for k, v in pairs(defaultConfig) do
        if config[k] == nil then
            config[k] = v
        end
    end

    local crosshairContainer = Instance.new("Frame")
    crosshairContainer.Name = "CrosshairContainer"
    crosshairContainer.Size = UDim2.new(1, 0, 1, 0)
    crosshairContainer.BackgroundTransparency = 1
    crosshairContainer.Parent = crosshairGui

    local lines = {
        top = Instance.new("Frame"),
        bottom = Instance.new("Frame"),
        left = Instance.new("Frame"),
        right = Instance.new("Frame"),
        dot = Instance.new("Frame")
    }

    for name, line in pairs(lines) do
        line.Name = name
        line.BackgroundTransparency = 0
        line.BorderSizePixel = 0
        line.ZIndex = 10
        line.Parent = crosshairContainer
        
        if name == "dot" then
            line.Size = UDim2.new(0, 2, 0, 2)
            line.AnchorPoint = Vector2.new(0.5, 0.5)
            line.Position = UDim2.new(0.5, 0, 0.5, 0)
            line.Visible = config.dot
        else
            line.Size = UDim2.new(0, config.thickness, 0, config.thickness)
        end
    end

    lines.top.AnchorPoint = Vector2.new(0.5, 1)
    lines.top.Position = UDim2.new(0.5, 0, 0.5, -config.gap)
    lines.bottom.AnchorPoint = Vector2.new(0.5, 0)
    lines.bottom.Position = UDim2.new(0.5, 0, 0.5, config.gap)
    lines.left.AnchorPoint = Vector2.new(1, 0.5)
    lines.left.Position = UDim2.new(0.5, -config.gap, 0.5, 0)
    lines.right.AnchorPoint = Vector2.new(0, 0.5)
    lines.right.Position = UDim2.new(0.5, config.gap, 0.5, 0)

    lines.top.Size = UDim2.new(0, config.thickness, 0, config.size)
    lines.bottom.Size = UDim2.new(0, config.thickness, 0, config.size)
    lines.left.Size = UDim2.new(0, config.size, 0, config.thickness)
    lines.right.Size = UDim2.new(0, config.size, 0, config.thickness)

    local function hsvToRgb(h, s, v)
        h = h % 1
        local i = math.floor(h * 6)
        local f = h * 6 - i
        local p = v * (1 - s)
        local q = v * (1 - f * s)
        local t = v * (1 - (1 - f) * s)
        
        local r, g, b
        
        if i == 0 then
            r, g, b = v, t, p
        elseif i == 1 then
            r, g, b = q, v, p
        elseif i == 2 then
            r, g, b = p, v, t
        elseif i == 3 then
            r, g, b = p, q, v
        elseif i == 4 then
            r, g, b = t, p, v
        else
            r, g, b = v, p, q
        end
        
        return Color3.new(r, g, b)
    end

    local hue = 0
    RunService.RenderStepped:Connect(function(deltaTime)
        hue = (hue + deltaTime * config.rainbowSpeed / 10) % 1
        local rainbowColor = hsvToRgb(hue, 1, 1)
        
        for name, line in pairs(lines) do
            if name ~= "dot" or config.dot then
                line.BackgroundColor3 = rainbowColor
            end
        end
        
        crosshairContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
        crosshairContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    end)
end

CreateCrosshair()

return CreateCrosshair