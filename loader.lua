-- vviolette Loader by Zigafon775
-- Простая версия

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "vvioletteLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 380, 0, 220)
Main.Position = UDim2.new(0.5, -190, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 0, 60)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "vviolette script"
Title.TextColor3 = Color3.fromRGB(235, 235, 235)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local Author = Instance.new("TextLabel")
Author.Size = UDim2.new(1, -70, 0, 25)
Author.Position = UDim2.new(0, 15, 0, 52)
Author.BackgroundTransparency = 1
Author.Text = "by Zigafon775"
Author.TextColor3 = Color3.fromRGB(140, 140, 160)
Author.TextScaled = true
Author.Font = Enum.Font.Gotham
Author.TextXAlignment = Enum.TextXAlignment.Left
Author.Parent = Main

-- Кнопка запуска
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.85, 0, 0, 55)
StartBtn.Position = UDim2.new(0.075, 0, 0, 100)
StartBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
StartBtn.Text = "ЗАПУСТИТЬ СКРИПТ"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextScaled = true
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = Main

Instance.new("UICorner", StartBtn).CornerRadius = UDim.new(0, 12)

-- Discord
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0.85, 0, 0, 40)
DiscordBtn.Position = UDim2.new(0.075, 0, 0, 165)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.Text = "discord.gg/qXxSGDtkeC"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextScaled = true
DiscordBtn.Font = Enum.Font.GothamSemibold
DiscordBtn.Parent = Main

Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0, 10)

-- Запуск
StartBtn.MouseButton1Click:Connect(function()
    StartBtn.Text = "ЗАГРУЗКА..."
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zigafon775/vviolette/main/vviolette.lua", true))()
    end)
    if success then
        StartBtn.Text = "✅ ЗАПУЩЕНО"
    else
        StartBtn.Text = "❌ ОШИБКА"
        warn("Ошибка: " .. tostring(err))
    end
end)

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/qXxSGDtkeC")
    DiscordBtn.Text = "✅ Скопировано!"
    task.wait(2)
    DiscordBtn.Text = "discord.gg/qXxSGDtkeC"
end)

print("vviolette Loader by Zigafon775 загружен")

-- Draggable
local dragging = false
local dragStart, startPos

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
