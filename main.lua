local Library = {}
local Components = nil

-- Initialize the library
function Library:Init()
    -- Create Components table
    Components = {
        Button = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Button.lua'))(),
        Frame = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Frame.lua'))(),
        Dropdown = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Dropdown.lua'))(),
        Slider = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Slider.lua'))(),
        Toggle = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Toggle.lua'))(),
        TextBox = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/TextBox.lua'))(),
        Notification = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Notification.lua'))(),
        Window = loadstring(game:HttpGet('https://raw.githubusercontent.com/enqryptedd/Atlas/main/Components/Window.lua'))()
    }
    
    return Components
end

-- Create window function (main container)
function Library:CreateWindow(title)
    if not Components then
        error("Please call Library:Init() before creating a window")
    end
    
    local window = Components.Window:New({
        Title = title,
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200)
    })
    
    return window
end

return Library