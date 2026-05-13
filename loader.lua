-- vviolette Loader by Zigafon775 (упрощённая версия)

print("Vviolette Loader запущен...")

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zigafon775/vviolette/main/vviolette.lua", true))()
end)

if success then
    print("✅ Vviolette script успешно запущен!")
else
    warn("❌ Ошибка при запуске: " .. tostring(err))
end
