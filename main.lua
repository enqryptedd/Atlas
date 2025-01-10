local Library = {}
local Components = {}

-- Load all components
local function LoadComponents()
    Components.Button = require(script.Components.Button)
    Components.Frame = require(script.Components.Frame)
    Components.Dropdown = require(script.Components.Dropdown)
    Components.Slider = require(script.Components.Slider)
    Components.Toggle = require(script.Components.Toggle)
    Components.TextBox = require(script.Components.TextBox)
    Components.Notification = require(script.Components.Notification)
end

-- Initialize the library
function Library:Init()
    LoadComponents()
    return Components
end

-- Create window function (main container)
function Library:CreateWindow(name)
    local window = Components.Frame:New({
        Name = name,
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150),
        Draggable = true
    })
    return window
end

return Library