local Notification = {}
Notification.__index = Notification

function Notification:New(properties)
    local notification = Instance.new("Frame")
    local content = Instance.new("TextLabel")
    
    -- Main notification frame
    notification.Size = UDim2.new(0, 250, 0, 60)
    notification.Position = UDim2.new(1, -270, 1, -80)
    notification.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(45, 45, 45)
    notification.BorderSizePixel = 0
    notification.Parent = game:GetService("CoreGui")
    
    -- Content
    content.Size = UDim2.new(1, -20, 1, 0)
    content.Position = UDim2.new(0, 10, 0, 0)
    content.BackgroundTransparency = 1
    content.Text = properties.Text or "Notification"
    content.TextColor3 = Color3.fromRGB(255, 255, 255)
    content.Font = Enum.Font.Gotham
    content.TextSize = 14
    content.TextWrapped = true
    content.Parent = notification
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = notification
    
    -- Animation
    notification.Position = UDim2.new(1, 20, 1, -80)
    game:GetService("TweenService"):Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
        Position = UDim2.new(1, -270, 1, -80)
    }):Play()
    
    -- Auto-remove
    task.delay(properties.Duration or 3, function()
        game:GetService("TweenService"):Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
            Position = UDim2.new(1, 20, 1, -80)
        }):Play()
        task.wait(0.5)
        notification:Destroy()
    end)
    
    return notification
end

return Notification