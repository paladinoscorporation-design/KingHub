-- Carrega Redz Library
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- Cria a janela
local Window = redzlib:MakeWindow({
    Title = "🎄 KING HUB – CHRISTMAS 🎅",
    SubTitle = "by PALADINOSrk",
    SaveFolder = "KingHub_Natal"
})

-- Botão de minimizar (ocultar)
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://115420487410657",
        BackgroundTransparency = 0,
        Size = UDim2.new(0,46,0,46)
    },
    Corner = { CornerRadius = UDim.new(1,0) }
})

----------------------------------------------------
-- Dialog inicial
----------------------------------------------------
Window:Dialog({
    Title = "🎁 Feliz Natal!",
    Text = "Bem-vindo ao King Hub Natalino! Qualquer bug, manda no Discord 🎄",
    Options = {
        {"Ok", function() end},
        {"Discord", function() setclipboard("https://discord.gg/RC9UugBuWF") end}
    }
})

----------------------------------------------------
-- ABA: INFORMATIONS
----------------------------------------------------
local TabInfo = Window:MakeTab({"Informactions", "rbxassetid://108984542249016"})

TabInfo:AddDiscordInvite({
    Name = "King Hub Discord",
    Description = "Entre no Discord oficial do King Hub!",
    Logo = "rbxassetid://97198896237694",
    Invite = "https://discord.gg/RC9UugBuWF"
})

TabInfo:AddButton({
    "Tutorial Painel Admin",
    function()
        Window:Dialog({
            Title = "📚 Tutorial",
            Text = "Pra ganhar o painel admin: torneio, evento, divulgador ou compra.",
            Options = {{"Fechar", function() end}}
        })
    end
})

----------------------------------------------------
-- ABA: RGB (RPName)
----------------------------------------------------
local TabRGB = Window:MakeTab({"RGB", "rbxassetid://12111879608"})

local rgbSpeed = 1
local rgbMode = "Hallowen mode"
local rgbActive = false

TabRGB:AddToggle({
    Name = "RGB Name & Bio",
    Default = false,
    Callback = function(v)
        rgbActive = v
    end
})

TabRGB:AddSlider({
    Name = "Velocidade RGB",
    Min = 1,
    Max = 50,
    Default = 10,
    Callback = function(v)
        rgbSpeed = v
    end
})

TabRGB:AddDropdown({
    Name = "Modo RGB",
    Options = {"Hallowen mode", "Color mode", "Crazymode"},
    Default = "Hallowen mode",
    Callback = function(v)
        rgbMode = v
    end
})

-- LOOP RGB SUAVE DO RPName
task.spawn(function()
    local hue = 0
    while task.wait(0.05) do
        if rgbActive then
            hue = (hue + (rgbSpeed/500)) % 1

            local color
            if rgbMode == "Color mode" then
                color = Color3.fromHSV(hue,1,1)
            else
                local h = 0.09 + math.sin(hue * math.pi * 2) * 0.03
                color = Color3.fromHSV(h,1,1)
            end

            pcall(function()
                local args = {
                    "PickingRPNameColor",
                    color
                }
                game:GetService("ReplicatedStorage")
                :WaitForChild("RE")
                :WaitForChild("1RPNam1eColo1r")
                :FireServer(unpack(args))
            end)
        end
    end
end)

----------------------------------------------------
-- ABA: CARS
----------------------------------------------------
local TabCars = Window:MakeTab({"Cars", "rbxassetid://13773422471"})

local selectedCar = "BatMobile"
local carList = {
    "BatMobile",
    "Bugatti",
    "CyberTruck",
    "EasterBig",
    "Ferrari",
    "Lamboego",
    "Lamborgini",
    "Limo",
    "Roadster",
    "RollsRoyce",
    "Skyline",
    "Summer2025SuperCar",
    "SuperCar"
}

TabCars:AddDropdown({
    Name = "Escolha o carro",
    Options = carList,
    Default = selectedCar,
    Callback = function(v)
        selectedCar = v
    end
})

TabCars:AddButton({
    "Spawn Car",
    function()
        pcall(function()
            game.ReplicatedStorage.RE["1Ca1r"]:FireServer("PickingCar", selectedCar)
        end)
    end
})

----------------------------------------------------
-- TEMA NATALINO (vermelho)
----------------------------------------------------
redzlib:SetTheme("Red")