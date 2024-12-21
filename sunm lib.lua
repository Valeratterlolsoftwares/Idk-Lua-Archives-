-- Simple UI Library Module (like OrionLib)

local UI = {}

-- Function to create a new window
function UI:MakeWindow(settings)
    -- settings will include Name, HidePremium, etc.
    local Window = Instance.new("ScreenGui")
    Window.Name = settings.Name
    Window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the window frame
    local WindowFrame = Instance.new("Frame")
    WindowFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
    WindowFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    WindowFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    WindowFrame.Parent = Window

    -- Title Bar for Window
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TitleBar.Parent = WindowFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.Text = settings.Name
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextSize = 24
    TitleLabel.Parent = TitleBar

    -- Return the window object so it can be used
    return WindowFrame
end

-- Function to create tabs in the window
function UI:MakeTab(window, settings)
    local Tab = Instance.new("Frame")
    Tab.Size = UDim2.new(1, 0, 0.1, 0)
    Tab.Position = UDim2.new(0, 0, 0.1, 0)
    Tab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Tab.Parent = window

    -- Add a title for the tab
    local TabTitle = Instance.new("TextLabel")
    TabTitle.Size = UDim2.new(1, 0, 1, 0)
    TabTitle.Text = settings.Name
    TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabTitle.BackgroundTransparency = 1
    TabTitle.TextSize = 20
    TabTitle.Parent = Tab

    return Tab
end

-- Function to add a slider to a tab
function UI:AddSlider(tab, settings)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(0.8, 0, 0.2, 0)
    SliderFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderFrame.Parent = tab

    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(1, 0, 0.3, 0)
    SliderLabel.Text = settings.Name
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.TextSize = 18
    SliderLabel.Parent = SliderFrame

    local Slider = Instance.new("TextButton")
    Slider.Size = UDim2.new(1, 0, 0.4, 0)
    Slider.Position = UDim2.new(0, 0, 0.3, 0)
    Slider.Text = "Slide"
    Slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Slider.Parent = SliderFrame

    -- Slider value (you can enhance this with actual sliding behavior)
    Slider.MouseButton1Click:Connect(function()
        settings.Callback(settings.Min + (settings.Max - settings.Min) / 2) -- Example of updating the slider value
    end)

    return Slider
end

-- Initialize the UI library
function UI:Init()
    print("UI Library Initialized")
end

return UI
