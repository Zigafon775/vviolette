-- vviolette loader by Zigafon775
-- GUI + красивые темы

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
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "vviolette script"
Title.TextColor3 = Color3.fromRGB(255, 90, 180)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local By = Instance.new("TextLabel")
By.Size = UDim2.new(1, 0, 0, 25)
By.Position = UDim2.new(0, 0, 0, 55)
By.BackgroundTransparency = 1
By.Text = "by Zigafon775"
By.TextColor3 = Color3.fromRGB(160, 160, 190)
By.TextScaled = true
By.Font = Enum.Font.Gotham
By.Parent = Main

-- Кнопки тем
local themes = {"ПРИЯТНЫЙ", "КРУТОЙ", "КРАСИВЫЙ"}
local current = 1

local function loadScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zigafon775/vviolette/main/vviolette.lua"))()
    end)
    if success then
        print("✅ vviolette script успешно запущен!")
    else
        warn("❌ Ошибка: " .. err)
    end
end

-- Кнопка запуска
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.85, 0, 0, 50)
StartBtn.Position = UDim2.new(0.075, 0, 0, 110)
StartBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 150)
StartBtn.Text = "ЗАПУСТИТЬ СКРИПТ"
StartBtn.TextColor3 = Color3.new(1,1,1)
StartBtn.TextScaled = true
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = Main

Instance.new("UICorner", StartBtn).CornerRadius = UDim.new(0, 12)

StartBtn.MouseButton1Click:Connect(loadScript)

-- Переключатель цветов
local ColorBtn = Instance.new("TextButton")
ColorBtn.Size = UDim2.new(0.85, 0, 0, 40)
ColorBtn.Position = UDim2.new(0.075, 0, 0, 170)
ColorBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
ColorBtn.Text = "Сменить тему"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.TextScaled = true
ColorBtn.Font = Enum.Font.GothamSemibold
ColorBtn.Parent = Main

Instance.new("UICorner", ColorBtn).CornerRadius = UDim.new(0, 10)

ColorBtn.MouseButton1Click:Connect(function()
    current = current % 3 + 1
    local colors = {
        Color3.fromRGB(255, 90, 180),   -- Приятный
        Color3.fromRGB(0, 220, 255),    -- Крутой
        Color3.fromRGB(180, 80, 255)    -- Красивый
    }
    Main.BackgroundColor3 = colors[current]
end)

print("vviolette Loader by Zigafon775 загружен")
