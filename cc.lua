if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(.3)
local G = game.GameId
if tostring(G) ~= "7436755782" then return end
print("exo start > ")
if _G.is_running_trade then
    warn("Already running")
    return
end
_G.is_running_trade = true
local V = {}
V.LocalizationService = game:GetService("LocalizationService")
V.UserInputService = game:GetService("UserInputService")
V.HttpService = game:GetService("HttpService")
V.ReplicatedStorage = game:GetService("ReplicatedStorage")
V.Workspace = game:GetService("Workspace")
V.TeleportService = game:GetService("TeleportService")
V.Players = game:GetService("Players")
V.RunService = game:GetService("RunService")
V.MarketplaceService = game:GetService("MarketplaceService")
V.TextChatService = game:GetService("TextChatService")
V.Modules = V.ReplicatedStorage:WaitForChild("Modules")
V.LocalPlayer = V.Players.LocalPlayer
V.Character = V.LocalPlayer.Character or V.LocalPlayer.CharacterAdded:Wait()
V.Backpack = V.LocalPlayer:WaitForChild("Backpack")
V.PlayerGui = V.LocalPlayer:WaitForChild("PlayerGui")
V.player_humanoid = V.Character:FindFirstChildOfClass("Humanoid")
print("Loading x0")
V.channel = (V.TextChatService:WaitForChild("TextChannels")):WaitForChild("RBXGeneral")
V.GameEvents = V.ReplicatedStorage:WaitForChild("GameEvents")
V.petsServiceRemote = V.GameEvents:WaitForChild("PetsService")
V.PetEggService = V.GameEvents:WaitForChild("PetEggService")
V.BuyGearStock = V.GameEvents.BuyGearStock
V.BuySeedStock = V.GameEvents.BuySeedStock
V.BuyPetEgg = V.GameEvents.BuyPetEgg
V.BuyTravelingMerchantShopStock = V.GameEvents:WaitForChild("BuyTravelingMerchantShopStock")
V.SellPetRemote = V.GameEvents:WaitForChild("SellPet_RE")
V.SellAllPetsRemote = V.GameEvents:WaitForChild("SellAllPets_RE")
V.Sell_Inventory = V.GameEvents.Sell_Inventory
V.DataStream = V.GameEvents.DataStream
V.PlantRemote = V.GameEvents:WaitForChild("Plant_RE")
V.collectEvent = (V.GameEvents:WaitForChild("Crops")):WaitForChild("Collect")
V.FavItem = V.GameEvents:WaitForChild("Favorite_Item")
V.BuyEventShopStock = V.GameEvents:WaitForChild("BuyEventShopStock")
V.BoostService = V.GameEvents:WaitForChild("PetBoostService")
V.TrowelRemote = V.GameEvents:WaitForChild("TrowelRemote")
V.MutationService = V.GameEvents:WaitForChild("PetMutationMachineService_RE")
V.ActivePetService = V.GameEvents:WaitForChild("ActivePetService")
V.SellPetShopSelected = V.GameEvents:WaitForChild("SellPetShopSelected")
print("Loading x1")
V.SprayService_RE = V.GameEvents:WaitForChild("SprayService_RE")
V.CookingPotService_RE = V.GameEvents:WaitForChild("CookingPotService_RE")
V.CraftingGlobalObjectService = V.GameEvents:WaitForChild("CraftingGlobalObjectService")
V.SprinklerService = V.GameEvents:WaitForChild("SprinklerService")
V.Water_RE = V.GameEvents:WaitForChild("Water_RE")
V.BonfireService = V.GameEvents:WaitForChild("BonfireService")
V.Remove_Item = V.GameEvents.Remove_Item
V.DeleteObject = V.ReplicatedStorage.GameEvents.DeleteObject
V.PetLeadService_RE = V.GameEvents.PetLeadService_RE
V.PetCooldownsUpdated = V.GameEvents.PetCooldownsUpdated
V.TryUseGear = V.GameEvents.TryUseGear
V.TryMapleSyrup = V.GameEvents.TryMapleSyrup
V.Reclaimer = V.GameEvents.ReclaimerService_RE
V.BuySeasonPassStock = V.GameEvents:FindFirstChild("SeasonPass") and
V.GameEvents.SeasonPass:FindFirstChild("BuySeasonPassStock")
print("Loading x2")
V.petsContainer = V.Workspace:WaitForChild("PetsPhysical")
V.GearShopUI = V.PlayerGui:WaitForChild("Gear_Shop")
V.SeedShopUI = V.PlayerGui:WaitForChild("Seed_Shop")
V.PetShopUI = V.PlayerGui:WaitForChild("PetShop_UI")
V.TravelingMerchantShop_UI = V.PlayerGui:WaitForChild("TravelingMerchantShop_UI")
V.DigRemote = (V.GameEvents:WaitForChild("DiggingMiniGame")):WaitForChild("DigRemoteEvent")
print("Exo Loaded x3")
V.fails = 0
function V.safeRequire(G)
    local y, Z = pcall(require, G)
    if not y or Z == nil then
        warn("[SafeRequire] Failed to load:", G)
        V.fails = V.fails + 1
        return nil
    end
    return Z
end

V.TradeWorldController = V.safeRequire(V.Modules.TradeControllers.TradeWorldController)
V.DataService = V.safeRequire(V.ReplicatedStorage.Modules.DataService)
V.SeedData = V.safeRequire(V.ReplicatedStorage.Data.SeedData)
V.PetUtilities = V.safeRequire(V.ReplicatedStorage.Modules.PetServices.PetUtilities)
V.PlantTraitsData = V.safeRequire(V.ReplicatedStorage.Modules.PlantTraitsData)
V.CraftingData_CraftingRecipeRegistry = V.safeRequire(V.ReplicatedStorage.Data.CraftingData.CraftingRecipeRegistry)
V.FoodRecipeData = V.safeRequire(V.ReplicatedStorage.Data.FoodRecipeData)
V.GearData = V.safeRequire(V.ReplicatedStorage.Data.GearData)
V.EventShopData = V.safeRequire(V.ReplicatedStorage.Data.EventShopData)
V.PetList = V.safeRequire(V.ReplicatedStorage.Data.PetRegistry.PetList)
V.PetRegistry = V.safeRequire(V.ReplicatedStorage.Data.PetRegistry)
print("Loading x4")
V.PetMutationRegistry = V.safeRequire(V.ReplicatedStorage.Data.PetRegistry.PetMutationRegistry)
V.TravelingMerchantData = V.safeRequire(V.ReplicatedStorage.Data.TravelingMerchant.TravelingMerchantData)
V.ReplicationReceiver = V.safeRequire(V.ReplicatedStorage.Modules.ReplicationReciever)
V.SeedPackData = V.safeRequire(V.ReplicatedStorage.Data.SeedPackData)
V.VariantsEnums = V.safeRequire(V.ReplicatedStorage.Data.EnumRegistry.VariantsEnums)
V.Calculate_Weight = V.safeRequire(V.ReplicatedStorage.Calculate_Weight)
print("Loading x5")
V.FindItemImage = V.safeRequire(V.ReplicatedStorage.Modules.ItemImageFinder)
function Addcantsleep() if (getconnections or get_signal_cons) then for G, V in pairs(((getconnections or get_signal_cons))(V.LocalPlayer.Idled)) do if V.Disable then
                V.Disable(V) elseif V.Disconnect then V.Disconnect(V) end end end end

pcall(function() Addcantsleep() end)
V.ReplicatedStorageSharedFolder = V.ReplicatedStorage:WaitForChild("Shared")
V.WEBHOOK_URL = ""
V.PROXY_URL = "https://exotichub.app/p"
V.invite_link_url = "https://exotichub.app/join"
V.invite_link_short = "exotichub.app/join"
local y = _libload or (loadstring(game:HttpGet("https://raw.githubusercontent.com/Reversed1337/Testing-123/refs/heads/main/zetahub_uilib", true)))()
if not y then
    print("Ui Lib failed to load. Stopping")
    return
end
V.AppName = "Exotic Hub"
V.CurentV = "v44"
local Z = {}
Z.dev_tools = true
Z.is_pro = true -- [PREMIUM BYPASS] Forced True
Z.webhook_category = { tradesold = "tradesold" }
Z.allowpro = { HexaFlame99 = true, topguy713 = true, tinybloxi33 = true, rizzyt9 = true, goforit887 = true, MrRizzy90 = true }
if Z.allowpro[V.LocalPlayer.Name] then end
Z.TEXT_LISTING = ""
Z.TEXT_LISTING_REMOVE = ""
Z.TEXT_HATCH_SYSTEM = ""
Z.TEXT_AGEBREAK = ""
Z.TEXT_CRAFT_TEAMS = ""
Z.TEXT_TEAM_SYSTEM = ""
Z.event_seeding_active = false
Z.event_seeding_list = {}
Z.alt_Plants_Physical = nil
Z.RNG_EGG_OVERRIDE = 0
Z.WAS_PRO_END = false
Z.is_dc = false
Z.sales_made = 0
V.LocalPlayer.CameraMaxZoomDistance = 350
Z.GetCheckIfPro = function() return true end -- [PREMIUM BYPASS] Always return true
if V.fails > 0 then warn("[EXO] --<> Important data not loaded. Please rejoin!") end
Z.Notify = function(G, V)
    if not G or not y then return end
    local Z = V or 2.5
    y:Notify(G, Z)
end
Z.user_country = ""
Z.Region = { FetchCurrentRegion = function() task.spawn(function()
        local G = ""
        local y, j = pcall(function() return V.LocalizationService:GetCountryRegionForPlayerAsync(V.LocalPlayer) end)
        if y and (j and j ~= "") then
            G = tostring(j)
            Z.user_country = G
        end
    end) end }
