local Slider = {}
Slider.__index = Slider

function Slider:New(properties)
    local slider = Instance.new("Frame")
    local bar = Instance.new("Frame")
    local fill = Instance.new("Frame")
    local knob = Instance.new("Frame")
    local valueLabel = Instance.new("TextLabel")

    slider.Size = properties.Size or UDim2.new(0, 200, 0, 50)
    slider.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    slider.BackgroundTransparency = 1

    bar.Size = UDim2.new(1, 0, 0, 4)
    bar.Position = UDim2.new(0, 0, 0.5, -2)
    bar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    bar.BorderSizePixel = 0
    bar.Parent = slider

    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = properties.FillColor or Color3.fromRGB(52, 152, 219)
    fill.BorderSizePixel = 0
    fill.Parent = bar

    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0.5, -8, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = bar

    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(0.5, -25, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "50"
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextSize = 14
    valueLabel.Parent = slider

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 2)
    UICorner.Parent = bar

    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 2)
    UICorner2.Parent = fill

    local UICorner3 = Instance.new("UICorner")
    UICorner3.CornerRadius = UDim.new(1, 0)
    UICorner3.Parent = knob

    local UserInputService = game:GetService("UserInputService")
    local dragging = false
    local minValue = properties.MinValue or 0
    local maxValue = properties.MaxValue or 100

    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(pos, 0, 1, 0)
        knob.Position = UDim2.new(pos, -8, 0.5, -8)

        local value = math.floor(minValue + (pos * (maxValue - minValue)))
        valueLabel.Text = tostring(value)

        if properties.Callback then
            properties.Callback(value)
        end
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)

    if properties.Parent then
        slider.Parent = properties.Parent
    end

    return slider
end

return Slider
