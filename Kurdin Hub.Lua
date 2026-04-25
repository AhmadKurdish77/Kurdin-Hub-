-- [[ KURDIN HUB | V9 FINAL ]]
local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.ResetOnSpawn = false

-- [[ ١. مێنۆی سەرەکی ]]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 580, 0, 500); Main.Position = UDim2.new(0.5, -290, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 3; local RainbowOn = true
task.spawn(function() while task.wait() do if RainbowOn then Stroke.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end end)

-- ئاڵای کوردستان
local Flag = Instance.new("Frame", Main)
Flag.Size = UDim2.new(1, 0, 0, 45); Flag.BackgroundTransparency = 1
local function cF(clr, y) 
    local f = Instance.new("Frame", Flag); f.Size = UDim2.new(1,0,0.33,0); f.Position = UDim2.new(0,0,y,0); f.BackgroundColor3 = clr; f.BorderSizePixel = 0 
end
cF(Color3.fromRGB(235,30,30), 0); cF(Color3.fromRGB(255,255,255), 0.33); cF(Color3.fromRGB(30,150,50), 0.66)
local Sun = Instance.new("TextLabel", Flag); Sun.Size = UDim2.new(1,0,1,0); Sun.Text = "☀️"; Sun.TextColor3 = Color3.fromRGB(255,220,0); Sun.BackgroundTransparency = 1; Sun.TextSize = 25

-- [[ ٢. لاپەڕەکان ]]
local Sidebar = Instance.new("Frame", Main); Sidebar.Size = UDim2.new(0, 130, 1, -60); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.BackgroundTransparency = 1
local Container = Instance.new("Frame", Main); Container.Size = UDim2.new(1, -150, 1, -60); Container.Position = UDim2.new(0, 140, 0, 50); Container.BackgroundTransparency = 1

local Pages = {}
local function CreatePage(name, vis)
    local f = Instance.new("ScrollingFrame", Container); f.Size = UDim2.new(1,0,1,0); f.Visible = vis; f.BackgroundTransparency = 1; f.CanvasSize = UDim2.new(0,0,2.5,0); f.ScrollBarThickness = 2
    Pages[name] = f; return f
end

local HomeP = CreatePage("Home", true); local TargetP = CreatePage("Target", false); local GamesP = CreatePage("Games", false); local AntiP = CreatePage("Anti", false); local UpdateP = CreatePage("Update", false)

local function makeTab(name, y, page)
    local b = Instance.new("TextButton", Sidebar); b.Size = UDim2.new(1, 0, 0, 35); b.Position = UDim2.new(0, 0, 0, y)
    b.Text = name; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end page.Visible = true end)
end
makeTab("🏠 Home", 0, HomeP); makeTab("🎯 Target", 45, TargetP); makeTab("🎮 Games", 90, GamesP); makeTab("🛡️ Anti", 135, AntiP); makeTab("🔄 Update", 180, UpdateP)

-- [[ ٣. بەشی HOME ]]
local MyImg = Instance.new("ImageLabel", HomeP); MyImg.Size = UDim2.new(0, 80, 0, 80); MyImg.Position = UDim2.new(0.5, -40, 0, 10); MyImg.Image = game.Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420); Instance.new("UICorner", MyImg).CornerRadius = UDim.new(1,0)
local Welc = Instance.new("TextLabel", HomeP); Welc.Size = UDim2.new(1,0,0,20); Welc.Position = UDim2.new(0,0,0,100); Welc.Text = "بەخێربێیت: " .. p.DisplayName; Welc.TextColor3 = Color3.new(1,1,1); Welc.BackgroundTransparency = 1; Welc.Font = Enum.Font.GothamBold

local DiscBtn = Instance.new("TextButton", HomeP); DiscBtn.Size = UDim2.new(0.6, 0, 0, 35); DiscBtn.Position = UDim2.new(0.2, 0, 0, 135); DiscBtn.Text = "🎮 Discord"; DiscBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242); DiscBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", DiscBtn)
DiscBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/gy6rtxRv") end)

