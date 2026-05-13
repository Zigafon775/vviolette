-- vviolette Loader by Zigafon775
-- Тёмная тема + Draggable

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "vvioletteLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 360, 0, 240)
Main.Position = UDim2.new(0.5, -180, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 55)
Title.BackgroundTransparency = 1
Title.Text = "vviolette script"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local Author = Instance.new("TextLabel")
Author.Size = UDim2.new(1, 0, 0, 25)
Author.Position = UDim2.new(0, 0, 0, 52)
Author.BackgroundTransparency = 1
Author.Text = "by Zigafon775"
Author.TextColor3 = Color3.fromRGB(120, 120, 140)
Author.TextScaled = true
Author.Font = Enum.Font.Gotham
Author.Parent = Main

-- Кнопка запуска
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.85, 0, 0, 55)
StartBtn.Position = UDim2.new(0.075, 0, 0, 100)
StartBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
StartBtn.Text = "ЗАПУСТИТЬ СКРИПТ"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextScaled = true
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = Main

Instance.new("UICorner", StartBtn).CornerRadius = UDim.new(0, 12)

-- Переключатель темы (просто для красоты)
local ThemeBtn = Instance.new("TextButton")
ThemeBtn.Size = UDim2.new(0.85, 0, 0, 40)
ThemeBtn.Position = UDim2.new(0.075, 0, 0, 170)
ThemeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ThemeBtn.Text = "Сменить тему"
ThemeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ThemeBtn.TextScaled = true
ThemeBtn.Font = Enum.Font.GothamSemibold
ThemeBtn.Parent = Main

Instance.new("UICorner", ThemeBtn).CornerRadius = UDim.new(0, 10)

-- Функция запуска
local function loadScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zigafon775/vviolette/main/vviolette.lua"))()
    end)
    if success then
        print("✅ vviolette script by Zigafon775 успешно запущен!")
    else
        warn("❌ Ошибка загрузки: " .. tostring(err))
    end
end

StartBtn.MouseButton1Click:Connect(loadScript)

-- Перетаскивание окна
local dragging = false
local dragInput
local dragStart
local startPos

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

Main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("vviolette Loader by Zigafon775 загружен")
