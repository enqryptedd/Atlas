local TextBox = {}
TextBox.__index = TextBox

function TextBox:New(properties)
    local textbox = Instance.new("Frame")
    local input = Instance.new("TextBox")
    
    -- Main textbox frame
    textbox.Size = properties.Size or UDim2.new(0, 200, 0, 30)
    textbox.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    textbox.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(45, 45, 45)
    textbox.BorderSizePixel = 0
    
    -- Input field
    input.Size = UDim2.new(1, -20, 1, 0)
    input.Position = UDim2.new(0, 10, 0, 0)
    input.BackgroundTransparency = 1
    input.Text = properties.Text or ""
    input.PlaceholderText = properties.PlaceholderText or "Enter text..."
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.ClearTextOnFocus = properties.ClearTextOnFocus or false
    input.Parent = textbox
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = textbox
    
    -- Focus/unfocus effects
    input.Focused:Connect(function()
        game:GetService("TweenService"):Create(textbox, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        }):Play()
    end)
    
    input.FocusLost:Connect(function(enterPressed)
        game:GetService("TweenService"):Create(textbox, TweenInfo.new(0.2), {
            BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(45, 45, 45)
        }):Play()
        
        if properties.Callback then
            properties.Callback(input.Text, enterPressed)
        end
    end)
    
    if properties.Parent then
        textbox.Parent = properties.Parent
    end
    
    return textbox
end

return TextBox