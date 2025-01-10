local Window = {}
Window.__index = Window

function Window:New(properties)
    local window = Instance.new("Frame")
    local titleBar = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local controls = Instance.new("Frame")
    local minimize = Instance.new("TextButton")
    local close = Instance.new("TextButton")
    local content = Instance.new("Frame")
    local sidebar = Instance.new("Frame")
    
    -- Main window
    window.Size = properties.Size or UDim2.new(0, 400, 0, 300)
    window.Position = properties.Position or UDim2.new(0.5, -200, 0.5, -150)
    window.BackgroundColor3 = Color3.fromRGB(10, 15, 29)
    window.BorderSizePixel = 0
    window.ClipsDescendants = true
    
    -- Title bar
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = window
    
    -- Title
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = properties.Title or "Window"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    -- Controls
    controls.Size = UDim2.new(0, 60, 1, 0)
    controls.Position = UDim2.new(1, -60, 0, 0)
    controls.BackgroundTransparency = 1
    controls.Parent = titleBar
    
    -- Minimize button
    minimize.Size = UDim2.new(0, 30, 1, 0)
    minimize.BackgroundTransparency = 1
    minimize.Text = "−"
    minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimize.Font = Enum.Font.GothamBold
    minimize.TextSize = 20
    minimize.Parent = controls
    
    -- Close button
    close.Size = UDim2.new(0, 30, 1, 0)
    close.Position = UDim2.new(1, -30, 0, 0)
    close.BackgroundTransparency = 1
    close.Text = "×"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.Font = Enum.Font.GothamBold
    close.TextSize = 20
    close.Parent = controls
    
    -- Content area
    content.Size = UDim2.new(1, -200, 1, -30)
    content.Position = UDim2.new(0, 200, 0, 30)
    content.BackgroundTransparency = 1
    content.Parent = window
    
    -- Sidebar
    sidebar.Size = UDim2.new(0, 200, 1, -30)
    sidebar.Position = UDim2.new(0, 0, 0, 30)
    sidebar.BackgroundColor3 = Color3.fromRGB(12, 17, 32)
    sidebar.BorderSizePixel = 0
    sidebar.Parent = window
    
    -- Window functionality
    local minimized = false
    local originalSize = window.Size
    
    minimize.MouseButton1Click:Connect(function()
        minimized = not minimized
        local targetSize = minimized and UDim2.new(window.Size.X.Scale, window.Size.X.Offset, 0, 30) or originalSize
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        game:GetService("TweenService"):Create(window, tweenInfo, {
            Size = targetSize
        }):Play()
    end)
    
    close.MouseButton1Click:Connect(function()
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        game:GetService("TweenService"):Create(window, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(window.Position.X.Scale, window.Position.X.Offset + window.Size.X.Offset/2, window.Position.Y.Scale, window.Position.Y.Offset + window.Size.Y.Offset/2)
        }):Play()
        
        wait(0.3)
        window:Destroy()
    end)
    
    -- Make window draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
        end
    end)
    
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Add hover effects
    local function addHoverEffect(button)
        button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.8,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end)
    end
    
    addHoverEffect(minimize)
    addHoverEffect(close)
    
    -- Rounded corners
    local function addCorners(frame, radius)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, radius or 8)
        corner.Parent = frame
    end
    
    addCorners(window)
    addCorners(sidebar, 0)
    
    -- Methods
    local windowObj = {
        Instance = window,
        Content = content,
        Sidebar = sidebar
    }
    
    function windowObj:AddToSidebar(element)
        element.Parent = self.Sidebar
    end
    
    function windowObj:AddToContent(element)
        element.Parent = self.Content
    end
    
    if properties.Parent then
        window.Parent = properties.Parent
    end
    
    return setmetatable(windowObj, Window)
end

return Window