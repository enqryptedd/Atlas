local Toggle = {}
Toggle.__index = Toggle

function Toggle:New(properties)
    local toggle = Instance.new("Frame")
    local button = Instance.new("TextButton")
    local indicator = Instance.new("Frame")
    local enabled = false
    
    -- Main toggle frame
    toggle.Size = properties.Size or UDim2.new(0, 150, 0, 30)
    toggle.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    toggle.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(45, 45, 45)
    toggle.BorderSizePixel = 0
    
    -- Toggle button
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = properties.Text or "Toggle"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = toggle
    
    -- Toggle indicator
    indicator.Size = UDim2.new(0, 40, 0, 20)
    indicator.Position = UDim2.new(1, -45, 0.5, -10)
    indicator.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    indicator.BorderSizePixel = 0
    indicator.Parent = toggle
    
    -- Indicator knob
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.Parent = indicator
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = toggle
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(1, 0)
    UICorner2.Parent = indicator
    
    local UICorner3 = Instance.new("UICorner")
    UICorner3.CornerRadius = UDim.new(1, 0)
    UICorner3.Parent = knob
    
    -- Toggle functionality
    local function updateToggle()
        enabled = not enabled
        local tweenInfo = TweenInfo.new(0.2)
        local goals = {
            [indicator] = {
                BackgroundColor3 = enabled and (properties.EnabledColor or Color3.fromRGB(52, 152, 219)) or Color3.fromRGB(80, 80, 80)
            },
            [knob] = {
                Position = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            }
        }
        
        for object, goal in pairs(goals) do
            game:GetService("TweenService"):Create(object, tweenInfo, goal):Play()
        end
        
        if properties.Callback then
            properties.Callback(enabled)
        end
    end
    
    button.MouseButton1Click:Connect(updateToggle)
    
    if properties.Parent then
        toggle.Parent = properties.Parent
    end
    
    return toggle
end

return Toggle