Z.Region.FetchCurrentRegion()
Z.is_pro = true -- [PREMIUM BYPASS] Overridden original validation
local j = { dd_list_pets = nil }
local i = {}
local c = {}
local J = {}
local T = {}
local d = {}
local u = {}
local q = {}
local g = {}
local E = {}
local a = {}
Z.show_expire_key = false
Z.expire_key_text = ""
Z.InventoryDataBind = {}
J.PetDataLocal = {}
J.ShowFailNotification = function(G, y)
    y = y or 4
    local Z = Instance.new("ScreenGui")
    Z.Name = "ModuleFailNotify"
    Z.IgnoreGuiInset = true
    Z.ResetOnSpawn = false
    Z.Parent = V.PlayerGui
    local j = Instance.new("Frame")
    j.Name = "NotifyFrame"
    j.Parent = Z
    j.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    j.BorderSizePixel = 0
    j.Size = UDim2.new(0, 380, 0, 50)
    j.Position = UDim2.new(.5, 0, 0, -60)
    j.AnchorPoint = Vector2.new(.5, 0)
    local i = Instance.new("UICorner", j)
    i.CornerRadius = UDim.new(0, 8)
    local c = Instance.new("UIStroke", j)
    c.Color = Color3.fromRGB(70, 70, 70)
    c.Thickness = 1.5
    local J = Instance.new("TextLabel", j)
    J.BackgroundTransparency = 1
    J.Size = UDim2.new(1, 0, 1, 0)
    J.Text = G
    J.TextColor3 = Color3.fromRGB(255, 255, 255)
    J.TextSize = 16
    J.Font = Enum.Font.GothamSemibold
    J.TextXAlignment = Enum.TextXAlignment.Center
    J.TextYAlignment = Enum.TextYAlignment.Center
    j:TweenPosition(UDim2.new(.5, 0, 0, 25), "Out", "Quad", .4, true)
    task.wait(y)
    j:TweenPosition(UDim2.new(.5, 0, 0, -60), "In", "Quad", .4, true)
    task.wait(.45)
    Z:Destroy()
end
J.GetFooterInfo = function(G)
    local y = string.format("%s (%s)", V.invite_link_short, V.CurentV)
    if not G then y = string.format("<b><font color=\'#FFFB03\'>%s</font></b> (%s)", V.invite_link_short, V.CurentV) end
    return y
end
Z.GetProMessage = function()
    local G = string.format(
    "\240\159\148\146 <stroke th=\'0.1\' joins=\'round\' sizing=\'fixed\' color=\'#8C1600\'><font color=\'#FA2B00\'> Premium Feature - Join discord server to get Key.</font></stroke>")
    return G
end
Z.PET_COUNT = {}
Z.all_pets_data_list = {}
Z.all_pets_names_list = {}
Z.all_pets_names_list_keyval = {}
Z.craft_data_GearEventWorkbench = {}
Z.egg_hatch_time_left = 0
Z.TEXT_SCANNER = ""
Z.BigData = {}
Z.RequireDataSync_Save = false
local H = { lbl_status_listing = nil, lbl_finder_pet_details, lbl_pet_details = nil }
Z.player_userid = V.LocalPlayer.UserId
if not Z.player_userid then
    warn("Invalid player detected.")
    return
end
local r = { finder = { find_petlist = {}, find_weight = 1, find_mutation = {}, find_enabled = false, find_tp = false, find_tp_every_mins = 10 }, showcase = { fruit_list = {}, pet_list = {} }, sameserver_buyonly = false, show_player_stats = true, scantargetpets = {}, manual_min_weight = .1, manual_showbaseweight = true, fixkgbug_easter = false, find_settings = {}, auto_list_enabled = false, listing_petlist = {}, listing_mutations = {}, listing_min_level = 1, listing_max_level = 1, listing_min_weight = .9, listing_max_weight = 2.86, listing_token_price = 99, listing_auto_unfav = false, skin_booth_list = {}, auto_claim_booth = false, auto_equip_big_pet = false, teleport_to_booth = false, teleport_distance = 30, joinnewserver = false, rejoin_mins = 15, sold_webhook =
"", enable_auto_reconnect = false, autoreconnect_tries = 0, was_auto_reconnect = false, auto_promote_listing = false, removelistingpetsfilter = {}, sellfruit = { fruit_list_allow = {}, is_fruit_enabled = false, fruit_price = 30, fruit_min_weight = .03, fruit_max_weight = 67.67, fruit_mutations = {}, fruit_auto_fav = false } }
local Y = "exotichub99"
if not isfolder(Y) then makefolder(Y) end
local e = Y .. ("/" .. (Z.player_userid .. "gagtrading1.json"))
local s = Y .. ("/" .. (Z.player_userid .. "file1.json"))
Z.isagebreak_autorejoin_main = false
Z.AgeBreakMainSettingsReadOnly = nil
Z.LoadMainGameAgeBreakSettingsReadOnly = function()
    Z.isagebreak_autorejoin_main = false
    Z.AgeBreakMainSettingsReadOnly = nil
    if not s then return false end
    if not isfile(s) then return false end
    local G, y = pcall(function() return readfile(s) end)
    if not G or not y or y == "" then return false end
    local j, i = pcall(function() return V.HttpService:JSONDecode(y) end)
    if not j or type(i) ~= "table" then return false end
    local c = i.agebreak
    if type(c) ~= "table" then return false end
    Z.AgeBreakMainSettingsReadOnly = { is_active_agebreak = c.is_active_agebreak == true, target_team = type(c
    .target_team) == "table" and c.target_team or {}, dup_team = type(c.dup_team) == "table" and c.dup_team or {}, claim_team =
    type(c.claim_team) == "table" and c.claim_team or {}, submit_team = type(c.submit_team) == "table" and c.submit_team or
    {}, idle_team = type(c.idle_team) == "table" and c.idle_team or {}, max_level = tonumber(c.max_level) or 125, use_filters =
    c.use_filters == true, avoid_age_filter = c.avoid_age_filter == true, avoid_weight_filter = c.avoid_weight_filter ==
    true, auto_skip_tokens = c.auto_skip_tokens == true, autorejoinagebreak = c.autorejoinagebreak == true }
    Z.isagebreak_autorejoin_main = Z.AgeBreakMainSettingsReadOnly.autorejoinagebreak == true
    return true, Z.AgeBreakMainSettingsReadOnly
end
Z.LoadMainGameAgeBreakSettingsReadOnly()
local N = function()
    local G, y = pcall(function() return V.HttpService:JSONEncode(r) end)
    if G then writefile(e, y) else end
end
local function W(G)
    if G then
        N()
        return
    end
    Z.RequireDataSync_Save = true
end
local function X()
    if not isfile(e) then return end
    local G = readfile(e)
    if not G or G == "" then return end
    local y, Z = pcall(V.HttpService.JSONDecode, V.HttpService, G)
    if not y then return end
    local function j(G, V)
        for V, y in pairs(V) do
            local Z = G[V]
            if type(y) == "table" and type(Z) == "table" then j(Z, y) else G[V] = y end
        end
        return G
    end
    j(r, Z)
end
X()
if J.task_data_sync1 then
    pcall(function() task.cancel(J.task_data_sync1) end)
    J.task_data_sync1 = nil
end
J.task_data_sync1 = task.spawn(function() while true do
        task.wait(1.5)
        if Z.RequireDataSync_Save then
            Z.RequireDataSync_Save = false
            N()
        end
    end end)
J.JsonPrint = function(G) if V.HttpService then warn(V.HttpService:JSONEncode(G)) end end
J.log = function(G) if G then print(G) else warn("(log) error passed val nil") end end
J.shortenMutation = function(G)
    if not G or G == "" then return "" end
    local V = G:gsub("[%[%]]", "")
    local y = (V:sub(1, 2)):upper()
    return "[" .. (y .. "]")
end
J.CopyToClipBoard = function(G) if setclipboard then
        setclipboard(G); (game:GetService("StarterGui")):SetCore("SendNotification",
            { Title = "Text", Text = " Copied to clipboard!", Duration = 2 })
    else Z.Notify("\226\157\140 Clipboard copy not supported", 3) end end
J.fruitCalculateWeight = function(G, y)
    local Z, j = pcall(function()
        local Z = V.Calculate_Weight.Calculate_Weight(G, y)
        if Z then return Z end
    end)
    if not Z then
        warn("Error Weight: ", j)
        return 0
    end
    return j or 0
end
Z.ItemTypes = { Pet = "Pet", Egg = "Egg", Fruit = "Fruit", Seed = "Seed", Gear = "Gear", Fence = "Fence", Fences =
"Fences", RandomSeed = "Holdable", SeedPack = "Seed Pack", PetEgg = "PetEgg", CosmeticCrate =
"CosmeticCrate", Crate = "Crate", Cosmetic = "Cosmetic", Currency = "Currency", Food = "Food", TradeBoothSkin =
"TradeBoothSkin" }
Z.AssetCache = {}
Z.EggsNoIcons = { ["Premium Night Egg"] = 75473533691044, ["Night Egg"] = 110540585737631 }
Z.GetAssetId = function(G, y)
    if not G or not y then return 0, false end
    local j = y .. (":" .. G)
    local i = Z.AssetCache[j]
    if i then return i, true end
    local c = Z.EggsNoIcons[G]
    if c then return c, true end
    local J, T = pcall(function() return V.FindItemImage(G, y) end)
    if not J or not T then
        Z.AssetCache[j] = 0
        return 0, false
    end
    local d = tonumber(string.match(T, "%d+")) or 0
    local u = false
    if d == 6937742258 then
        d = 0
        u = true
    end
    Z.AssetCache[j] = d
    return d, true, u
end
local function h(G)
    local V = tonumber(G)
    if not V or V < 0 then return 0 end
    return math.floor(V)