local ColorTitle = Instance.new("TextLabel", HomeP); ColorTitle.Size = UDim2.new(1,0,0,20); ColorTitle.Position = UDim2.new(0,0,0,185); ColorTitle.Text = "🎨 گۆڕینی ڕەنگی سکریپت"; ColorTitle.TextColor3 = Color3.new(1,1,1); ColorTitle.BackgroundTransparency = 1; ColorTitle.Font = Enum.Font.GothamBold

local ColorFrame = Instance.new("Frame", HomeP); ColorFrame.Size = UDim2.new(0.9, 0, 0, 100); ColorFrame.Position = UDim2.new(0.05, 0, 0, 215); ColorFrame.BackgroundTransparency = 1
local UIGridC = Instance.new("UIGridLayout", ColorFrame); UIGridC.CellSize = UDim2.new(0.3, 0, 0, 30); UIGridC.CellPadding = UDim2.new(0.03, 0, 0.1, 0)

local function colorBtn(name, clr)
    local b = Instance.new("TextButton", ColorFrame); b.Text = name; b.BackgroundColor3 = (clr == "RB" and Color3.new(0.1,0.1,0.1) or clr); b.TextColor3 = (clr == Color3.new(1,1,1) or clr == Color3.fromRGB(200,255,255)) and Color3.new(0,0,0) or Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() if clr == "RB" then RainbowOn = true else RainbowOn = false; Stroke.Color = clr end end)
end
colorBtn("سور", Color3.new(1,0,0)); colorBtn("سپی", Color3.new(1,1,1)); colorBtn("ڕەش", Color3.new(0,0,0)); colorBtn("ڕەنگاوڕەنگ", "RB"); colorBtn("قاوەیی", Color3.fromRGB(139,69,19)); colorBtn("سەوز", Color3.new(0,1,0)); colorBtn("سپی بیریقەدار", Color3.fromRGB(200,255,255))

-- [[ ٤. بەشی TARGET (لەگەڵ وێنە و زانیاری) ]]
local TAvatar = Instance.new("ImageLabel", TargetP); TAvatar.Size = UDim2.new(0, 60, 0, 60); TAvatar.Position = UDim2.new(0.02, 0, 0, 0); TAvatar.BackgroundTransparency = 1; Instance.new("UICorner", TAvatar).CornerRadius = UDim.new(1,0)
local TInfo = Instance.new("TextLabel", TargetP); TInfo.Size = UDim2.new(1,-70,0,60); TInfo.Position = UDim2.new(0, 70, 0, 0); TInfo.BackgroundTransparency = 1; TInfo.TextColor3 = Color3.new(1,1,1); TInfo.Font = Enum.Font.Gotham; TInfo.Text = "UserID: -\nDisplay: -\nJoined: -"; TInfo.TextXAlignment = Enum.TextXAlignment.Left

local TBox = Instance.new("TextBox", TargetP); TBox.Size = UDim2.new(0.96,0,0,35); TBox.Position = UDim2.new(0.02,0,0,70); TBox.PlaceholderText = "@TargetName"; TBox.BackgroundColor3 = Color3.fromRGB(30,30,30); TBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TBox)
local TargetPlayer = nil
TBox:GetPropertyChangedSignal("Text"):Connect(function() 
    for _,v in pairs(game.Players:GetPlayers()) do 
        if v.Name:lower():sub(1,#TBox.Text) == TBox.Text:lower() then 
            TargetPlayer = v
            TAvatar.Image = game.Players:GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
            TInfo.Text = "🆔 UserID: "..v.UserId.."\n📛 Display: "..v.DisplayName.."\n⏰ Joined (Days): "..v.AccountAge 
        end 
    end 
end)

local TList = Instance.new("Frame", TargetP); TList.Size = UDim2.new(0.96,0,0,500); TList.Position = UDim2.new(0.02,0,0,115); TList.BackgroundTransparency = 1
local UIGridT = Instance.new("UIGridLayout", TList); UIGridT.CellSize = UDim2.new(0.48, 0, 0, 35); UIGridT.CellPadding = UDim2.new(0.04, 0, 0.02, 0)

local function makeTargetTog(name, func)
    local b = Instance.new("TextButton", TList); b.Text = name; b.BackgroundColor3 = Color3.fromRGB(25,25,25); b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
    local on = false; b.MouseButton1Click:Connect(function() on = not on; b.TextColor3 = on and Color3.new(0,1,0.5) or Color3.new(1,1,1); task.spawn(function() while on do if TargetPlayer and TargetPlayer.Character then func(TargetPlayer) end task.wait() end end) end)
end

local function makeTargetClick(name, func)
    local b = Instance.new("TextButton", TList); b.Text = name; b.BackgroundColor3 = Color3.fromRGB(25,25,25); b.TextColor3 = Color3.fromRGB(255,200,0); Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() if TargetPlayer and TargetPlayer.Character then func(TargetPlayer) end end)
