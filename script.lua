-- Unified Roblox Script for Game Development
-- Features: GUI, Fly, Set Speed, and Educational Aimbot Placeholder

local player = game.Players.LocalPlayer
local flyEnabled = false
local bodyVelocity
local originalGravity = workspace.Gravity
local currentSpeed = 16  -- Default walking speed

-- Toggle fly mode function
local function toggleFly()
    if not player.Character or not player.Character:FindFirstChild("Humanoid") then return end
    local humanoid = player.Character.Humanoid

    if flyEnabled then
        -- Disable flying
        humanoid.PlatformStand = false
        if bodyVelocity then bodyVelocity:Destroy() end
        workspace.Gravity = originalGravity
        flyEnabled = false
    else
        -- Enable flying
        originalGravity = workspace.Gravity
        workspace.Gravity = 0
        humanoid.PlatformStand = true
        bodyVelocity = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
        bodyVelocity.Velocity = Vector3.new(0,0,0)
        bodyVelocity.MaxForce = Vector3.new(1e4, 1e4, 1e4)
        flyEnabled = true
    end
end

-- Set player speed function
local function setSpeed(speed)
    if not player.Character or not player.Character:FindFirstChild("Humanoid") then return end
    local humanoid = player.Character.Humanoid
    humanoid.WalkSpeed = speed
end

local function aimbotFeature()
    print("Coming Soon...")
end

local function setupGui()
    local ScreenGui = Instance.new("ScreenGui")
    local MainWindow = Instance.new("Frame", ScreenGui)
    local FlyButton = Instance.new("TextButton", MainWindow)
    local SpeedSlider = Instance.new("TextBox", MainWindow)
    local AimbotButton = Instance.new("TextButton", MainWindow)

    ScreenGui.Parent = game.CoreGui
    MainWindow.Name = "MainWindow"
    MainWindow.Size = UDim2.new(0, 600, 0, 400)
    MainWindow.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainWindow.BackgroundColor3 = Color3.fromRGB(42, 42, 42)

    -- Fly button
    FlyButton.Name = "FlyButton"
    FlyButton.Text = "Toggle Fly"
    FlyButton.Size = UDim2.new(0, 100, 0, 50)
    FlyButton.Position = UDim2.new(0, 20, 0, 50)
    FlyButton.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
    FlyButton.MouseButton1Click:Connect(toggleFly)

    SpeedSlider.Name = "SpeedSlider"
    SpeedSlider.Text = "Set Speed (16)"
    SpeedSlider.Size = UDim2.new(0, 100, 0, 50)
    SpeedSlider.Position = UDim2.new(0, 20, 0, 110)
    SpeedSlider.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
    SpeedSlider.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local speed = tonumber(SpeedSlider.Text) or 16
            setSpeed(speed)
        end
    end)

    -- Aimbot button
    AimbotButton.Name = "AimbotButton"
    AimbotButton.Text = "Aimbot"
    AimbotButton.Size = UDim2.new(0, 150, 0, 50)
    AimbotButton.Position = UDim2.new(0, 20, 0, 170)
    AimbotButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red to indicate caution
    AimbotButton.MouseButton1Click:Connect(aimbotFeature)
end

-- Execute the GUI setup function
setupGui()
