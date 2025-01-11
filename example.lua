-- Example usage of the enhanced UI Library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/main.lua'))()

-- Initialize the library
local UI = Library:Init()

-- Create a window
local Window = Library:CreateWindow("Atlas Example")

-- Add items to sidebar
local sidebarButton1 = UI.Button:New({
    Text = "Dashboard",
    Size = UDim2.new(1, -20, 0, 40),
    Position = UDim2.new(0, 10, 0, 10),
    Callback = function()
        print("Dashboard clicked")
    end
})
Window:AddToSidebar(sidebarButton1)

local sidebarButton2 = UI.Button:New({
    Text = "Settings",
    Size = UDim2.new(1, -20, 0, 40),
    Position = UDim2.new(0, 10, 0, 60),
    Callback = function()
        print("Settings clicked")
    end
})
Window:AddToSidebar(sidebarButton2)

-- Add components to content area
local button = UI.Button:New({
    Size = UDim2.new(0, 200, 0, 40),
    Position = UDim2.new(0, 20, 0, 20),
    Text = "Click Me!",
    Callback = function()
        UI.Notification:New({
            Text = "Button clicked!",
            Duration = 2
        })
    end
})
Window:AddToContent(button)

local toggle = UI.Toggle:New({
    Size = UDim2.new(0, 200, 0, 40),
    Position = UDim2.new(0, 20, 0, 80),
    Text = "Toggle Feature",
    Callback = function(enabled)
        print("Toggle is now:", enabled)
    end
})
Window:AddToContent(toggle)

local slider = UI.Slider:New({
    Size = UDim2.new(0, 200, 0, 40),
    Position = UDim2.new(0, 20, 0, 140),
    MinValue = 0,
    MaxValue = 100,
    Callback = function(value)
        print("Slider value:", value)
    end
})
Window:AddToContent(slider)