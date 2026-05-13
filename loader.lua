-- vviolette Loader by Zigafon775
-- Финальная простая версия

print("Vviolette Loader by Zigafon775 запущен...")

local MainScript = game:HttpGet("https://raw.githubusercontent.com/Zigafon775/vviolette/main/vviolette.lua", true)

if not MainScript or MainScript == "" then
    warn("❌ Основной файл vviolette.lua не найден или пустой!")
    return
end

local success, err = pcall(function()
    loadstring(MainScript)()
end)

if success then
    print("✅ Vviolette script успешно запущен!")
else
    warn("❌ Ошибка запуска: " .. tostring(err))
end
