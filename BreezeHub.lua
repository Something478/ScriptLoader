local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Breeze hub",
    LoadingTitle = "Breeze hub",
    LoadingSubtitle = "By PlasmaByte_",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BreezeHub",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local mainTab = Window:CreateTab("Main")
local Section = mainTab:CreateSection("FPS")
mainTab:CreateButton({
    Name = "FPS Booster",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerebennieOfficial/ExoticJn/refs/heads/main/FpsBooster"))()
    end
})
local Section = mainTab:CreateSection("Any hero")
mainTab:CreateButton({
    Name = "Trashcan Man (By Friedpotato)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
    end
})
mainTab:CreateButton({
    Name = "Flight Tool (By Friedpotato)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Flight%20Tool%20Obfuscated.txt", true))()
    end
})

local saiTab = Window:CreateTab("For Saitama")
saiTab:CreateButton({
    Name = "Gojo Moveset",
    Callback = function()
        getgenv().FatalCombatSkillLayout = true
        getgenv().MovesetReachSound = true
        loadstring(game:HttpGet("https://gist.githubusercontent.com/SonicexePort/d83f3eca5e8092468df1551df09db39a/raw/861f16fbae8fab8803cabfbc01295bb5b687f86a/Death%20Port%20Six%20Eyes%20Public%20Beta"))()
    end
})
saiTab:CreateButton({
    Name = "Golden head Moveset",
    Callback = function()
        getgenv().stand = false
        getgenv().ken = false
        getgenv().Spawn = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Saitama%20to%20golden%20sigma"))()
    end
})
saiTab:CreateParagraph({
    Title = "Golden head explanation:",
    Content = "When ultimate is activated there is 60% to get it and 40% to lose and get death counter."
})
saiTab:CreateButton({
    Name = "Shinji Moveset",
    Callback = function()
        getgenv().speedtools = true
        getgenv().speedpunch = true
        getgenv().dance = false
        getgenv().night = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit"))()
    end
})

local sweatTab = Window:CreateTab("For Garou")

sweatTab:CreateButton({
    Name = "Teleport Guy (By Friedpotato)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Teleport%20Guy.txt", true))()
    end
})
sweatTab:CreateButton({
    Name = "Minos Prime",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Minos-Prime-Custom-Moveset-24060"))()
    end
})
sweatTab:CreateButton({
    Name = "A-Train moveset",
    Callback = function()
        getgenv().settings = {
            morph = { enabled = false, dontchangeskincolor = false },
            ult_forcewalkspeed = true,
            ult_walkspeed = 60,
            tp_duration = 0.15
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()
    end
})
sweatTab:CreateButton({
    Name = "Goku Moveset",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Hero-hunter-moveset-into-OP-goku-moveset-17468"))()
    end
})
sweatTab:CreateButton({
    Name = "Void Reaper (By Friedpotato)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Void%20Reaper%20Obfuscated.txt"))()
    end
})
sweatTab:CreateParagraph({
    Title = "Notice!:",
    Content = "Void reaper can't void anymore :("
})
sweatTab:CreateButton({
    Name = "Chainsaw Man (By Friedpotato)",
    Callback = function()
        getgenv().RunSpeed = 100
        getgenv().RunJump = 100
        getgenv().InstaKill = true
        getgenv().RevivePercent = 100
        getgenv().ChangeWalk = true
        getgenv().ChangeIdle = true
        getgenv().Night = false
        getgenv().DashNoCooldown = true
        getgenv().ExtraSkills = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt"))()
    end
})
sweatTab:CreateParagraph({
    Title = "NOTICE!",
    Content = "!! Chainsaw man will lag low-performing devices !!"
})
