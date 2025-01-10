-- Example usage of the UI Library
local Library = loadstring(game:HttpGet('YOUR_RAW_MAIN_LUA_URL'))()

-- Initialize the library
local UI = Library:Init()

-- Create a window
local Window = Library:CreateWindow("Example UI")

-- Create components
local button = UI.Button:New({
    Parent = Window,
    Position = UDim2.new(0, 10, 0, 40),
    Text = "Click Me!",
    Callback = function()
        UI.Notification:New({
            Text = "Button clicked!",
            Duration = 2
        })
    end
})

local toggle = UI.Toggle:New({
    Parent = Window,
    Position = UDim2.new(0, 10, 0, 80),
    Text = "Toggle Feature",
    Callback = function(enabled)
        print("Toggle is now:", enabled)
    end
})

local slider = UI.Slider:New({
    Parent = Window,
    Position = UDim2.new(0, 10, 0, 120),
    MinValue = 0,
    MaxValue = 100,
    Callback = function(value)
        print("Slider value:", value)
    end
})

local dropdown = UI.Dropdown:New({
    Parent = Window,
    Position = UDim2.new(0, 10, 0, 180),
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(selected)
        print("Selected:", selected)
    end
})

local textbox = UI.TextBox:New({
    Parent = Window,
    Position = UDim2.new(0, 10, 0, 220),
    PlaceholderText = "Enter text...",
    Callback = function(text, enterPressed)
        if enterPressed then
            print("Submitted text:", text)
        end
    end
})