local Button = {}
Button.__index = Button

function Button:New(properties)
    local button = Instance.new("TextButton")
    
    -- Default properties
    button.Size = properties.Size or UDim2.new(0, 100, 0, 30)
    button.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(52, 152, 219)
    button.Text = properties.Text or "Button"
    button.TextColor3 = properties.TextColor3 or Color3.fromRGB(255, 255, 255)
    button.Font = properties.Font or Enum.Font.Gotham
    button.TextSize = properties.TextSize or 14
    button.AutoButtonColor = true
    button.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = button

    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = button.BackgroundColor3:Lerp(Color3.new(1, 1, 1), 0.2)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(52, 152, 219)
        }):Play()
    end)
    
    if properties.Parent then
        button.Parent = properties.Parent
    end
    
    if properties.Callback then
        button.MouseButton1Click:Connect(properties.Callback)
    end
    
    return button
end

return Button