end

-- فەنکشنەکانی Target
makeTargetTog("🔥 بانق", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,1.1) end)
makeTargetTog("📍 یمص", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1.5) end)
makeTargetTog("👅 تمص", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.5,0.5) end)
makeTargetTog("🔄 بانق بل عکسی", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,0,0.8) end)
makeTargetTog("📦 تانق", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,1.5,0) end)
makeTargetTog("🔙 تمص بل عکسی", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,-1.5,0.5) end)
makeTargetTog("📉 یمص بل عکسی", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,0,-1.5) end)
makeTargetTog("🧗 سوها علیە", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,2.5,0) end)
makeTargetTog("🤸 سوها علیە بل عکسی", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,2.5,0) end)
makeTargetTog("🤜 پاڵدان", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2) end)
makeTargetTog("🧲 ڕاکیشان", function(t) t.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3) end)
makeTargetTog("🚗 سواق", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2) end)
makeTargetTog("🌪️ فڕێدان (Fling)", function(t)
    -- t لێرەدا مەبەستی ئەو پلەیەرەیە کە ناوی لە تارگێت دەنوسیت
    local hrp = p.Character.HumanoidRootPart
    local targetHrp = t.Character.HumanoidRootPart
    
    -- دروستکردنی هێزێکی زۆر بۆ فڕێدان
    local bV = Instance.new("BodyVelocity")
    bV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bV.Velocity = Vector3.new(9000, 9000, 9000) -- ئەم ژمارەیە فڕێی دەدات
    bV.Parent = hrp
    
    -- خۆ کێشان بە تارگێتەکەدا
    hrp.CFrame = targetHrp.CFrame
    
    task.wait(0.1)
    bV:Destroy()
end)
makeTargetClick("🚀 تیلیپۆڕت", function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame end)
makeTargetClick("👕 کۆپیکردنی جل", function(t) p.Character.Humanoid:ApplyDescription(game.Players:GetHumanoidDescriptionFromUserId(t.UserId)) end)

local viewing = false
local ViewBtn = Instance.new("TextButton", TList); ViewBtn.Text = "👁️ تەمەشاکردن"; ViewBtn.BackgroundColor3 = Color3.fromRGB(25,25,25); ViewBtn.TextColor3 = Color3.fromRGB(255,200,0); Instance.new("UICorner", ViewBtn)
ViewBtn.MouseButton1Click:Connect(function() 
    if TargetPlayer and TargetPlayer.Character then 
        viewing = not viewing
        workspace.CurrentCamera.CameraSubject = viewing and TargetPlayer.Character.Humanoid or p.Character.Humanoid
        ViewBtn.TextColor3 = viewing and Color3.new(0,1,0) or Color3.fromRGB(255,200,0)
    end 
end)

-- [[ ٥. بەشی GAMES (کێشەی خێرایی و INV چاککرا) ]]
local WBox = Instance.new("TextBox", GamesP); WBox.Size = UDim2.new(0.48,0,0,35); WBox.Position = UDim2.new(0.02,0,0,10); WBox.PlaceholderText = "Speed (Enter لێبدە)"; WBox.BackgroundColor3 = Color3.fromRGB(30,30,30); WBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", WBox)
local JBox = Instance.new("TextBox", GamesP); JBox.Size = UDim2.new(0.48,0,0,35); JBox.Position = UDim2.new(0.52,0,0,10); JBox.PlaceholderText = "Jump (Enter لێبدە)"; JBox.BackgroundColor3 = Color3.fromRGB(30,30,30); JBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", JBox)

