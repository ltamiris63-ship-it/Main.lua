-- FLUENT UI UNIVERSAL HUB
-- DELTA FRIENDLY

local Fluent = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/dawid-scripts/Fluent/master/main.lua"
))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Root = Character:WaitForChild("HumanoidRootPart")

--------------------------------------------------
-- WINDOW
--------------------------------------------------
local Window = Fluent:CreateWindow({
    Title = "Fluent Universal Hub",
    SubTitle = "Delta",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false,
    Theme = "Dark"
})

--------------------------------------------------
-- PLAYER TAB
--------------------------------------------------
local PlayerTab = Window:AddTab({ Title = "Player", Icon = "user" })

PlayerTab:AddSlider("Speed", {
    Title = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 200,
    Callback = function(v)
        Humanoid.WalkSpeed = v
    end
})

PlayerTab:AddSlider("Jump", {
    Title = "JumpPower",
    Default = 50,
    Min = 50,
    Max = 300,
    Callback = function(v)
        Humanoid.JumpPower = v
    end
})

--------------------------------------------------
-- INFINITE JUMP
--------------------------------------------------
local InfJump = false

PlayerTab:AddToggle("InfJump", {
    Title = "Infinite Jump",
    Default = false,
    Callback = function(v)
        InfJump = v
    end
})

UIS.JumpRequest:Connect(function()
    if InfJump then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

--------------------------------------------------
-- END
--------------------------------------------------
Window:SelectTab(1)
