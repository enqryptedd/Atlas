local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown:New(properties)
    local dropdown = Instance.new("Frame")
    local selected = Instance.new("TextButton")
    local optionsList = Instance.new("Frame")
    
    -- Main dropdown frame
    dropdown.Size = properties.Size or UDim2.new(0, 150, 0, 30)
    dropdown.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    dropdown.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(52, 152, 219)
    dropdown.BorderSizePixel = 0
    
    -- Selected item button
    selected.Size = UDim2.new(1, 0, 1, 0)
    selected.BackgroundTransparency = 1
    selected.Text = properties.PlaceholderText or "Select..."
    selected.TextColor3 = Color3.fromRGB(255, 255, 255)
    selected.Font = Enum.Font.Gotham
    selected.TextSize = 14
    selected.Parent = dropdown
    
    -- Options list
    optionsList.Size = UDim2.new(1, 0, 0, 0)
    optionsList.Position = UDim2.new(0, 0, 1, 0)
    optionsList.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optionsList.BorderSizePixel = 0
    optionsList.Visible = false
    optionsList.Parent = dropdown
    
    -- Add options
    local function addOptions(options)
        for i, option in ipairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Size = UDim2.new(1, 0, 0, 30)
            optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
            optionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            optionButton.Text = option
            optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            optionButton.Font = Enum.Font.Gotham
            optionButton.TextSize = 14
            optionButton.BorderSizePixel = 0
            optionButton.Parent = optionsList
            
            optionButton.MouseButton1Click:Connect(function()
                selected.Text = option
                optionsList.Visible = false
                if properties.Callback then
                    properties.Callback(option)
                end
            end)
            
            -- Hover effect
            optionButton.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                }):Play()
            end)
            
            optionButton.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                }):Play()
            end)
        end
        
        optionsList.Size = UDim2.new(1, 0, 0, #options * 30)
    end
    
    -- Toggle dropdown
    selected.MouseButton1Click:Connect(function()
        optionsList.Visible = not optionsList.Visible
    end)
    
    -- Add options if provided
    if properties.Options then
        addOptions(properties.Options)
    end
    
    -- Rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = dropdown
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 6)
    UICorner2.Parent = optionsList
    
    if properties.Parent then
        dropdown.Parent = properties.Parent
    end
    
    return dropdown
end

return Dropdown