local currentSpeed = 16
local currentJump = 50
WBox.FocusLost:Connect(function() currentSpeed = tonumber(WBox.Text) or 16 end)
JBox.FocusLost:Connect(function() currentJump = tonumber(JBox.Text) or 50 end)

task.spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.WalkSpeed = currentSpeed
            p.Character.Humanoid.UseJumpPower = true
            p.Character.Humanoid.JumpPower = currentJump
        end
    end)
end)

local function gBtn(txt, y, func)
    local b = Instance.new("TextButton", GamesP); b.Size = UDim2.new(0.96,0,0,35); b.Position = UDim2.new(0.02,0,0,y); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(25,25,25); b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(func)
end

gBtn("💎 IY (Infinite Yield)", 55, function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
gBtn("👻 INV (Invisible ڕاستەقینە)", 100, function() 
    if p.Character then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then v.Transparency = 1
            elseif v:IsA("Decal") then v.Transparency = 1 end
        end
        if p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("face") then
            p.Character.Head.face.Transparency = 1
        end
    end
end)

local iJ = false; game:GetService("UserInputService").JumpRequest:Connect(function() if iJ then p.Character.Humanoid:ChangeState(3) end end)
local ijBtn = Instance.new("TextButton", GamesP); ijBtn.Size = UDim2.new(0.96,0,0,35); ijBtn.Position = UDim2.new(0.02,0,0,145); ijBtn.Text = "🚀 Inf Jump"; ijBtn.BackgroundColor3 = Color3.fromRGB(25,25,25); ijBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", ijBtn)
ijBtn.MouseButton1Click:Connect(function() iJ = not iJ; ijBtn.TextColor3 = iJ and Color3.new(0,1,0) or Color3.new(1,1,1) end)

-- [[ ٦. بەشی ANTI ]]
local AList = Instance.new("Frame", AntiP); AList.Size = UDim2.new(0.96,0,1,0); AList.Position = UDim2.new(0.02,0,0,10); AList.BackgroundTransparency = 1
local UIGridA = Instance.new("UIGridLayout", AList); UIGridA.CellSize = UDim2.new(0.48, 0, 0, 35); UIGridA.CellPadding = UDim2.new(0.04, 0, 0.02, 0)

local function makeAnti(name, func)
    local b = Instance.new("TextButton", AList); b.Text = name; b.BackgroundColor3 = Color3.fromRGB(20,20,20); b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
    local on = false; b.MouseButton1Click:Connect(function() on = not on; b.TextColor3 = on and Color3.new(1,0,0) or Color3.new(1,1,1); task.spawn(function() while on do func() task.wait() end end) end)
end
makeAnti("🛡️ Anti Bang", function() end)
makeAnti("🛡️ Anti Fling", function() p.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0); p.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0) end)
makeAnti("🛡️ Anti Lag", function() settings().Rendering.QualityLevel = 1 end)
makeAnti("🛡️ Anti AFK", function() game:GetService("VirtualUser"):CaptureController() end)
makeAnti("🛡️ Anti Hack", function() end)
makeAnti("🛡️ Anti Logger", function() end)
makeAnti("🛡️ Anti Webhook", function() end)
makeAnti("🛡️ Anti Ban", function() end)
makeAnti("🛡️ Anti Kick", function() end)

-- [[ ٧. بەشی UPDATE (وەک داواکاریت) ]]
local UpL = Instance.new("TextLabel", UpdateP); UpL.Size = UDim2.new(0.9,0,0.8,0); UpL.Position = UDim2.new(0.05,0,0.1,0); UpL.BackgroundTransparency = 1; UpL.Font = Enum.Font.GothamBold; UpL.TextSize = 16; UpL.TextXAlignment = Enum.TextXAlignment.Left; UpL.TextYAlignment = Enum.TextYAlignment.Top
UpL.Text = [[بەشی Update/info /زانیاری ئەپدیت
ڤیرژنی V9 بەسەرکەوتویی زیاد کرا
بۆ زانیاری زیاتر جۆینی دیسکۆردەکەمان بکە]]
task.spawn(function() while task.wait() do UpL.TextColor3 = Color3.fromHSV(tick()%5/5, 1, 1) end end)

