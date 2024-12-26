Nautilus is a free UI library, here's what it offers so far:
------------------------------------------------------


  [+] Buttons
  
  [+] Toggles
  
  [+] Sliders
  
  [+] Dropdowns
  
  [+] Keybinds
  
  ------------------------------------------------------

Please keep in mind that this is basically a paste of the UI featured in this [tutorial series](https://www.youtube.com/watch?v=HQoukWZAfQk&list=PLPIdk8AY-0ybhxbzkv88ZGo7Hgxfx_qZD) but with my own color theme!

------------------------------------------------------

Creating the main window:

    local Nautilus = loadstring(game:HttpGet("https://raw.githubusercontent.com/Murvity/nautilus-lib/refs/heads/main/source.lua"))()

------------------------------------------------------

Creating a tab:

    local tab = Nautilus:CreateTab({
        title = "Title",
        icon = "rbx-asset-id"
    })

------------------------------------------------------

Creating a button:

    button = tab:CreateButton({
        title = "Button",
        callback = function()
            print("Hello"!)
        end
    })

------------------------------------------------------

Creating a toggle:

    toggle = tab:CreateToggle({
        title = "Toggle",
        callback = function()
            print("Hello!")
        end
    })

------------------------------------------------------

Creating a slider:

    slider = tab:CreateSlider({
        title = "Slider",
        min = 0,
        max = 100,
        default = 50,
        callback = function(v)
            print(v)
        end
    })

------------------------------------------------------

Creating a dropdown:

    dropdown = tab:CreateDropdown({
        title = "Dropdown",
        callback = function(v)
            print(v)
        end
    })

Adding/destroying dropdown buttons:

    dropdown:Add("Title", value)
    dropdown:Remove("Title")

------------------------------------------------------

Creating a keybind:

    keybind = tab:CreateKeybind({
        title = "Keybind",
        callback = function()
            print("Hello!")
        end
    })