end
E.time = {}
E.time = { GetMinsFromSecs = function(G) return h(G) / 60 end, GetSecsFromMin = function(G) return h(G) * 60 end, GetSecsFromHours = function(
    G) return h(G) * 3600 end, GetHoursFromSecs = function(G) return h(G) / 3600 end, FormatMS = function(G)
    local V = h(G)
    return string.format("%02d:%02d", math.floor(V / 60), V % 60)
end, FormatHMS = function(G)
    local V = h(G)
    local y = math.floor(V / 3600)
    local Z = math.floor(((V % 3600)) / 60)
    local j = V % 60
    return string.format("%02d:%02d:%02d", y, Z, j)
end, FormatSmart = function(G)
    local V = h(G)
    if V >= 3600 then
        local G = math.floor(V / 3600)
        local y = math.floor(((V % 3600)) / 60)
        local Z = V % 60
        return string.format("%02d:%02d:%02d", G, y, Z)
    else return string.format("%02d:%02d", math.floor(V / 60), V % 60) end
end, FormatText = function(G)
    local V = h(G)
    if V < 60 then return tostring(V) .. "s" elseif V < 3600 then return string.format("%dm %ds", math.floor(V / 60),
            V % 60) else return string.format("%dh %dm", math.floor(V / 3600), math.floor(((V % 3600)) / 60)) end
end }
J.FormatWeight = function(G, V)
    local y = tonumber(G) or 0
    V = V or 2
    if y ~= y then return 0 end
    if y == math.huge then return y end
    if y == -math.huge then return y end
    local Z = 10 ^ V
    return math.floor(y * Z + .5) / Z