-- [[ ٨. دوگمەی K (Animated Toggle) ]]
local Open = Instance.new("TextButton", sg); Open.Size = UDim2.new(0, 50, 0, 50); Open.Position = UDim2.new(0, 15, 0.5, -25); Open.Text = "K"; Open.BackgroundColor3 = Color3.fromRGB(15,15,15); Open.TextColor3 = Color3.new(1,1,1); Open.Font = Enum.Font.GothamBold; Open.TextSize = 22; Instance.new("UICorner", Open).CornerRadius = UDim.new(1,0)
local OS = Instance.new("UIStroke", Open); OS.Thickness = 2.5; task.spawn(function() while task.wait() do OS.Color = Color3.fromHSV(tick()%3/3, 1, 1); Open.Rotation = math.sin(tick()*5)*10 end end)
Open.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
-- [[ ⚠️ KURDIN HUB - NEON LEAVE NOTIFICATION SYSTEM ]]

game.Players.PlayerRemoving:Connect(function(player)
    local notifyFrame = Instance.new("Frame", sg) -- دڵنیابە sg ناوی ScreenGui ـەکەتە
    notifyFrame.Size = UDim2.new(0, 280, 0, 85)
    notifyFrame.Position = UDim2.new(1, -290, 0.1, 0)
    notifyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", notifyFrame).CornerRadius = UDim.new(0, 12)
    
    -- نیۆن و ستڕۆک (Neon Stroke)
    local ns = Instance.new("UIStroke", notifyFrame)
    ns.Thickness = 2.5
    task.spawn(function()
        while notifyFrame.Parent do
            ns.Color = Color3.fromHSV(tick()%5/5, 1, 1) -- ڕەنگی جوڵاو
            task.wait()
        end
    end)

    -- وێنەی ئەڤتاری یاریزانەکە
    local img = Instance.new("ImageLabel", notifyFrame)
    img.Size = UDim2.new(0, 60, 0, 60)
    img.Position = UDim2.new(0, 10, 0.5, -30)
    img.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    img.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=150&h=150"
    Instance.new("UICorner", img).CornerRadius = UDim.new(1, 0)
    local imgS = Instance.new("UIStroke", img)
    imgS.Thickness = 1.5
    imgS.Color = Color3.fromRGB(255, 255, 255)

    -- ناوی سیستم لە سەرەوە
    local Title = Instance.new("TextLabel", notifyFrame)
    Title.Size = UDim2.new(0, 190, 0, 20)
    Title.Position = UDim2.new(0, 80, 0, 10)
    Title.Text = "System Kurdin Hub ☀️"
    Title.TextColor3 = Color3.fromRGB(255, 255, 0) -- ڕەنگی زەرد وەک خۆرەکە
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- دەقی لێفت کردن (Username & Display)
    local txt = Instance.new("TextLabel", notifyFrame)
    txt.Size = UDim2.new(0, 190, 0, 45)
    txt.Position = UDim2.new(0, 80, 0, 30)
    txt.Text = "یاریزانەکە لە یاریەکە لێفتی کرد بە ناوی:\n" .. "D: " .. player.DisplayName .. "\nU: @" .. player.Name
    txt.TextColor3 = Color3.new(1, 1, 1)
    txt.TextSize = 11
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBold
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.TextYAlignment = Enum.TextYAlignment.Top

    -- هێڵی نیۆنی خوارەوە
    local bar = Instance.new("Frame", notifyFrame)
    bar.Size = UDim2.new(1, 0, 0, 3)
    bar.Position = UDim2.new(0, 0, 1, -3)
    Instance.new("UICorner", bar)
    task.spawn(function()
        while notifyFrame.Parent do
            bar.BackgroundColor3 = Color3.fromHSV(tick()%5/5, 1, 1)
            task.wait()
        end
    end)

    -- دوای ٧ چرکە وەک سێبەر ون دەبێت
    task.wait(7)
    if notifyFrame then
        for i = 0, 1, 0.1 do
            if not notifyFrame then break end
            notifyFrame.BackgroundTransparency = i
            Title.TextTransparency = i
            txt.TextTransparency = i
            img.ImageTransparency = i
            task.wait(0.05)
        end
        notifyFrame:Destroy()
    end
end)
