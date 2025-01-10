local Atlas = {}
local Components = nil

function Atlas:Init()
    Components = {
        Button = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Button.lua'))(),
        Frame = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Frame.lua'))(),
        Dropdown = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Dropdown.lua'))(),
        Slider = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Slider.lua'))(),
        Toggle = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Toggle.lua'))(),
        TextBox = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/TextBox.lua'))(),
        Notification = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Notification.lua'))()
    }
    
    return Components
end

function Atlas:CreateWindow(name)
    if not Components then
        error("Please call Atlas:Init() before creating a window")
    end
    
    local window = Components.Frame:New({
        Name = name,
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150),
        Draggable = true
    })
    return window
end

return Atlas
