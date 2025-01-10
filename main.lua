local Atlas = {}
local Components = {}

-- Load all components from GitHub URLs
local function LoadComponents()
    Components.Button = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Button.lua'))()
    Components.Frame = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Frame.lua'))()
    Components.Dropdown = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Dropdown.lua'))()
    Components.Slider = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Slider.lua'))()
    Components.Toggle = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Toggle.lua'))()
    Components.TextBox = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/TextBox.lua'))()
    Components.Notification = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/refs/heads/main/Components/Notification.lua'))()
end

function Atlas:Init()
    LoadComponents()
    return Components
end

function Atlas:CreateWindow(name)
    local window = Components.Frame:New({
        Name = name,
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150),
        Draggable = true
    })
    return window
end

return Atlas
