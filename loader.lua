-- vviolette Loader by Zigafon775

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "vvioletteLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 240)
Main.Position = UDim2.new(0.5, -200, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 0, 70)
Title.Position = UDim2.new(0, 20, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Vviolette"
Title.TextColor3 = Color3.fromRGB(255, 100, 180)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -80, 0, 30)
Subtitle.Position = UDim2.new(0, 20, 0, 65)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "by Zigafon775"
Subtitle.TextColor3 = Color3.fromRGB(160, 160, 180)
Subtitle.TextScaled = true
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Main

-- Иконка темы
local ThemeBtn = Instance.new("TextButton")
ThemeBtn.Size = UDim2.new(0, 50, 0, 50)
ThemeBtn.Position = UDim2.new(1, -65, 0, 15)
ThemeBtn.BackgroundTransparency = 1
ThemeBtn.Text = "🌑"
ThemeBtn.TextScaled = true
ThemeBtn.Font = Enum.Font.GothamBold
ThemeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ThemeBtn.Parent = Main

local isDark = true

local function switchTheme()
    isDark = not isDark
    if isDark then
        Main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        Title.TextColor3 = Color3.fromRGB(255, 100, 180)
        ThemeBtn.Text = "🌑"
    else
        Main.BackgroundColor3 = Color3.fromRGB(245, 245, 250)
        Title.TextColor3 = Color3.fromRGB(30, 30, 30)
        ThemeBtn.Text = "☀️"
    end
end

ThemeBtn.MouseButton1Click:Connect(switchTheme)

-- Кнопка запуска
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.85, 0, 0, 55)
StartBtn.Position = UDim2.new(0.075, 0, 0, 120)
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
DiscordBtn.Position = UDim2.new(0.075, 0, 0, 185)
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
        warn("Ошибка загрузки: " .. tostring(err))
    end
end)

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/qXxSGDtkeC")
    DiscordBtn.Text = "✅ Скопировано!"
    task.wait(2)
    DiscordBtn.Text = "discord.gg/qXxSGDtkeC"
end)

print("Vviolette Loader by Zigafon775 загружен")

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