end
J.FormatHugeNumbers = function(G, V)
    G = tonumber(G)
    V = tonumber(V) or 2
    if not G or G ~= G or G == math.huge or G == -math.huge then return "0" end
    local y = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Ud", "Dd", "Td", "Qad", "Qid", "Sxd",
        "Spd", "Ocd", "Nod" }
    local Z = math.abs(G)
    if Z < 1000 then
        if G % 1 == 0 then return tostring(math.floor(G)) end
        return (string.format("%." .. (V .. "f"), G)):gsub("%.?0+$", "")
    end
    local j = math.floor(math.log(Z, 1000)) + 1
    if j > #y then return string.format("%." .. (V .. "e"), G) end
    local i = 1000 ^ ((j - 1))
    local c = G / i
    local J = tonumber(string.format("%." .. (V .. "f"), c))
    if J and (math.abs(J) >= 1000 and j < #y) then
        j = j + 1
        i = 1000 ^ ((j - 1))
        c = G / i
    end
    local T = string.format("%." .. (V .. "f"), c)
    T = T:gsub("%.?0+$", "")
    return T .. y[j]
end
J.FormatNumber = function(G)
    local V = tonumber(G) or 0
    if V == math.huge then return "Infinity" end
    if V == -math.huge then return "-Infinity" end
    if V ~= V then return "NaN" end
    local y = string.format("%.0f", math.floor(V))
    local Z, j = y:match("^([%-]?)(%d+)$")
    if not j then return y end
    local i = ((j:reverse()):gsub("(%d%d%d)", "%1,")):reverse()
    return Z .. i:gsub("^,", "")
end
J.Vector3ToCFrame = function(G)
    if not G then return nil end
    return CFrame.new(G)
end
J.StringToVector3 = function(G)
    if not G then return nil end
    local V, y, Z = G:match("([^,]+),([^,]+),([^,]+)")
    if not V or not y or not Z then return nil end
    return Vector3.new(tonumber(V), tonumber(y), tonumber(Z))
end
J.IsTimeUp = function(G, V)
    if not G or not V then return true end
    return (os.clock() - G) >= V
end
J.SendChat = function(G) pcall(function() V.channel:SendAsync(G) end) end
J.MakeMessageForPromote = function(G, V)
    local y = { "selling {ITEM}", "selling {ITEM} cheap", "{ITEM} for sale", "got {ITEM} in booth", "buy {ITEM} rn",
        "{ITEM} listed", "selling {ITEM} for tokens", "selling {ITEM} under RAP", "{ITEM} listed under market price",
        "cheapest {ITEM} in server", "selling {ITEM} low price", "{ITEM} way under rap rn", "lowest price on {ITEM}",
        "undercutting everyone on {ITEM}", "selling {ITEM} need tokens asap", "quick selling {ITEM}",
        "flash sale on {ITEM}", "{ITEM} cheap, need gone", "who wants {ITEM}? need tokens", "clearing out {ITEM}, cheap",
        "{ITEM} fs", "huge {ITEM} fs", "selling {ITEM} fr cheap", "got a {ITEM} up", "{ITEM} for sale no overpay",
        "selling {ITEM} cheap no cap", "taking offers on {ITEM} in booth", "selling {ITEM} atm", "anyone need {ITEM}?",
        "who looking for {ITEM}?", "anyone buying {ITEM} rn?", "u guys need {ITEM}?", "looking for {ITEM}? check booth",
        "who wants a cheap {ITEM}?", "best price on {ITEM} here", "grab this {ITEM} b4 its gone", "fresh {ITEM} listed",
        "selling {ITEM} (good price)", "huge {ITEM} for cheap", "don\'t miss this {ITEM}", "selling {ITEM} (clean)" }
    local Z = { "\240\159\148\165", "\240\159\146\142", "\240\159\146\184", "\240\159\164\145", "\226\154\161",
        "\240\159\145\128", "\226\156\168", "\226\128\188\239\184\143" }
    local j = {}
    if G then for G, V in pairs(G) do table.insert(j, G) end end
    if V then for G, V in pairs(V) do table.insert(j, G) end end
    if #j == 0 then return "selling stuff check booth" end
    local i = math.random(1, #j)
    local c = j[i]
    local J = math.random(1, #y)
    local T = y[J]
    local d = string.gsub(T, "{ITEM}", c)
    if math.random(1, 100) <= 30 then
        local G = Z[math.random(1, #Z)]
        d = d .. (" " .. G)
    end
    return d
end
Z.failed_tp = false
Z.DetectTeleport = function()
    local G = game:GetService("TeleportService")
    G.TeleportInitFailed:Connect(function(G, y, j)
        if G ~= V.LocalPlayer then return end
        print("--TeleportInitFailed")
        Z.failed_tp = true
    end)
end
Z.DetectTeleport()
J.Color3ToHex = function(G)
    if typeof(G) ~= "Color3" then G = Color3.fromRGB(255, 255, 0) end
    return string.format("#%02X%02X%02X", math.clamp(math.floor(G.R * 255), 0, 255),
        math.clamp(math.floor(G.G * 255), 0, 255), math.clamp(math.floor(G.B * 255), 0, 255))
end
J.StringToColor3 = function(G)
    local V = "#FFFF00"
    if type(G) ~= "string" or G == "" then return V end
    local y, Z = pcall(function()
        local V = 0
        for y = 1, #G, 1 do V = ((V * 31 + string.byte(G, y))) % 2147483647 end
        local y = ((V % 360)) / 360
        local Z = .75 + (((math.floor(V / 360) % 20)) / 100)
        local j = .85 + (((math.floor(V / 7200) % 12)) / 100)
        return J.Color3ToHex(Color3.fromHSV(y, Z, j))
    end)
    return y and Z or V
end
J.EggToColor = function(G)
    G = tostring(G or "")
    local V = J.EggColors and J.EggColors[G]
    if typeof(V) ~= "Color3" then V = Color3.fromRGB(255, 255, 255) end
    local function y(G) return string.format("#%02X%02X%02X", math.clamp(math.floor(G.R * 255), 0, 255),
            math.clamp(math.floor(G.G * 255), 0, 255), math.clamp(math.floor(G.B * 255), 0, 255)) end
    local Z, j, i = V:ToHSV()
    local c
    local T
    if j < .08 then
        c = Color3.fromRGB(230, 230, 230)
        T = Color3.fromRGB(20, 20, 20)
    else
        c = Color3.fromHSV(Z, math.clamp(j, .55, .9), math.clamp(math.max(i, .82), 0, 1))
        T = Color3.fromHSV(Z, math.clamp(j, .7, 1), .18)
    end
    return y(c), y(T)
end
J.RarityLayoutMap = { Common = 1, Uncommon = 2, Rare = 3, Legendary = 4, Mythical = 5, Divine = 6, Prismatic = 7, Transcendent = 8 }
J.RarityToColor = function(G)
    G = tostring(G or "")
    local V = { Common = { Text = "#E6E6E6", Stroke = "#111111" }, Uncommon = { Text = "#8CFF3D", Stroke = "#183300" }, Rare = { Text = "#4FA3FF", Stroke = "#001B4D" }, Legendary = { Text = "#FFF45A", Stroke = "#4A3A00" }, Mythical = { Text = "#D86BFF", Stroke = "#3A004D" }, Divine = { Text = "#FF8A3D", Stroke = "#4A1600" }, Prismatic = { Text = "#FF4D4D", Stroke = "#4A0000" }, Transcendent = { Text = "#8D6BFF", Stroke = "#16004A" }, Epic = { Text = "#C98CFF", Stroke = "#2B004A" } }
    local y = V[G]
    if not y then return "#FFFFFF", "#111111" end
    return y.Text, y.Stroke
end
T.GetAllPetData = function() for G, V in pairs(V.PetList) do
        table.insert(Z.all_pets_names_list, G)
        Z.all_pets_names_list_keyval[G] = true
        Z.all_pets_data_list[G] = { hunger = tonumber(V.DefaultHunger), rarity = V.Rarity or "" }
    end end
T.GetAllPetData()
T.GetPetDataUsingName = function(G)
    if not G then return nil end
    return Z.all_pets_data_list[G]
end
J.EggDataSet = {}
J.EggRarity = {}
J.EggColors = {}
J.GetEggRarityList = function()
    local G = { Prismatic = 8, Divine = 7, Mythical = 6, Legendary = 5, Rare = 4, Uncommon = 3, Common = 2, Unknown = 1 }
    return G
end
J.FetchEggData = function()
    J.EggDataSet = {}
    local G = J.GetEggRarityList()
    for G, V in pairs(V.PetRegistry.PetEggs) do
        local y = {}
        J.EggRarity[G] = V.EggRarity
        J.EggColors[G] = V.Color or Color3.fromRGB(255, 255, 255)
        if V.RarityData and V.RarityData.Items then for G, V in pairs(V.RarityData.Items) do table.insert(y,
                    { petname = G, odds = V.ItemOdd or 0 }) end end
        table.sort(y, function(G, V) return G.odds < V.odds end)
        table.insert(J.EggDataSet,
            { name = G, rarity = V.EggRarity or "Unknown", pets = y, color = V.Color or Color3.fromRGB(255, 255, 255) })
    end
    table.sort(J.EggDataSet,
        function(V, y)
            local Z = string.find(V.name, "Premium")
            local j = string.find(y.name, "Premium")
            if Z and not j then return true end
            if not Z and j then return false end
            local i = G[V.rarity] or 0
            local c = G[y.rarity] or 0
            if i ~= c then return i > c end
            return V.name < y.name
        end)
end
J.FetchEggData()
J.AllPetPassiveData = {}
J.PetDataAll = {}
J.GetAllPetDataPassives = function() for G, V in pairs(V.PetList) do
        local y = V.Passives or {}
        J.AllPetPassiveData[G] = y
        J.PetDataAll[G] = V
    end end
J.GetAllPetDataPassives()
J.GetPetPassivesTable = function(G) return J.AllPetPassiveData[G] end
J.GetPetDataInfo = function(G) return J.PetDataAll[G] end
J.PetToEggNames = {}
J.FakeEgg = {}
J.EggNameToPet = {}
J.AllEggNamesList = {}
J.PetDataAndInfo = {}
J.GetAllEggNames = function() for G, V in pairs(V.PetRegistry.PetEggs) do
        table.insert(J.AllEggNamesList, G)
        local y = V.RarityData
        local Z = V.EggRarity
        if y then
            local V = y.Items
            if G == "Fake Egg" then
                if V then for V, y in pairs(V) do
                        local Z = T.GetPetDataUsingName(V)
                        local j = Z and Z.rarity or ""
                        local i = { rarity = j, eggname = G }
                        J.PetDataAndInfo[V] = i
                        J.FakeEgg[V] = G
                    end end
                continue
            end
            if V then
                local y = {}
                for V, Z in pairs(V) do
                    J.PetToEggNames[V] = G
                    local j = T.GetPetDataUsingName(V)
                    local i = j and j.rarity or ""
                    local c = { rarity = i, eggname = G }
                    J.PetDataAndInfo[V] = c
                    local d = Z.ItemOdd or 0
                    local u = J.GetPetDataInfo(V)
                    local q = ""
                    if u then q = u.Icon end
                    local g = { petname = V, odds = d, icon = q }
                    table.insert(y, g)
                end
                J.EggNameToPet[G] = y
            end
        end
    end end
J.GetAllEggNames()
J.GetPetDetails = function(G) return J.PetDataAndInfo[G] end
J.GetEggNameUsingPetName = function(G)
    if J.PetToEggNames[G] then return J.PetToEggNames[G] end
    if J.FakeEgg[G] then return J.FakeEgg[G] end
    return "Unknown"
end
J.formatDuration = function(G)
    if not G then return 0 end
    local V = 86400
    local y = 3600
    local Z = 60
    G = tonumber(G) or 0
    local j = math.floor(G / V)
    local i = G % V
    local c = math.floor(i / y)
    i = i % y
    local J = math.floor(i / Z)
    local T = math.floor(i % Z)
    if j > 0 then return string.format("%dd:%dh:%dm:%ds", j, c, J, T) elseif c > 0 then return string.format(
        "%dh:%dm:%ds", c, J, T) elseif J > 0 then return string.format("%dm:%ds", J, T) else return string.format("%ds",
            T) end
end
Z.PlayerSecrets = { EggRecoveryChance = 0, PetSellEggRefundChance = 0, PetEggHatchAgeBonus = 0, PetEggHatchSizeBonus = 0, PetPassiveBonus = 0, SessionTime = 0, SellSilverFruitRewardChance = 0, Grow_Amount = 0 }
local l = {}
Z.all_seed_pack_names = {}
d.GetSessionTime = function()
    local G = "SessionTime"
    local y = tonumber(V.LocalPlayer:GetAttribute(G)) or 0
    return y
end
q.GetAllSeedPackNames = function()
    local G = {}
    for V, y in pairs(V.SeedPackData.Packs) do if y.DisplayName then table.insert(G, y.DisplayName) end end
    return G
end
Z.all_seed_pack_names = q.GetAllSeedPackNames()
J.CloneArray = function(G)
    local V = {}
    for G, y in ipairs(G) do V[G] = y end
    return V
end
Z.SeedRarity = {}
local function B()
    local G = {}
    for V, y in pairs(V.SeedData) do if y.SeedName then
            local j = y.SeedName
            local i = y.SeedRarity
            if V == "Easter Chocolate Coconut" and j == "Chocolate Coconut" then j = V end
            j = j:gsub("%s+Seed$", "")
            Z.SeedRarity[j] = i
            table.insert(G, j)
        end end
    for G, V in ipairs(G) do l[V] = false end
end
B()
local function L(G)
    local V = {}
    for G, y in pairs(G) do table.insert(V, G) end
    table.sort(V, function(G, V) return G:lower() < V:lower() end)
    return V
end
local function m(G)
    local y = V.LocalPlayer
    local function Z(V)
        local y = V:FindFirstChild("HumanoidRootPart")
        if y then y.CFrame = G end
    end
    if y.Character then Z(y.Character) end
    y.CharacterAdded:Connect(function(G)
        G:WaitForChild("HumanoidRootPart")
        Z(G)
    end)
end
local function K(G, y)
    if not V.PetUtilities then return G end
    local Z = V.PetUtilities:CalculateWeight(G or 1, y or 1)
    return Z
end
J.UpdatePlayerStats = function()
    if not V.LocalPlayer then
        warn("UpdatePlayerStats called without a valid LocalPlayer")
        return
    end
    for G, y in pairs(Z.PlayerSecrets) do
        local j = V.LocalPlayer:GetAttribute(G)
        if j ~= nil then Z.PlayerSecrets[G] = j else Z.PlayerSecrets[G] = 0 end
    end
end
J.ShopTeleportButtons = function()
    local G = V.LocalPlayer.PlayerGui.Teleport_UI.Frame
    if not G then return end
    for G, V in ipairs(G:GetChildren()) do if V:IsA("GuiButton") then V.Visible = true end end
end
J.ShopTeleportButtons()
local b = {}
local function S(G)
    local V = {}
    for G, y in pairs(G) do table.insert(V, G) end
    return V
end
Z.GetAllPlantsWithCategory = function() Z.PlantsCategoryData = V.PlantTraitsData.Traits end
Z.GetAllPlantsWithCategory()
Z.GetAllMutations = function()
    local G = require(game.ReplicatedStorage.Modules.MutationHandler)
    local V = G.GetMutations()
    for G, V in pairs(V) do b[G] = false end
end
Z.GetAllMutations()
local function z(G)
    if G == nil or (type(G) == "string" and G:match("^%s*$")) then return nil end
    local V = tonumber(G)
    if not V then return nil end
    if V % 1 ~= 0 then return nil end
    return V
end
local function f(G)
    if G == nil or (type(G) == "string" and G:match("^%s*$")) then return nil end
    local V = tonumber(G)
    if not V then return nil end
    return V
end
J.ShortName = function(G, V)
    V = V or 5
    if #G > V then return G:sub(1, V) .. "..." else return G end
end
Z.hatched_pets = {}
J.GetPetDataUsingUUID = function(G, V)
    local y = V.Data[G]
    return y
end
J.cache_recent_pet_data = {}
local function t(G)
    local V, y = pcall(function()
        local V
        local y = g.GetBigDataUsingKey("PetsData")
        if y and y.PetInventory.Data[G] then V = y.PetInventory.Data[G] else end
        if not V then return nil end
        local Z = V.UUID
        local j = V.PetData
        local i = j.HatchedFrom
        local c = j.IsFavorite
        local J = j.Boosts
        local T = j.Name
        local d = j.LevelProgress
        local u = j.EggName
        local q = j.Level
        local E = j.Hunger
        local a = j.BaseWeight
        local H = V.PetType
        local r = V.PetAbility
        return V
    end)
    if V then return y end
    warn("Error", y)
    return nil
end
c.AllMutationsList = {}
c.AllMutationListEnum = {}
c.GetAllMutationAsKeyPair = function()
    for G, V in pairs(V.PetMutationRegistry.PetMutationRegistry) do
        if V.AvaliableFromMutationMachine then end
        c.AllMutationsList[G] = false
        local y = V.EnumId
        c.AllMutationListEnum[y] = G
    end
    return c.AllMutationsList
end
c.GetAllMutationAsKeyPair()
local function M(G) for G, y in ipairs(G) do V.FavItem:FireServer(y) end end
local function A(G)
    if not G then return end
    V.FavItem:FireServer(G)
end
J.FavItemCustom = function(G, y)
    if not G then return end
    local Z = G:GetAttribute("d")
    if Z and y then return end
    V.FavItem:FireServer(G)
end
local function x(G)
    local V = G:match("%d+")
    return tonumber(V) or 0
end
local function C()
    local G, y = pcall(function()
        local G = V.Character
        if not G or not G:IsA("Model") then return false end
        local y = G:FindFirstChildOfClass("Tool")
        if not y then return false end
        local Z = (y:GetAttribute("b") == "j")
        local j = y:GetAttribute("f")
        if Z and j then return true, j end
        return false
    end)
    if not G then
        warn("[IsFruitToolHeld] pcall error:", y)
        return false
    end
    return y
end
i.GetHeldTool = function()
    local G = V.Character
    if not G or not G:IsA("Model") then return nil end
    local y = G:FindFirstChildOfClass("Tool")
    if not y then return nil end
    return y
end
i.IsToolHeldAny = function()
    local G, y = pcall(function()
        local G = V and V.Character
        if not G or not G:IsA("Model") then return false end
        return G:FindFirstChildOfClass("Tool") ~= nil
    end)
    if not G then
        warn("[IsToolHeldAny] Error:", y)
        return false
    end
    return y
end
i.IsPetFav = function(G)
    local V, y = pcall(function() if G:IsA("Tool") and G:GetAttribute("PetType") then
            local V = G:GetAttribute("d")
            if V then return true end
        end end)
    if V then return y else return false end
end
local function D(G)
    local y, Z = pcall(function()
        if not G or typeof(G) ~= "Instance" then
            warn("[IsToolHeld] Invalid tool passed:", G)
            return false
        end
        local y = V.Character
        if not y or not y:IsA("Model") then return false end
        local Z = G.Name
        if not Z or type(Z) ~= "string" then return false end
        for V, y in ipairs(y:GetChildren()) do if y:IsA("Tool") then
                if y == G then return true end
                if string.find(y.Name, Z, 1, true) then return true end
            end end
        return false
    end)
    if not y then
        warn("[IsToolHeld] pcall error:", Z)
        return false
    end
    return Z
end
local function P(G)
    local y = V.Character:FindFirstChildOfClass("Humanoid")
    if not y then return false end
    local Z, j = pcall(function() y:EquipTool(G) end)
    if not Z then
        warn("\226\157\140 Failed to equip tool:", j)
        return false
    end
    task.wait(.2)
    return true
end
local function O()
    local G = V.Character:FindFirstChildOfClass("Humanoid")
    if not G then return end
    G:UnequipTools()
    task.wait(.1)
end
J.ContainsWords = function(G, V)
    local y = {}
    for G in string.gmatch(V, "%S+") do table.insert(y, G) end
    for V, y in ipairs(y) do if not string.find(G, y, 1, true) then return false end end
    return true
end
J.FormatTime = function(G)
    if not G or type(G) ~= "number" then return "0:00:00" end
    if G < 0 then G = 0 end
    G = math.floor(G + .5)
    local V = math.floor(G / 3600)
    local y = math.floor(((G % 3600)) / 60)
    local Z = G % 60
    return string.format("%d:%02d:%02d", V, y, Z)
end
J.UI = { updateHomeStats = function(G) if H.lbl_home_info then H.lbl_home_info:SetText(G) end end }
J.fmt_time = function(G)
    local V = math.floor(G / 60)
    local y = math.floor(G % 60)
    return string.format("%02d:%02d", V, y)
end
J.UserDevice = { IsMobile = function() return V.UserInputService.TouchEnabled end, IsPC = function() return V
    .UserInputService.KeyboardEnabled and (V.UserInputService.MouseEnabled and not V.UserInputService.TouchEnabled) end, IsConsole = function() return
    V.UserInputService.GamepadEnabled and not V.UserInputService.KeyboardEnabled end, Get = function()
    if V.UserInputService.TouchEnabled then return "Mobile" end
    if V.UserInputService.GamepadEnabled and not V.UserInputService.KeyboardEnabled then return "Console" end
    return "PC"
end, Raw = function() return { Touch = V.UserInputService.TouchEnabled, Keyboard = V.UserInputService.KeyboardEnabled, Mouse =
    V.UserInputService.MouseEnabled, Gamepad = V.UserInputService.GamepadEnabled } end }
i.IsFruitAndNotFav = function(G)
    local V, y = pcall(function() return G and (G:IsA("Tool") and (G:GetAttribute("b") == "j" and not G:GetAttribute("d"))) end)
    return V and y
end
i.IsFruit = function(G)
    local V, y = pcall(function() return G and (G:IsA("Tool") and G:GetAttribute("b") == "j") end)
    return V and y
end
i.IsFavFruit = function(G)
    local V = G:GetAttribute("d")
    if V then return true end
    return false
end
i.GetFruitCount = function()
    local G = 0
    for V, y in ipairs(V.Backpack:GetChildren()) do if i.IsFruit(y) then G = G + 1 end end
    local y = V.Character:FindFirstChildOfClass("Tool")
    if y then if i.IsFruit(fruit) then G = G + 1 end end
    return G
end
i.GetIsFavPetUsingUUID = function(G)
    local y, Z = pcall(function()
        for V, y in ipairs(V.Backpack:GetChildren()) do if y:IsA("Tool") and y:GetAttribute("PetType") then
                local V = y:GetAttribute("PET_UUID")
                if V and V == G then
                    local G = y:GetAttribute("d")
                    if G then return true end
                end
            end end
        if V.Character then
            local y = V.Character:FindFirstChildOfClass("Tool")
            if y and (y:IsA("Tool") and y:GetAttribute("PetType")) then
                local V = y:GetAttribute("PET_UUID")
                if V and V == G then
                    local G = y:GetAttribute("d")
                    if G then return true end
                end
            end
        end
        return false
    end)
    if y then return Z else return false end
end
i.GetPetBiggestPet = function(G)
    local y = nil
    local Z = -1
    local j = function(V) if V:IsA("Tool") and V:GetAttribute("PetType") then
            local j = V:GetAttribute("PET_UUID")
            if j then
                local i = t(j)
                if not i then return end
                local c = i.PetType or ""
                local J = i.PetData
                if G then if not G[c] then return end end
                local T = J.BaseWeight or 0
                if T > Z then
                    Z = T
                    y = V
                end
            end
        end end
    local i, c = pcall(function()
        for G, V in ipairs(V.Backpack:GetChildren()) do j(V) end
        if V.Character then
            local G = V.Character:FindFirstChildOfClass("Tool")
            if G then j(G) end
        end
        return y
    end)
    if i then return c else
        warn("Error in GetPetBiggestPet:", c)
        return nil
    end
end
i.BuildPetLookup = function()
    local G = {}
    local function y(V)
        if not V:IsA("Tool") then return end
        if not V:GetAttribute("PetType") then return end
        local y = V:GetAttribute("PET_UUID")
        if not y then return end
        local Z = t(y)
        if not Z then return end
        local j = Z.PetData
        if not j or j.IsFavorite then return end
        local i = Z.PetType
        if not i then return end
        G[i] = ((G[i] or 0)) + 1
    end
    for G, V in ipairs(V.Backpack:GetChildren()) do y(V) end
    if V.Character then
        local G = V.Character:FindFirstChildOfClass("Tool")
        if G then y(G) end
    end
    return G
end
i.GetPetUsingName = function(G)
    local y = function(V) if V:IsA("Tool") and V:GetAttribute("PetType") then
            local y = V:GetAttribute("PET_UUID")
            if y then
                local V = t(y)
                if not V then return nil end
                local Z = V.PetData
                local j = Z.IsFavorite
                if j then return nil end
                local i = Z.Level
                local c = Z.BaseWeight
                local J = V.PetType
                if J == G then return true end
            end
            return nil
        end end
    local Z, j = pcall(function()
        for G, V in ipairs(V.Backpack:GetChildren()) do if y(V) then return V end end
        if V.Character then
            local G = V.Character:FindFirstChildOfClass("Tool")
            if G then if y(G) then return G end end
        end
        return nil
    end)
    if Z then return j else
        warn("Error in GetPetUsingName:", j)
        return nil
    end
end
i.GetPetUsingUUID = function(G)
    local y, Z = pcall(function()
        for V, y in ipairs(V.Backpack:GetChildren()) do if y:IsA("Tool") and y:GetAttribute("PetType") then
                local V = y:GetAttribute("PET_UUID")
                if V and V == G then return y end
            end end
        if V.Character then
            local y = V.Character:FindFirstChildOfClass("Tool")
            if y and (y:IsA("Tool") and y:GetAttribute("PetType")) then
                local V = y:GetAttribute("PET_UUID")
                if V and V == G then return y end
            end
        end
        return nil
    end)
    if y then return Z else
        warn("Error in GetPetUsingUUID:", Z)
        return nil
    end
end
i.GetAllPetsUUIDS_Backpack = function()
    local G = {}
    for V, y in ipairs(V.Backpack:GetChildren()) do if y:IsA("Tool") and y:GetAttribute("PetType") then
            local V = y:GetAttribute("PET_UUID")
            local Z = y:GetAttribute("d")
            if V and not Z then table.insert(G, V) end
        end end
    if V.Character then
        local y = V.Character:FindFirstChildOfClass("Tool")
        if y and (y:IsA("Tool") and y:GetAttribute("PetType")) then
            local V = y:GetAttribute("PET_UUID")
            local Z = y:GetAttribute("d")
            if V and not Z then table.insert(G, V) end
        end
    end
    return G
end
i.GetAllPetsTools_Backpack = function()
    local G = {}
    for V, y in ipairs(V.Backpack:GetChildren()) do if y:IsA("Tool") and y:GetAttribute("PetType") then
            local V = y:GetAttribute("PET_UUID")
            local Z = y:GetAttribute("d")
            if V then table.insert(G, y) end
        end end
    if V.Character then
        local y = V.Character:FindFirstChildOfClass("Tool")
        if y and (y:IsA("Tool") and y:GetAttribute("PetType")) then
            local V = y:GetAttribute("PET_UUID")
            local Z = y:GetAttribute("d")
            if V then table.insert(G, item) end
        end
    end
    return G
end
i.GetAllFruitsInBackpack = function()
    local G = {}
    for V, y in ipairs(V.Backpack:GetChildren()) do
        if not i.IsFruit(y) then continue end
        table.insert(G, y)
    end
    local y = i.GetHeldTool()
    if i.IsFruit(y) then table.insert(G, y) end
    return G
end
Z.bg_runs = 1
task.spawn(function() while true do
        task.wait(10)
        if not r.fixkgbug_easter then continue end
        local G = i.GetAllFruitsInBackpack()
        for G, V in ipairs(G) do if V then
                P(V)
                task.wait()
            end end
        O()
        Z.bg_runs = Z.bg_runs + 1
        if Z.bg_runs >= 2 then break end
    end end)
i.GetFruitUsingNameList = function(G)
    local y = i.GetHeldTool()
    if y then if i.IsFruit(y) then
            local V = y:GetAttribute("f") or "-"
            if G[V] then return y end
        end end
    for V, y in ipairs(V.Backpack:GetChildren()) do
        if not i.IsFruit(y) then continue end
        local Z = y:GetAttribute("f") or "-"
        if G[Z] then return y end
    end
    return nil
end
i.GetRandomFruit = function()
    local G = i.GetHeldTool()
    if G then if i.IsFruit(G) then return G end end
    for G, V in ipairs(V.Backpack:GetChildren()) do if i.IsFruit(V) then return V end end
    return nil
end
J.compactStatusContainer = nil
J.compactStatusLabel = nil
J.updateCompactStatus = function(G)
    local y = 20
    local Z = .35
    local j = 18
    local i = 14
    local c = 1000
    local T = j
    local d = workspace.CurrentCamera
    if d then if d.ViewportSize.X < c then T = i end end
    if not J.compactStatusContainer or not J.compactStatusContainer.Parent then
        local G = V.LocalPlayer
        if not G then return end
        local j = V.PlayerGui
        local i = j:FindFirstChild("CompactStatusGui")
        if not i then
            i = Instance.new("ScreenGui")
            i.Name = "CompactStatusGui"
            i.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            i.ResetOnSpawn = false
            i.Parent = j
            i.DisplayOrder = 0
        end
        J.compactStatusContainer = i:FindFirstChild("CompactStatusContainer")
        if not J.compactStatusContainer then
            J.compactStatusContainer = Instance.new("Frame")
            J.compactStatusContainer.Name = "CompactStatusContainer"
            J.compactStatusContainer.Parent = i
            J.compactStatusContainer.BackgroundTransparency = 1
            J.compactStatusContainer.AnchorPoint = Vector2.new(1, .5)
            J.compactStatusContainer.Position = UDim2.new(1, -y, .5, 0)
            J.compactStatusContainer.Size = UDim2.new(Z, 0, 0, 0)
            J.compactStatusContainer.AutomaticSize = Enum.AutomaticSize.Y
        end
        J.compactStatusLabel = J.compactStatusContainer:FindFirstChild("CompactStatusDisplay")
        if not J.compactStatusLabel then
            for G, V in ipairs(J.compactStatusContainer:GetChildren()) do if V:IsA("TextLabel") then V:Destroy() end end
            J.compactStatusLabel = Instance.new("TextLabel")
            J.compactStatusLabel.Name = "CompactStatusDisplay"
            J.compactStatusLabel.Parent = J.compactStatusContainer
            J.compactStatusLabel.Size = UDim2.new(1, 0, 1, 0)
            J.compactStatusLabel.AutomaticSize = Enum.AutomaticSize.Y
            J.compactStatusLabel.BackgroundTransparency = 1
            J.compactStatusLabel.RichText = true
            J.compactStatusLabel.Font = Enum.Font.SourceSansBold
            J.compactStatusLabel.TextColor3 = Color3.new(1, 1, 1)
            J.compactStatusLabel.TextSize = T
            J.compactStatusLabel.TextStrokeTransparency = .5
            J.compactStatusLabel.TextWrapped = true
            J.compactStatusLabel.ZIndex = 1
            J.compactStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
            J.compactStatusLabel.TextYAlignment = Enum.TextYAlignment.Top
        end
    elseif not J.compactStatusLabel or not J.compactStatusLabel.Parent then
        J.compactStatusLabel = J.compactStatusContainer:FindFirstChild("CompactStatusDisplay")
        if not J.compactStatusLabel then
            J.compactStatusContainer = nil
            return
        end
    end
    local u = table.concat(G, "\n")
    J.compactStatusLabel.Text = u
end
local F = nil
J.updateStatusList = function(G)
    local y = 18
    local Z = 14
    local j = 1000
    local i = y
    local c = workspace.CurrentCamera
    if c then if c.ViewportSize.X < j then i = Z end end
    if not F or not F.Parent then
        local G = V.LocalPlayer
        if not G then return end
        local y = V.PlayerGui
        local Z = y:FindFirstChild("StatusGui")
        if not Z then
            Z = Instance.new("ScreenGui")
            Z.Name = "StatusGui"
            Z.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Z.ResetOnSpawn = false
            Z.Parent = y
            Z.DisplayOrder = 3
        end
        F = Z:FindFirstChild("StatusDisplay")
        if not F then
            F = Instance.new("TextLabel")
            F.Name = "StatusDisplay"
            F.Parent = Z
            F.Size = UDim2.new(.3, 0, .4, 0)
            F.AnchorPoint = Vector2.new(0, .5)
            F.Position = UDim2.new(0, 120, .65, 0)
            F.BackgroundTransparency = 1
            F.RichText = true
            F.Font = Enum.Font.SourceSansBold
            F.TextColor3 = Color3.new(1, 1, 1)
            F.TextSize = i
            F.TextStrokeTransparency = .5
            F.TextXAlignment = Enum.TextXAlignment.Left
            F.TextYAlignment = Enum.TextYAlignment.Top
        end
    end
    local J = table.concat(G, "\n")
    F.Text = J
end
local v = { Common = 1, Uncommon = 2, Rare = 3, Legendary = 4, Mythical = 5, Divine = 6, Prismatic = 7, Transcendent = 8 }
local k = {}
local p = {}
q.Hop = { TeleportToJobId = function(G, y)
    local Z = game:GetService("Players")
    local j = V.TeleportService
    local i = Z.LocalPlayer
    G = tostring(G or "")
    y = tonumber(y) or game.PlaceId
    if G == "" then
        warn("[TeleportToJobId] Missing JobId")
        return false
    end
    if not y or y <= 0 then
        warn("[TeleportToJobId] Invalid PlaceId")
        return false
    end
    local c, J = pcall(function() j:TeleportToPlaceInstance(y, G, i) end)
    if not c then
        warn("[TeleportToJobId] Failed:", J)
        return false
    end
    return true
end, FindBestServer = function()
    local G = 55
    local y = 4
    local Z = game.PlaceId
    local j = nil
    local i = nil
    local c = -1
    local J = nil
    local T = -1
    for y = 1, y, 1 do
        local d = "https://games.roblox.com/v1/games/" .. (Z .. "/servers/Public?sortOrder=Desc&limit=100")
        if j then d = d .. ("&cursor=" .. j) end
        local u, q = pcall(function() return V.HttpService:JSONDecode(game:HttpGet(d)) end)
        if not u or not q or not q.data then
            warn("Fetch failed")
            break
        end
        for V, y in ipairs(q.data) do if y.id ~= game.JobId and y.maxPlayers > 0 then
                local V = y.playing or 0
                local Z = y.maxPlayers
                local j = ((V / Z)) * 100
                if V >= Z then continue end
                if j <= G then if j > c then
                        c = j
                        i = y
                    end end
                if j > T then
                    T = j
                    J = y
                end
            end end
        j = q.nextPageCursor
        if not j then break end
        task.wait(.2)
    end
    if i then
        print(string.format("BEST \226\137\164 %d%%: %s (%d/%d | %.1f%%)", G, i.id, i.playing, i.maxPlayers, c))
        return i.id, i
    end
    if J then
        print(string.format("FALLBACK (closest non-full): %s (%d/%d | %.1f%%)", J.id, J.playing, J.maxPlayers, T))
        return J.id, J
    end
    warn("No suitable server found")
    return nil
end, HopToNewServer = function()
    local G, V = q.Hop.FindBestServer()
    if not G or G == "" then
        warn("Invalid JobId")
        return false
    end
    if G == game.JobId then
        warn("Already in this server")
        return false
    end
    local y = game:GetService("Players")
    local Z = game:GetService("TeleportService")
    local j = y.LocalPlayer
    local i, c = pcall(function() Z:TeleportToPlaceInstance(game.PlaceId, G, j) end)
    if not i then
        warn("TeleportToPlaceInstance failed:", c)
        return false
    end
    return true
end, HopToNewServerUsingJobid = function(G)
    local V = game:GetService("Players")
    local y = game:GetService("TeleportService")
    local Z = V.LocalPlayer
    if not G or G == "" then
        warn("[Hop] No valid JobId")
        return false
    end
    local j, i = pcall(function() y:TeleportToPlaceInstance(game.PlaceId, G, Z) end)
    if j then return true end
    warn("[Hop] Teleport failed, trying another:", i)
    task.wait(.5)
    warn("[Hop] All hop attempts failed")
    return false
end }
local U = { PositionXScale = .01, PositionYScale = .19, SizeXScale = .5, SizeYScale = .17, LineSpacing = 1, StrokeColor =
"#000000", StrokeThickness = 1.3 }
Z.statsGui = nil
Z.statsTextLabel = nil
if u.uiplayerstats then
    task.cancel(u.uiplayerstats)
    u.uiplayerstats = nil
end
u.UpdatePlayerStatusUI = function() if r.show_player_stats then
        if not Z.statsGui or not Z.statsGui.Parent then
            Z.statsGui = Instance.new("ScreenGui")
            Z.statsGui.Name = "SecretStatsGui"
            Z.statsGui.ResetOnSpawn = false
            Z.statsGui.DisplayOrder = 2
            Z.statsGui.IgnoreGuiInset = true
            local G = Instance.new("Frame", Z.statsGui)
            G.Name = "MainFrame"
            G.AnchorPoint = Vector2.new(0, 0)
            G.Position = UDim2.new(U.PositionXScale, 0, U.PositionYScale, 0)
            G.Size = UDim2.new(U.SizeXScale, 0, U.SizeYScale, 0)
            G.BackgroundColor3 = Color3.new(.1, .1, .1)
            G.BackgroundTransparency = 1
            G.BorderSizePixel = 0
            G.AutomaticSize = Enum.AutomaticSize.None
            local y = Instance.new("TextLabel", G)
            local function j(G)
                local V = { Enum.Font.FredokaOne, Enum.Font.GothamBold, Enum.Font.Gotham, Enum.Font.SourceSans }
                for V, y in ipairs(V) do
                    local Z = pcall(function() G.Font = y end)
                    if Z then return end
                end
            end
            j(y)
            y.Name = "StatsLabel"
            y.TextColor3 = Color3.new(1, 1, 1)
            y.TextXAlignment = Enum.TextXAlignment.Left
            y.TextYAlignment = Enum.TextYAlignment.Top
            y.BackgroundTransparency = 1
            y.Size = UDim2.new(1, 0, 1, 0)
            y.AutomaticSize = Enum.AutomaticSize.None
            y.TextScaled = true
            y.LineHeight = U.LineSpacing
            y.RichText = true
            Z.statsTextLabel = y
            Z.statsGui.Parent = V.PlayerGui
        end
        if Z.statsTextLabel then
            local G = {}
            for y, Z in pairs(Z.PlayerSecrets) do
                local j = V.LocalPlayer:GetAttribute(y) or 0
                local i = typeof(j) == "number" and string.format("%.2f", j) or tostring(j)
                local c = ""
                if i == "0.00" then c = y .. (": " .. i) else
                    if y == "SessionTime" then i = tostring(J.formatDuration(j)) end
                    c = y .. (": <b><font color=\'#39FF14\'>" .. (i .. "</font></b>"))
                end
                table.insert(G, c)
            end
            local y = table.concat(G, "\n")
            local j = string.format("<stroke joins=\'round\' sizing=\'fixed\' color=\'%s\' thickness=\'%d\'>%s</stroke>",
                U.StrokeColor, U.StrokeThickness, y)
            Z.statsTextLabel.Text = j
        end
    else if Z.statsGui and Z.statsGui.Parent then
            Z.statsGui:Destroy()
            Z.statsGui = nil
            Z.statsTextLabel = nil
            print("\240\159\146\171 destroyed")
        end end end
u.uiplayerstats = task.spawn(function() while true do
        task.wait(.5)
        local G, V = pcall(function() u.UpdatePlayerStatusUI() end)
        if not G then end
    end end)
local function Q(G, V)
    if not G or not V then
        print("message or keywordText are nil")
        return false
    end
    local y = string.lower(G)
    for G in string.gmatch(V, "%a+") do
        local V = string.lower(G)
        if not string.find(y, V, 1, true) then return false end
    end
    return true
end
local function o()
    local G, y = pcall(function() return V.LocalPlayer.PlayerGui.Version_UI.Version end)
    if G and y then return y.Text else
        warn("Could not find the server version UI element.")
        return "Unknown"
    end
end
local function I(G)
    local V, y, Z = string.match(G, "^(.-)%s+%[(%d+%.?%d*)%s*KG%]%s+%[Age%s*(%d+)%]$")
    if V then return V, tonumber(y), tonumber(Z) end
    V, y = string.match(G, "^(.-)%s+%[(%d+%.?%d*)%s*KG%]$")
    if V then return V, tonumber(y), -1 end
    return nil
end
local R = {}
local function n(G)
    local V = string.match(G, "{(.-)}")
    return "{" .. (V .. "}")
end
local function w()
    local G = {}
    for V, y in pairs(R) do table.insert(G, y) end
    table.sort(G)
    return G
end
local function GJ(G)
    local V = {}
    if not G then return V end
    for G, y in ipairs(G) do
        local Z = R[y]
        if Z then V[Z] = true end
    end
    return V
end
g.AllBigDataKeys = {}
g.ReloadDataService = function()
    Z.BigData = V.DataService:GetData()
    g.AllBigDataKeys = {}
    if #g.AllBigDataKeys == 0 then for G, V in pairs(Z.BigData) do table.insert(g.AllBigDataKeys, G) end end
end
g.ReloadDataService()
g.data_key = {}
g.HatchDataWebhook = {}
g.DataSaveSlots = {}
g.GetBigDataUsingKey = function(G) return Z.BigData[G] end
Z.InventoryDataBind = g.GetBigDataUsingKey("InventoryData")
g.DataSaveSlots = g.GetBigDataUsingKey("SaveSlots")
local function VJ()
    warn("Rejoin...")
    V.TeleportService:Teleport(game.PlaceId)
end
Z.AgeBreakMachine = { Data = nil, State = "UNKNOWN", StatusText = "", remotes = {}, STATES = { EMPTY = "EMPTY", SUBMITTED = "SUBMITTED", RUNNING = "RUNNING", READY_TO_CLAIM = "READY_TO_CLAIM", UNKNOWN = "UNKNOWN" }, SetTextAgebreak = function(
    G)
    Z.TEXT_AGEBREAK = G
    if Z.agebreak_lbl then Z.agebreak_lbl:SetText(G) end
end, LoadRequiredDataAgeBreak = function()
    local G = Z.AgeBreakMachine
    local V = game:GetService("ReplicatedStorage")
    local y = V:WaitForChild("GameEvents")
    G.remotes.SubmitHeld = y:WaitForChild("PetAgeLimitBreak_SubmitHeld")
    G.remotes.SubmitDups = y:WaitForChild("PetAgeLimitBreak_Submit")
    G.remotes.Claim = y:WaitForChild("PetAgeLimitBreak_Claim")
    G.remotes.Cancel = y:WaitForChild("PetAgeLimitBreak_Cancel")
    local j = y:FindFirstChild("TradeEvents")
    local i = j and j:FindFirstChild("TradeTokens")
    G.remotes.SkipTokens = i and i:FindFirstChild("Purchase")
    G.Update()
    return true
end, AgebreakDataLive = function()
    local G = Z.AgeBreakMachine
    local V = g.GetBigDataUsingKey("PetAgeBreakMachine")
    G.Data = V
    G.State = G.GetState()
    return V, G.State
end, GetState = function()
    local G = Z.AgeBreakMachine
    local V = G.Data
    local y = G.STATES
    if not V or not V.SubmittedPet then return y.EMPTY end
    if V.SubmittedPet and (V.PetReady == true and V.IsRunning ~= true) then return y.READY_TO_CLAIM end
    if V.SubmittedPet and (V.IsRunning == true and tonumber(V.TimeLeft or 0) > 0) then return y.RUNNING end
    if V.SubmittedPet and (V.IsRunning ~= true and V.PetReady ~= true) then return y.SUBMITTED end
    return y.UNKNOWN
end, FormatTime = function(G)
    local V = math.max(0, tonumber(G) or 0)
    local y = math.floor(V / 86400)
    local Z = V % 86400
    local j = math.floor(Z / 3600)
    Z = Z % 3600
    local i = math.floor(Z / 60)
    local c = math.floor(Z % 60)
    if y > 0 then return string.format("%dd:%dh:%dm:%ds", y, j, i, c) end
    if j > 0 then return string.format("%dh:%dm:%ds", j, i, c) end
    if i > 0 then return string.format("%dm:%ds", i, c) end
    return string.format("%ds", c)
end, BuildAgeBreakRejoinText = function()
    local G = Z.AgeBreakMachine
    G.AgebreakDataLive()
    local V = G.Data
    local y = tonumber(Z.AgeBreakMainSettingsReadOnly.max_level) or 125
    local function j(G)
        G = tostring(G or "")
        G = G:gsub("&", "&amp;")
        G = G:gsub("<", "&lt;")
        G = G:gsub(">", "&gt;")
        return G
    end
    if not V or not V.SubmittedPet then return
        "<b><font color=\'#FFD166\'>[AgeBreak Rejoin]</font></b>\n<font color=\'#FF6B6B\'>No pet inside the machine.</font>" end
    local i = V.SubmittedPet
    local c = i.PetData or {}
    local J = j(i.PetType or "Unknown Pet")
    local T = tonumber(c.Level) or 0
    local d = G.FormatTime(tonumber(V.TimeLeft) or 0)
    return "<b><font color=\'#FFD166\'>[AgeBreak Rejoin]</font></b>\n" ..
    ("<font color=\'#00FFFF\'><b>" .. (J .. ("</b></font>, " .. ("<font color=\'#D7E1FF\'>Level </font><font color=\'#7CFF8A\'><b>" .. (T .. (" / " .. (y .. ("</b></font>, " .. ("<font color=\'#D7E1FF\'>Ready in </font><font color=\'#FFD166\'><b>" .. (d .. "</b></font>.\n<font color=\'#B4B4B4\'>To disable the autojoin, join the Main World.</font>"))))))))))
end, GetTimeLeftAgeBreak = function()
    local G = Z.AgeBreakMachine
    local V = G.Data
    local y = G.State
    local j = G.STATES
    if y == j.RUNNING then
        local G = tonumber(V and V.TimeLeft) or 0
        return tonumber(G)
    end
    return 0
end, GetPetInfo = function()
    local G = Z.AgeBreakMachine
    local V = G.Data
    if not V or not V.SubmittedPet then return nil end
    local y = V.SubmittedPet
    local j = y.PetData or {}
    return { UUID = y.UUID, PetType = y.PetType or "?", Name = j.Name or "?", Level = tonumber(j.Level) or 0, BaseWeight =
    tonumber(j.BaseWeight) or 0, HatchedFrom = j.HatchedFrom or "", MutationType = j.MutationType or "", IsFavorite = j
    .IsFavorite == true }
end, GetPetLine = function()
    local G = Z.AgeBreakMachine
    local V = G.GetPetInfo()
    if not V then return "No pet inside" end
    local y = ""
    if V.MutationType and V.MutationType ~= "" then y = " | Mut: " .. tostring(V.MutationType) end
    return string.format("%s (%s) | Lv.%s | %.2f KG%s", tostring(V.PetType), tostring(V.Name), tostring(V.Level),
        tonumber(V.BaseWeight) or 0, y)
end, GetStatusText = function()
    local G = Z.AgeBreakMachine
    local V = G.Data
    local y = G.State
    local j = G.STATES
    if y == j.EMPTY then return "\226\154\170 AgeBreak: Empty | No pet inside" end
    if y == j.READY_TO_CLAIM then return "\240\159\159\162 AgeBreak: Ready to claim | " .. G.GetPetLine() end
    if y == j.RUNNING then
        local y = tonumber(V and V.TimeLeft) or 0
        return "\240\159\159\161 AgeBreak: Running | " .. (G.FormatTime(y) .. (" left | " .. G.GetPetLine()))
    end
    if y == j.SUBMITTED then return "\240\159\159\160 AgeBreak: Pet submitted, waiting to start | " .. G.GetPetLine() end
    return "\240\159\148\180 AgeBreak: Unknown state"
end, Update = function()
    local G = Z.AgeBreakMachine
    G.AgebreakDataLive()
    local V = G.GetStatusText()
    G.StatusText = V
    G.SetTextAgebreak(V)
    return { Text = V, State = G.State, Data = G.Data, Pet = G.GetPetInfo() }
end, Claim = function()
    local G = Z.AgeBreakMachine
    if not G.remotes.Claim then return false end
    local V = pcall(function() G.remotes.Claim:FireServer() end)
    Z.Notify("Claim pet", 3)
    return V
end, SubmitHeld = function()
    local G = Z.AgeBreakMachine
    if not G.remotes.SubmitHeld then return false end
    local V = pcall(function() G.remotes.SubmitHeld:FireServer() end)
    return V
end, SubmitDups = function(G)
    local V = Z.AgeBreakMachine
    if not V.remotes.SubmitDups then return false end
    if type(G) ~= "table" or #G == 0 then return false end
    local y = pcall(function() V.remotes.SubmitDups:FireServer(G) end)
    return y
end, Cancel = function()
    local G = Z.AgeBreakMachine
    if not G.remotes.Cancel then return false end
    local V = pcall(function() G.remotes.Cancel:FireServer() end)
    return V
end, SkipWithTokens = function()
    local G = Z.AgeBreakMachine
    if not G.remotes.SkipTokens then return false end
    local V = pcall(function() G.remotes.SkipTokens:InvokeServer(3453278902) end)
    return V
end, AutoRejoinLoop = function()
    if not Z.isagebreak_autorejoin_main then return false end
    local G = Z.AgeBreakMachine.GetTimeLeftAgeBreak()
    if G > 2 then
        local G = string.format("%s", Z.AgeBreakMachine.BuildAgeBreakRejoinText())
        Z.Notify(G, 5)
        task.wait(3)
        VJ()
        task.wait(3)
        return false
    end
    Z.Notify("[AgeBreak Complete] Teleport to main world", 5)
    task.wait(2)
    if V.TradeWorldController and V.TradeWorldController.TeleportToMainWorld then V.TradeWorldController
            :TeleportToMainWorld() else
        warn("TradeWorldController not loaded or TeleportToMainWorld missing")
        Z.Notify("Teleport Failed -  MainWorld", 2)
        task.wait(4)
    end
end }
Z.AgeBreakMachine.LoadRequiredDataAgeBreak()
if Z.GetCheckIfPro() then Z.AgeBreakMachine.AutoRejoinLoop() end
q.Inventory = { GetSettings = function()
    local G = g.GetBigDataUsingKey("Settings")
    return G
end, GetCurrentPetsInData = function()
    local G = {}
    local V = q.Inventory.GetPetInventory()
    for V, y in pairs(V) do
        local Z = y.UUID
        if IsFavorite then end
        table.insert(G, V)
    end
    return G
end, GetInventory = function()
    local G, V = pcall(function()
        local G = g.GetBigDataUsingKey("InventoryData")
        if not G then return {} end
        return G
    end)
    return G and V or {}
end, GetPetInventory = function()
    local G, V = pcall(function()
        local G = g.GetBigDataUsingKey("PetsData")
        if not G then return {} end
        local V = G.PetInventory
        if not V or not V.Data then return {} end
        return V.Data
    end)
    return G and V or {}
end, GetEquippedPets = function()
    local G = g.GetBigDataUsingKey("PetsData")
    local V = G.EquippedPets
    return V
end, GetActivePetsAsKeyVal = function()
    local G = {}
    local V = g.GetBigDataUsingKey("PetsData")
    local y = V.EquippedPets
    for V, y in ipairs(y) do G[y] = true end
    return G
end, GetTotalOwnedPets = function()
    local G = g.GetBigDataUsingKey("PetsData")
    if not G then return 0 end
    local V = G.PetInventory
    local y = 0
    if not V or not V.Data then return 0 end
    for G, V in pairs(V.Data) do y = y + 1 end
    return y
end, GetMaxEggsAndInventorySpaceCount = function()
    local G = g.GetBigDataUsingKey("PetsData")
    if not G then return 0, 0 end
    local V = G.MutableStats
    if not V then return 0, 0 end
    local y = tonumber(V.MaxEggsInFarm) or 0
    local Z = tonumber(V.MaxPetsInInventory) or 0
    return y, Z
end, GetPetsInventoryCounts = function()
    local G, V, y = pcall(function()
        local G = g.GetBigDataUsingKey("PetsData")
        local V = G.PetInventory
        local y = G.MutableStats
        local Z = G.EquippedPets
        local j = y.MaxPetsInInventory
        local i = 0
        for G, V in pairs(V.Data) do i = i + 1 end
        return i, j
    end)
    if G then return V, y end
    return 0, 0
end, GetPetsCount_UI_TEXT = function()
    local G, V = pcall(function()
        local G = g.GetBigDataUsingKey("PetsData")
        local V = G.PetInventory
        local y = G.MutableStats
        local Z = G.EquippedPets
        local j = y.MaxEggsInFarm
        local i = y.MaxEquippedPets
        local c = y.MaxPetsInInventory
        local J = 0
        local T = "#00FF2A"
        for G, V in pairs(V.Data) do J = J + 1 end
        if J >= c then T = "#FF2C00" end
        local d = {}
        table.insert(d, string.format("Pets In Inventory: <font color=\'%s\'>%s</font> / %s\n", T, J, c))
        table.insert(d, string.format("Max Eggs Allowed: %s\n", j))
        table.insert(d, string.format("Max Pets Equip Allowed: %s\n", i))
        table.insert(d, string.format("Eggs Planted: %s\n", q.GetTotalEggsOnFarm()))
        return table.concat(d)
    end)
    if G then return V end
    return ""
end, GetEggsData = function()
    local G = g.GetBigDataUsingKey("SaveSlots")
    for G, V in pairs(G.AllSlots) do
        warn("Key: " .. G)
        J.JsonPrint(V)
        warn("-----------------------")
    end
end }
Z.TradeData = function() end
Z.GetMyTokens = function()
    local G = g.GetBigDataUsingKey("TradeData")
    local V = G.Tokens or 0
    return V
end
Z.GetMyTokens()
Z.GetTradeLocks = function()
    local G = {}
    local V = g.GetBigDataUsingKey("TradeData")
    for V, y in pairs(V.TradeLocks) do for V, y in pairs(y) do
            local Z = y.Value
            local j = y.Type
            local i = string.format("%s | %s | %s", V, Z, j)
            G[V] = true
        end end
    return G
end
Z.GetMyListingsPets = function()
    local G = g.GetBigDataUsingKey("TradeData")
    local V = {}
    local y = {}
    local Z = {}
    local j = 0
    for G, i in pairs(G.Listings) do
        local c = i.Price
        local J = i.Time
        local T = i.ItemType
        local d = i.ItemId or "-"
        if T and T == "Holdable" then continue end
        local u = t(d)
        if not u then continue end
        V[d] = true
        j = j + 1
        local q = u.PetData
        local g = q.IsFavorite
        local E = q.Level
        local a = q.BaseWeight
        local H = u.PetType
        local r = { uuid = G, petname = H }
        table.insert(y, G)
        table.insert(Z, r)
    end
    return V, j, y, Z
end
Z.GetMyListingsFruitsIDs = function()
    local G = g.GetBigDataUsingKey("TradeData")
    local V = {}
    for G, y in pairs(G.Listings) do
        local Z = y.Price
        local j = y.Time
        local i = y.ItemType
        local c = y.ItemId or "-"
        if i and i == "Holdable" then table.insert(V, G) end
    end
    return V
end
Z.GetMyListingsCount = function()
    local G = g.GetBigDataUsingKey("TradeData")
    local V = {}
    local y = {}
    local Z = 0
    for G, j in pairs(G.Listings) do
        local i = j.Price
        local c = j.Time
        local J = j.ItemType
        local T = j.ItemId or "-"
        V[T] = true
        Z = Z + 1
        table.insert(y, G)
    end
    return V, Z, y
end
Z.TradeData()
g.GetPlayerPetDataSnapshot = function()
    local G, V = pcall(function()
        local G = g.GetBigDataUsingKey("PetsData")
        if not G then return {} end
        local V = G.PetInventory
        if not V or not V.Data then return {} end
        for G, V in pairs(V.Data) do snapshot[G] = V end
        return snapshot
    end)
    return G and V or {}
end
g.GetNewUUIDs = function(G, V)
    local y = {}
    local Z = {}
    for G, V in ipairs(G) do
        local Z = type(V) == "table" and V.uuid or V
        if Z then y[Z] = true end
    end
    for G, V in ipairs(V) do
        local j = type(V) == "table" and V.uuid or V
        if j and not y[j] then table.insert(Z, j) end
    end
    return Z
end
g.GetHatchPetData = function(G)
    local V = {}
    local y = {}
    for G, Z in ipairs(G) do
        local j = t(Z)
        if j then
            local G = j.PetData
            local y = j.PetType
            local i = G.HatchedFrom
            local J = G.Name
            local T = G.Level
            local d = G.BaseWeight
            local u = G.MutationType or ""
            if c.AllMutationListEnum[u] then continue end
            if not IsPetHatchable(y) then
                print("Not on sell list: ", y)
                continue
            end
            local q = K(d, 1)
            q = tonumber(string.format("%.2f", q))
            table.insert(V, { uuid = Z, egg_name = i, pet_name = y, nickname = J, level = T, weight = q })
        else table.insert(y, Z) end
    end
    return V, y
end
J.getWebhookSoldItemFruitNew = function(G, y)
    local Z = G.item_name or "Unknown"
    local j = G.price or 0
    local i = G.tokens or 0
    local c = J.FormatNumber(j)
    local T = J.FormatNumber(i)
    local d = J.mutationConfig.Default
    local u = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local q = y and "||Exotic Hub||" or string.format("||%s||", V.LocalPlayer.Name)
    local g = string.format("%s ", Z)
    local E = string.format("\240\159\146\176 %s", g, c)
    local a = string.format("By User: %s\n
http://googleusercontent.com/immersive_entry_chip/0
http://googleusercontent.com/immersive_entry_chip/1
http://googleusercontent.com/immersive_entry_chip/2