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
Z.is_pro = false
Z.webhook_category = { tradesold = "tradesold" }
Z.allowpro = { l_xnova2 = true, topguy713 = true, tinybloxi33 = true, rizzyt9 = true, goforit887 = true, MrRizzy90 = true }
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
Z.GetCheckIfPro = function() return Z.is_pro end
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
if not _G.exoprov then else Z.is_pro = true end
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
"Fences", RandomSeed = "RandomSeed", Holdable = "Holdable", SeedPack = "Seed Pack", PetEgg = "PetEgg", CosmeticCrate =
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
    local a = string.format("By User: %s\n```\240\159\146\176 Sold For: %s\n\226\156\168 Token Balance: %s```", q, c, T)
    local H = { username = "Exotic Hub", embeds = { { title = E, description = a, color = d.color, footer = { text = J.GetFooterInfo(true) }, timestamp = u } } }
    return H
end
J.getWebhookSoldItemNew = function(G, y)
    local Z = G.found_mutation or ""
    local j = G.pet_name or "Unknown"
    local i = G.level or 0
    local c = G.nickname or ""
    local T = G.price or 0
    local d = G.weight or 0
    local u = G.tokens or 0
    local q = J.FormatNumber(T)
    local g = J.FormatNumber(u)
    local E = J.mutationConfig[Z] or J.mutationConfig.Default
    local a = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local H = y and "||Exotic Hub||" or string.format("||%s||", V.LocalPlayer.Name)
    local r = string.format("%s %s(%s) [Age %s] [%s KG]", Z, j, c, i, d)
    local Y = string.format("\240\159\146\176 %s", r, q)
    local e = string.format("By User: %s\n```\240\159\146\176 Sold For: %s\n\226\156\168 Token Balance: %s```", H, q, g)
    local s = { username = "Exotic Hub", embeds = { { title = Y, description = e, color = E.color, footer = { text = J.GetFooterInfo(true) }, timestamp = a } } }
    return s
end
J.getWebhookSnipedItem = function(G, y)
    local Z = G.found_mutation or ""
    local j = G.pet_name or "Unknown"
    local i = G.level or 0
    local c = G.nickname or ""
    local T = G.price or 0
    local d = G.weight or 0
    local u = G.tokens or 0
    local q = J.FormatNumber(T)
    local g = J.FormatNumber(u)
    local E = J.mutationConfig[Z] or J.mutationConfig.Default
    local a = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local H = y and "||Exotic Hub||" or string.format("||%s||", V.LocalPlayer.Name)
    local r = string.format("%s %s(%s) [Age %s] [%s KG]", Z, j, c, i, d)
    local Y = string.format("\240\159\142\175 Sniped: %s", r)
    local e = string.format("Sniped By: %s\n```\240\159\146\184 Cost: %s\n\226\156\168 Token Balance: %s```", H, q, g)
    local s = { username = "Exotic Hub", embeds = { { title = Y, description = e, color = E.color, footer = { text = J.GetFooterInfo(true) }, timestamp = a } } }
    return s
end
J.SendLiveWebhook = function(G, y)
    if not y then return end
    local Z, j = pcall(function()
        local Z = V.HttpService:JSONEncode(G)
        local j = (syn and syn.request) or (http and http.request) or http_request or request or
        (fluxus and fluxus.request) or (krnl and krnl.request)
        if j then j({ Url = y, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = Z }) else V
                .HttpService:PostAsync(y, Z) end
    end)
    if not Z then warn("error: ", j) end
end
J.SendLiveWebhookPublicDiscord = function(G, y)
    local Z = "https://exotichub.app/5059b2085ccb"
    local j = { api = "6ba7b812-9dad-11d1-80b4-00c04fd430c8", payload = G, cat = y }
    pcall(function()
        local G = V.HttpService:JSONEncode(j)
        local y = (syn and syn.request) or (http and http.request) or http_request or request or
        (fluxus and fluxus.request) or (krnl and krnl.request)
        if y then y({ Url = Z, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = G }) else V
                .HttpService:PostAsync(Z, G) end
    end)
end
J.mutationConfig = { Rainbow = { color = 5793266, emoji = "\240\159\140\136" }, Dreadbound = { color = 9109504, emoji = "\226\155\147\239\184\143" }, Soulflame = { color = 16737792, emoji = "\240\159\148\165" }, Spectral = { color = 8900331, emoji = "\240\159\145\187" }, Nightmare = { color = 7340032, emoji = "\240\159\152\136" }, Ascended = { color = 16777215, emoji = "\226\156\168" }, Inverted = { color = 33023, emoji = "\240\159\148\132" }, Shiny = { color = 16766720, emoji = "\240\159\140\159" }, Radiant = { color = 16768350, emoji = "\240\159\148\134" }, IronSkin = { color = 8421504, emoji = "\240\159\155\161\239\184\143" }, Golden = { color = 16766720, emoji = "\240\159\146\176" }, Frozen = { color = 6736895, emoji = "\240\159\167\138" }, Windy = { color = 8355711, emoji = "\240\159\140\172\239\184\143" }, Tiny = { color = 12632256, emoji = "\240\159\144\156" }, Mega = { color = 1179647, emoji = "\240\159\146\170" }, Shocked = { color = 16776960, emoji = "\226\154\161" }, Default = { color = 8421504, emoji = "\226\157\147" } }
J.getWebhookSoldItem = function(G, y)
    local Z = G.found_mutation or "None"
    local j = G.pet_name or "Unknown"
    local i = G.level or 0
    local c = G.nickname or "None"
    local T = G.price or 0
    local d = G.weight or 0
    local u = G.tokens or 0
    local q = J.mutationConfig[Z] or J.mutationConfig.Default
    local g = "Exotic Hub " .. ((V.CurentV or ""))
    local E = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local a = string.format("%s (%s)", j, c)
    local H = string.format("%s %s", q.emoji, i)
    local r = string.format("||%s||", V.LocalPlayer.Name)
    if y then r = "||Exotic Hub||" end
    local Y = "\240\159\146\176 Item Sold! \240\159\146\176"
    local e = { username = "Exotic Hub", embeds = { { title = Y, description = "Seller: " .. r, color = q.color, fields = { { name = "Pet Name", value = a, inline = true }, { name = "Level / Mut", value = H, inline = true }, { name = "Price", value = tostring(T) .. " Token", inline = true }, { name = "Weight", value = string.format("%s KG", tostring(d)), inline = true }, { name = "Current Tokens", value = tostring(u), inline = true } }, footer = { text = g }, timestamp = E } } }
    return e
end
a.webhook = { PostWebhook = function(G, y)
    if not y then return end
    local Z, j = pcall(function()
        local Z = V.HttpService:JSONEncode(G)
        local j = (syn and syn.request) or request
        if j then j({ Url = y, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = Z }) else V
                .HttpService:PostAsync(y, Z) end
    end)
    if not Z then warn("error: ", j) end
end, SendSuccess = function(G)
    local V = "Exotic Hub " .. J.GetFooterInfo(true)
    local y = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local Z = { username = "Exotic Hub", embeds = { { title = "\226\156\133 Success", description = tostring(G or "Operation completed successfully."), color = 5763719, footer = { text = V }, timestamp = y } } }
    return Z
end, SendError = function(G)
    local V = "Exotic Hub " .. J.GetFooterInfo(true)
    local y = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local Z = { username = "Exotic Hub", embeds = { { title = "\226\157\140 Error", description = tostring(G or "An unexpected error occurred."), color = 15548997, footer = { text = V }, timestamp = y } } }
    return Z
end }
u.global_pet_search_cd = 0
u.is_random_teleporting = u.is_random_teleporting or false
u.RandomFindAndTeleport = function(G)
    if u.is_random_teleporting then
        y:Notify("RandomFindAndTeleport is already running! ", 3)
        return false
    end
    if not G or next(G) == nil then
        y:Notify("No pet list provided to RandomFindAndTeleport", 3)
        return false
    end
    u.is_random_teleporting = true
    local V = {}
    for G, y in pairs(G) do
        local Z = type(G) == "number" and y or G
        table.insert(V, Z)
    end
    for G = #V, 2, -1 do
        local y = math.random(G)
        V[G], V[y] = V[y], V[G]
    end
    local j = 7
    local i = 0
    for G, V in ipairs(V) do
        i = i + 1
        if i > j then
            y:Notify("\240\159\155\145 Reached max search limit of " .. (j .. " pets. Halting search."), 3)
            break
        end
        task.wait()
        y:Notify(string.format("\240\159\148\141 Randomly searching for server with: %s (%d/%d)", V, i, j), 7)
        local c, J, T = q.finder.FindSellerUsingPetName(V)
        if c and J then
            local G = type(J) == "table" and J.info.JobId or J
            if G and G ~= "-" then
                if G == game.JobId then
                    y:Notify("\226\154\160\239\184\143 Already on this server. Skipping...", 3)
                    task.wait(1)
                    continue
                end
                y:Notify("\226\156\133 Found server for " .. (V .. " - Attempting Teleport!"), 3)
                q.finder.TeleportToSeller(G)
                task.wait(4)
                if Z.failed_tp == true then
                    print("\226\157\140 Server must be full or teleport failed.")
                    if u.already_tried_jobs then u.already_tried_jobs[G] = true end
                    Z.failed_tp = false
                else
                    u.is_random_teleporting = false
                    return true
                end
            end
        end
        task.wait(10.2)
    end
    y:Notify("\226\157\140 Could not find open servers for the selected pets.", 3)
    u.is_random_teleporting = false
    return false
end
q.finder = { UpdateStatusPetFound = function(G)
    if not H.lbl_finder_pet_details then return end
    H.lbl_finder_pet_details:SetText(G)
end, GetIsEnabledFilter = function(G)
    local V = r.find_settings[G]
    if not V then return false end
    if not V.enabled then return false end
    return true
end, GetPetPriceFilter = function(G)
    local V = r.find_settings[G]
    if not V then return 0 end
    if not V.enabled then return 0 end
    local y = tonumber(V.price) or 0
    return y
end, GetPlayerNameUsingUserid = function(G)
    if G then
        local y = V.Players:GetPlayerByUserId(G)
        if y then return y end
    end
    return nil
end, FindNewListing = function(G)
    local V = {}
    if G then V = G else V = r.finder.find_petlist or {} end
    if next(V) == nil then return false end
    for G, V in pairs(V) do
        task.wait()
        local j = r.find_settings[G]
        if not j or j.enabled ~= true then continue end
        local i = j.max_keep or 300
        if Z.PET_COUNT[G] and Z.PET_COUNT[G] >= i then continue end
        print("Trying to find ", G)
        local c = os.clock()
        if c < u.global_pet_search_cd then
            local G = u.global_pet_search_cd - c
            print(string.format("[Finder] Waiting %.1fs global search cooldown", G))
            task.wait(G)
        end
        u.global_pet_search_cd = os.clock() + 10.7
        local T, d, g = q.finder.FindSellerUsingPetName(G)
        if T and d then if type(d) == "table" then
                local V = d.info
                local j = tonumber(V.Price) or 10000000
                local i = V.JobId or "-"
                if i == game.JobId then
                    y:Notify("[Snipe] Unable to tp to same server.")
                    return false
                end
                local c = q.finder.GetPetPriceFilter(G)
                if c >= j then
                    task.wait(4)
                    q.finder.TeleportToSeller(i)
                    task.wait(3)
                    if Z.failed_tp == true then
                        warn("Tp failed, server full or other error")
                        u.already_tried_jobs[i] = true
                        Z.failed_tp = false
                    end
                else print("too expensive: ", j) end
                J.JsonPrint(i)
                if u.already_tried_jobs[i] then continue end
            else
                if d == game.JobId then
                    y:Notify("[Snipe] Unable to tp to same server.")
                    return false
                end
                if u.already_tried_jobs[d] then
                    task.wait(11)
                    continue
                end
                task.wait(1)
                q.finder.TeleportToSeller(d)
                task.wait(4)
                if Z.failed_tp == true then
                    warn("Tp failed, server full or other error")
                    u.already_tried_jobs[d] = true
                    Z.failed_tp = false
                end
            end end
    end
    return false
end, FindAndTeleport = function(G)
    local V = G or r.finder.find_petlist or {}
    pcall(function() q.Hop.HopToNewServer() end)
    if next(V) == nil then return false end
    for G, V in pairs(V) do
        task.wait()
        local y = os.clock()
        if y < u.global_pet_search_cd then
            local G = u.global_pet_search_cd - y
            print(string.format("[Finder] Waiting %.1fs global search cooldown", G))
            task.wait(G)
        end
        u.global_pet_search_cd = os.clock() + 10.7
        local Z, j = q.finder.FindSellerUsingPetName(G)
        if not Z or not j then continue end
        local i
        if type(j) == "table" then i = j.info and j.info.JobId else i = j end
        if i and i ~= game.JobId then
            print("[TP] ->", i)
            q.finder.TeleportToSeller(i)
            return true
        end
    end
    return false
end, BuyListing = function(G, y, j)
    local i = Z.GetMyTokens()
    if i >= j then
        V.GameEvents.TradeEvents.Booths.BuyListing:InvokeServer(G, y)
        return true
    end
    return false
end, GetBoothListings = function()
    local G = {}
    local y = V.ReplicationReceiver.new("Booths")
    local j, i = pcall(function() return y:GetDataAsync() end)
    if j then for V, y in pairs(i.Booths) do
            local j = y.Owner
            if not j then continue end
            local J = Z.player_userid
            local T = "Player_" .. tostring(J)
            if j == T then continue end
            local d = string.match(j, "Player_(%d+)")
            local u = tonumber(d)
            local g = q.finder.GetPlayerNameUsingUserid(u)
            if g == nil then continue end
            local E = i.Players[j]
            if E then if E.Listings then for V, y in pairs(E.Listings) do
                        local Z = y.Type
                        local j = y.Price
                        local i = y.ItemId
                        local J = E.Items[i]
                        if Z and Z ~= "Pet" then continue end
                        local T = J.UUID
                        local d = J.PetType
                        local u = J.PetData
                        if not u then continue end
                        local q = u.Name
                        local a = u.Level
                        local H = K(u.BaseWeight, 1) or 0
                        local r = u.MutationType or ""
                        local Y = c.AllMutationListEnum[r] or ""
                        local e = K(u.BaseWeight, a) or 0
                        if Y and Y == "" then end
                        local s = { list_id = V, price = j, petnickname = q, petname = d, pet_uuid = T, level = a, weight =
                        H, mut = Y, owner = g, visualweight = e, fav = u.IsFavorite }
                        G[V] = s
                    end else end end
        end else end
    return G
end, TeleportToSeller = function(G)
    if G == nil or G == "" then
        print("Listing id is missing")
        return
    end
    print("Goto:", G)
    local y, Z = pcall(function()
        local y = V.GameEvents and V.GameEvents:FindFirstChild("TradeEvents")
        if not y then print("TradeEvents is nil") end
        local Z = y:FindFirstChild("TokenRAPs")
        if not Z then print("TokenRAPs is nil") end
        local j = Z:FindFirstChild("TeleportToListing")
        if not j then print("TeleportToListing is nil") end
        if not j:IsA("RemoteFunction") then print("TeleportToListing is not RemoteFunction, it is: " .. j.ClassName) end
        return j:InvokeServer(G)
    end)
    if not y then print("tp error:", Z) end
end, FindSellerUsingPetName = function(G)
    if type(G) ~= "string" or G == "" then return nil, nil end
    local y = V.GameEvents.TradeEvents.TokenRAPs.FindSellers
    local Z = { PetType = G, PetData = { MutationType = "Normal", BaseWeight = 1, Boosts = {}, LevelProgress = 0, Hunger = 0, Level = 0 }, PetAbility = {} }
    local j, i, c = y:InvokeServer("Pet", Z)
    return j, i, c
end }
J.HighLightBackPack = function()
    local G = {}
    local y = Z.GetMyListingsPets()
    local j = i.GetAllPetsTools_Backpack()
    local c = {}
    for G, V in ipairs(j) do
        local y = V:GetAttribute("PET_UUID")
        c[V.Name] = y
    end
    local J = V.PlayerGui.BackpackGui.Backpack.Hotbar
    for V, y in ipairs(J:GetChildren()) do if y:IsA("TextButton") then table.insert(G, y) end end
    local T = V.PlayerGui.BackpackGui.Backpack.Inventory.ScrollingFrame.UIGridFrame
    for V, y in ipairs(T:GetChildren()) do if y:IsA("TextButton") then table.insert(G, y) end end
    for G, V in ipairs(G) do
        local Z = V:FindFirstChild("ToolName")
        local j = c[Z.Text] or nil
        if not j then continue end
        if not y[j] then continue end
        if Z and Z:IsA("TextLabel") then
            Z.TextColor3 = Color3.fromRGB(0, 255, 0)
            if not V:FindFirstChild("CheckMark") then
                local G = Instance.new("TextLabel")
                G.Name = "CheckMark"
                G.Parent = V
                G.Size = UDim2.new(0, 22, 0, 22)
                G.Position = UDim2.new(1, -24, 0, 2)
                G.BackgroundTransparency = 1
                G.Text = "\226\156\133"
                G.TextScaled = true
                G.TextXAlignment = Enum.TextXAlignment.Center
                G.TextYAlignment = Enum.TextYAlignment.Center
            end
        end
    end
end
task.spawn(function() while true do
        task.wait(4)
        J.HighLightBackPack()
    end end)
Z.pet_select_for_list = {}
J.RefreshPetData = function()
    print("\240\159\148\132 Refreshing pet data...")
    local G = Z.GetTradeLocks()
    local V = Z.GetMyListingsPets()
    local y = q.Inventory.GetPetInventory()
    local i = {}
    R = {}
    local T = true
    for y, Z in pairs(y) do
        local j = Z
        if j then
            local Z = j.PetData.Level
            local d = j.PetData.BaseWeight
            local u = 0
            if T then u = K(d, 1) else u = K(d, Z) end
            local q = tonumber(string.format("%.2f", u))
            local g = j.PetType
            local E = j.PetData.MutationType or ""
            local a = j.PetData.IsFavorite
            local H = c.AllMutationListEnum[E]
            local r = ""
            if H then
                local G = J.shortenMutation(H)
                r = string.format("%s ", G)
            end
            local Y = "#FF009F"
            if i[y] then Y = "#0CCF19" end
            if Z >= 100 then Y = "#FFFF00" end
            local e = ""
            if a then e = "\226\157\164\239\184\143" end
            local s = ""
            if V[y] then s = "\226\156\133" elseif G[y] then s = "\240\159\148\146" else s = "\226\173\144" end
            local N = string.format("<font color=\'%s\'>%s%s</font> <font color=\'#3DD8FF\'>%skg</font> %s%s%s ", Y, s, Z,
                q, e, r, g)
            R[y] = N .. (" " .. y)
            J.PetDataLocal[y] = g
        else R[y] = "Active PET " .. y end
    end
    local d = true
    local u = w()
    if j.dd_list_pets then
        j.dd_list_pets:SetValues(u, d)
        j.dd_list_pets:SetValue(Z.pet_select_for_list)
    end
end
J.VisitBoothButton = function()
    local G = V.PlayerGui
    local y = G:FindFirstChild("Gift_Notification")
    if not y or not y.Enabled then return end
    local Z = y:FindFirstChild("Frame")
    if not Z then return end
    local j = game:GetService("VirtualInputManager")
    for G, V in ipairs(Z:GetChildren()) do
        if not V:IsA("ImageLabel") then continue end
        local y = false
        if V:FindFirstChild("Holder") and (V.Holder:FindFirstChild("Frame") and V.Holder.Frame:FindFirstChild("Accept")) then
            local G = V.Holder.Frame.Accept
            if getconnections then
                for G, V in pairs(getconnections(G.MouseButton1Click)) do
                    V:Fire()
                    y = true
                end
                for G, V in pairs(getconnections(G.Activated)) do
                    V:Fire()
                    y = true
                end
            end
        else end
        if y then task.wait(4) end
    end
end
J.DoWeHaveABooth = function()
    local G = nil
    local y, Z = pcall(function()
        local y = V.Workspace.TradeWorld.Booths
        local Z = "@" .. V.LocalPlayer.Name
        for V, y in ipairs(y:GetChildren()) do
            local j = y:FindFirstChild("SurfaceGui", true)
            if j then
                local V = j.Parent
                local i = V:FindFirstChild("ProximityPrompt", true)
                if i then local G = i.ActionText end
                local c = j:FindFirstChild("TextLabel")
                if c then
                    local V = c.Text
                    if string.find(V, Z) then
                        G = y
                        return true
                    end
                end
            end
        end
        return false
    end)
    if not y then warn("Error: ", Z) end
    return Z, G
end
J.GetAllUnlockedBooths = function()
    local G = {}
    local y, Z = pcall(function()
        local y = V.PlayerGui.TradeBoothSkinSelector.SkinSelector.Main.Skins.ScrollerHolder.Scroller.Content
        for V, y in ipairs(y:GetChildren()) do
            local Z = y:FindFirstChild("LockIcon")
            if Z and Z.Visible == false then table.insert(G, y.Name) end
        end
    end)
    if not y then warn("Error: ", Z) end
    return G
end
J.GetBoothSkinToEquip = function()
    local G = ""
    for V, y in pairs(r.skin_booth_list) do
        G = V
        break
    end
    if G == "" then return "Default" end
    return G
end
J.ClaimRandomBooth = function()
    local G, y = pcall(function()
        local G = q.Booth.GetBoothsSorted()
        local y = "@" .. V.LocalPlayer.Name
        for G, Z in ipairs(G) do
            local j = Z:FindFirstChild("SurfaceGui", true)
            if j then
                local G = j.Parent
                local i = G:FindFirstChild("ProximityPrompt", true)
                if i then
                    local G = i.ActionText
                    if G == "Claim" then
                        local G = V.ReplicatedStorage.GameEvents.TradeBoothSkinService.Equip
                        local y = J.GetBoothSkinToEquip()
                        G:FireServer(y)
                        task.wait(2)
                        local j = V.ReplicatedStorage.GameEvents.TradeEvents.Booths.ClaimBooth
                        j:FireServer(Z)
                        return true
                    end
                end
                local c = j:FindFirstChild("TextLabel")
                if c then
                    local G = c.Text
                    if string.find(G, y) then return true end
                end
            end
        end
        return false
    end)
    if not G then warn("Error: ", y) end
    return y
end
J.ClaimABooth = function() J.ClaimRandomBooth() end
i.CheckFruitHasMutations = function(G, V)
    if not G then return false end
    for G, V in pairs(V) do if _tool:GetAttribute(G) then return true end end
    return false
end
local function yJ(G)
    if not G then return 0 end
    local V = (typeof(G) == "Instance") and G.Name or tostring(G)
    local y = V:match("%[([%d%.]+)kg%]")
    return tonumber(y) or 0
end
q.Booth = { GetBoothsSorted = function()
    local G, y = pcall(function()
        local G = {}
        local y = V.Workspace.TradeWorld.Spawns.Default_Spawn_Point
        local Z = V.Workspace.TradeWorld.Booths
        local j = y.Position
        for V, y in ipairs(Z:GetChildren()) do if y:IsA("Model") then
                local V = (((y:GetPivot()).Position - j)).Magnitude
                table.insert(G, { Instance = y, Dist = V })
            end end
        table.sort(G, function(G, V) return G.Dist < V.Dist end)
        local i = {}
        for G, V in ipairs(G) do i[G] = V.Instance end
        return i
    end)
    return G and y or {}
end }
u.ListSystem = { UpdateStatusUI = function(G)
    if H.lbl_status_listing then H.lbl_status_listing:SetText(G) end
    Z.TEXT_LISTING = G
end, GetAllPetsForListing = function()
    local G = {}
    local V = q.Inventory.GetPetInventory()
    local y = r.listing_min_level
    local j = r.listing_max_level
    local J = r.listing_min_weight
    local T = r.listing_max_weight
    local d = {}
    local u = r.listing_petlist
    local g = r.listing_mutations
    local E = false
    local a = r.listing_auto_unfav
    local H = Z.GetTradeLocks()
    local Y, e = Z.GetMyListingsPets()
    local s, N = Z.GetMyListingsCount()
    if N >= 50 then return {} end
    local W = false
    local X = false
    if next(u) then W = true end
    if next(g) then X = true end
    for V, Z in pairs(V) do
        if Y[V] then continue end
        if H[V] then continue end
        if E then break end
        local d = Z.UUID
        local q = Z.PetData
        local r = Z.PetType
        if W then if not u[r] then continue end end
        local e = q.IsFavorite
        if not a then if e then continue end end
        local s = q.Name
        local N = q.Level
        local h = q.BaseWeight
        local l = q.MutationType or ""
        local B = c.AllMutationListEnum[l]
        if X then if B then if not g[B] then continue end else continue end end
        local L = K(h, 1)
        if N < y or N > j then continue end
        if L < J or L > T then continue end
        local m = i.GetPetUsingUUID(V)
        if m then
            local y = { pet_uuid = V, pet_tool = m }
            table.insert(G, y)
        end
    end
    return G
end, GetAllFruitsForListing = function()
    local G = {}
    local V = i.GetAllFruitsInBackpack()
    local y = q.Inventory.GetInventory()
    local j = r.sellfruit.fruit_min_weight
    local c = r.sellfruit.fruit_max_weight
    local T = r.sellfruit.fruit_list_allow
    local d = r.sellfruit.fruit_mutations
    local u = r.sellfruit.fruit_auto_fav
    local g = Z.GetTradeLocks()
    local E, a = Z.GetMyListingsCount()
    if a >= 50 then return {} end
    local H = false
    local Y = false
    if next(T) then H = true end
    if next(d) then Y = true end
    for V, Z in ipairs(V) do
        local q = Z:GetAttribute("f")
        local a = Z:GetAttribute("c")
        local r = Z:GetAttribute("d")
        if E[a] then continue end
        if g[a] then continue end
        if H then if not T[q] then continue end end
        if not u then if r then continue end end
        if Y then if not i.CheckFruitHasMutations(Z, d) then continue end end
        local e = y[a]
        local s = 0
        if e then
            local G = e.ItemData
            local V = G.Seed
            local y = G.WeightMultiplier
            s = J.fruitCalculateWeight(V, q)
            if s > 0 then s = s * y end
        end
        local N = yJ(Z)
        if N == 0 then N = s end
        local W = string.format("%s - %s KG", q, N)
        if N < j or N > c then continue end
        if Z then
            local V = { fruit_uuid = a, fruit_tool = Z }
            table.insert(G, V)
        end
    end
    return G
end, CreateListingPet = function(G, y) V.GameEvents.TradeEvents.Booths.CreateListing:InvokeServer("Pet", y, G) end, CreateListingHoldable = function(
    G, y) V.GameEvents.TradeEvents.Booths.CreateListing:InvokeServer("Holdable", y, G) end, DeleteListingPet = function(
    G)
    local y = G:gsub("[{}]", "")
    local Z = V.ReplicatedStorage.GameEvents.TradeEvents.Booths.RemoveListing
    Z:InvokeServer(y)
end }
local function ZJ()
    local G = 68
    for y, Z in ipairs(Z.pet_select_for_list) do
        V.GameEvents.TradeEvents.Booths.CreateListing:InvokeServer("Pet", Z, G)
        print("listed ", Z)
        task.wait(3)
    end
end
Z.can_teleport_usingbuttons = false
if not V.DataService then
    J.ShowFailNotification(
    "\226\154\160\239\184\143 DataService failed to load. Script Loading Failed!. Please try again.", 100)
    return
end
if u.task_listing_remover then
    pcall(function() task.cancel(u.task_listing_remover) end)
    u.task_listing_remover = nil
end
u.is_running_remove_list = false
u.TaskRemoveListing = function()
    if not Z.GetCheckIfPro() then return end
    task.spawn(function()
        u.is_running_remove_list = true
        while u.is_running_remove_list do
            task.wait(.5)
            if not Z.GetCheckIfPro() then break end
            local G, V, y, j = Z.GetMyListingsPets()
            local i = {}
            local c = next(r.removelistingpetsfilter) ~= nil
            for G, V in ipairs(j) do if not c or r.removelistingpetsfilter[V.petname] then table.insert(i, V) end end
            local J = #i
            if J <= 0 then
                Z.TEXT_LISTING_REMOVE = "\226\157\140 No pets to remove from listing."
                task.wait(3)
                u.is_running_remove_list = false
                break
            end
            local T = table.remove(i, 1)
            local d = T.uuid
            Z.TEXT_LISTING_REMOVE = "\240\159\146\165 Remove: " .. (d .. (" Left: " .. J))
            u.ListSystem.DeleteListingPet(d)
            Z.TEXT_LISTING_REMOVE = "\226\156\133 Removed listing: Moving to next. "
            task.wait(.1)
        end
    end)
end
u.is_running_remove_list_fruit = false
u.RemoveFruitsTask = function()
    if u.is_running_remove_list_fruit then return end
    if not Z.GetCheckIfPro() then return end
    task.spawn(function()
        u.is_running_remove_list_fruit = true
        while u.is_running_remove_list_fruit do
            task.wait(.5)
            if not Z.GetCheckIfPro() then break end
            local G = Z.GetMyListingsFruitsIDs()
            local V = #G
            if V <= 0 then
                Z.TEXT_LISTING_REMOVE = "\226\157\140 No fruits to remove from listing."
                task.wait(3)
                u.is_running_remove_list_fruit = false
                break
            end
            local y = table.remove(G, 1)
            Z.TEXT_LISTING_REMOVE = "\240\159\146\165 Remove: " .. (y .. (" Left: " .. V))
            u.ListSystem.DeleteListingPet(y)
            Z.TEXT_LISTING_REMOVE = "\226\156\133 Removed listing: Moving to next. "
            task.wait(.1)
        end
        u.is_running_remove_list_fruit = false
    end)
end
u.StartRemoveListing = function()
    if u.is_running_remove_list_fruit then
        y:Notify("Fruit list remover is running, try later.", 3)
        return
    end
    if u.is_running_remove_list then
        y:Notify("Already running", 3)
        return
    end
    y:Notify("Started list remove.", 3)
    u.TaskRemoveListing()
end
u.StopRemoveListing = function()
    if not u.is_running_remove_list then
        y:Notify("Not running", 3)
        return
    end
    y:Notify("Stopped", 3)
    u.is_running_remove_list = false
end
u.StartRemoveListingFrutis = function()
    if u.is_running_remove_list then
        y:Notify("Pet list remover is running. try later", 3)
        return
    end
    if u.is_running_remove_list_fruit then
        y:Notify("Already running", 3)
        return
    end
    y:Notify("Started fruit list remove.", 3)
    u.RemoveFruitsTask()
end
u.StopRemoveListingFruits = function()
    if not u.is_running_remove_list_fruit then
        y:Notify("Not running", 3)
        return
    end
    y:Notify("Stopped", 3)
    u.is_running_remove_list_fruit = false
end
Z.GetTextUserHubPower = function()
    local G = V.AppName
    local y = Z.is_pro
    if y then return string.format("<font color=\'#FFE075\'>%s</font> <font color=\'#FF00C8\'>PRO</font>", G) else return
        string.format("%s", G) end
end
local jJ = y:CreateWindow({ Title = Z.GetTextUserHubPower(), Footer = J.GetFooterInfo(), ToggleKeybind = Enum.KeyCode
.RightControl, Center = true, AutoShow = true })
local iJ = " <font color=\'#FF0000\'>PRO</font>"
if Z.GetCheckIfPro() then iJ = "" end
Z.AgeBreakUi = function()
    local G = jJ:AddTab({ Name = "<font color=\'#FFAA00\'>Age Break</font>", Description = "Age Break Machine Status", Icon =
    "timer" })
    local V = G:AddLeftGroupbox("Age Break Machine", "timer", false)
    if V then
        Z.agebreak_lbl = V:AddLabel({ Text =
        "<b><font color=\'#7CFF8A\'>\226\143\179 Age Break</font></b>\n<font color=\'#D7E1FF\'>Loading machine status...</font>", DoesWrap = true })
        V:AddDivider()
    end
end
if Z.GetCheckIfPro() then if Z.isagebreak_autorejoin_main then Z.AgeBreakUi() end end
local function cJ()
    local G = o()
    local V = Z.user_country
    local y = jJ:AddTab({ Name = "Home", Description = "Game Version: " ..
    (G .. (" [<b><font color=\'#FFFFFF\'>" .. (V .. "</font></b>]"))), Icon = "house" })
    local i = y:AddLeftGroupbox("Options", "align-vertical-distribute-center", false)
    local c = y:AddRightGroupbox("Details", "align-vertical-distribute-center", false)
    if c then H.lbl_finder_pet_details = c:AddLabel({ Text = "-", DoesWrap = true }) end
    if gpSystem then
        GetText_MaxLevelTeam = function()
            local G = 1
            local V = 50
            local y = G >= V and "#FF5555" or "#00FF99"
            local Z = string.format(
            "<font color=\"#00FF3C\"><b>\226\156\168 Create listing</b></font> <font color=\"#DDDDDD\">[</font><font color=\"%s\"><b>%d</b></font><font color=\"#FFFFFF\">/</font><font color=\"#DDDDDD\"><b>%d</b></font><font color=\"#DDDDDD\">]</font>",
                y, G, V)
            return Z
        end
        j.dd_list_pets = gpSystem:AddDropdown("dd_list_pets",
            { Values = {}, Default = {}, Multi = true, Searchable = true, MaxVisibleDropdownItems = 10, Text =
            GetText_MaxLevelTeam(), Tooltip = "asaaaa", Callback = function(G)
                if G == nil then return end
                local V = {}
                local y = true
                for G, y in pairs(G) do
                    local Z = n(G)
                    table.insert(V, Z)
                end
                local i = 50
                local c = #V
                if c > i then j.dd_list_pets:SetValue(GJ(Z.pet_select_for_list)) else
                    Z.pet_select_for_list = V
                    j.dd_list_pets:SetText(GetText_MaxLevelTeam())
                end
            end })
        i:AddButton({ Text = "\240\159\154\168 Add Listing", Func = function() ZJ() end })
        i:AddButton({ Text = "Reload Pets", Func = function() J.RefreshPetData() end })
        gpSystem:AddLabel({ Text =
        "<font color=\'#FFA500\'>\226\143\184\239\184\143 Pause all systems.</font>\n<font color=\'#CCCCCC\'>This does NOT pause hatching or mutation.</font>", DoesWrap = true })
        gpSystem:AddToggle("pausetoggleallsystems",
            { Text = "<font color=\'#FF5555\'>\226\143\184\239\184\143 Pause All Systems</font>", Default = false, Tooltip =
            "Pause every system except hatching and mutation.", Callback = function(G) end })
    end
    local T = i:AddButton({ Text = "\240\159\154\168 Rejoin Server", Func = function()
        if Z.can_teleport_usingbuttons == false then return end
        VJ()
    end })
    i:AddDivider()
    i:AddLabel({ Text =
    "Hop to new server: Only works if you have Anti Spam disabled in delta. You must not be running and scripts to disable it in delta settings.", DoesWrap = true })
    local d = i:AddButton({ Text = "Hop Server", Func = function()
        if Z.can_teleport_usingbuttons == false then return end
        q.Hop.HopToNewServer()
    end })
    task.spawn(function() while true do
            task.wait(10)
            Z.can_teleport_usingbuttons = true
            break
        end end)
end
cJ()
Z.TeleportUi = function()
    local G = o()
    local V = jJ:AddTab({ Name = "<font color=\'#FFAA00\'>Teleport</font>", Description = "Game Server Version: " .. G, Icon =
    "helicopter" })
    local y = V:AddLeftGroupbox("Teleport Job Id", "helicopter", false)
    if y then
        y:AddLabel({ Text =
        "<b><font color=\'#7CFF8A\'>\240\159\148\151 Job ID Teleport</font></b>\n<font color=\'#D7E1FF\'>Paste the Job ID, then click teleport.</font>\n<font color=\'#FFB86B\'>\226\154\160\239\184\143 Anti Spam must be disabled in Delta settings for this to work.</font>", DoesWrap = true })
        local G
        local V = ""
        local function j()
            local G = tostring(V or "")
            if G == "" then G = "empty" end
            return string.format(
            "<b><font color=\'#B084FF\'>\240\159\167\169 Job ID </font></b><font color=\'#00FFFF\'>%s</font>", G)
        end
        G = y:AddInput("input_server_code",
            { Text = j(), Default = "", Numeric = false, AllowEmpty = true, Finished = false, ClearTextOnFocus = true, Placeholder =
            "JobId", Tooltip = "Paste Job ID here", Callback = function(y)
                V = tostring(y or "")
                G:SetText(j())
            end })
        y:AddButton({ Text = "\240\159\154\128 <font color=\'#7CFF8A\'><b>Teleport</b></font>", Func = function()
            if V == "" then
                Z.Notify("\226\157\140 Enter Job ID first", 3)
                return
            end
            q.Hop.HopToNewServerUsingJobid(V)
            Z.Notify("\240\159\148\151 Teleport requested", 3)
        end })
        y:AddDivider()
        y:AddButton({ Text = "\240\159\147\140 Copy Current Job ID", Func = function()
            local G = tostring(game.JobId or "")
            if G == "" then
                Z.Notify("\226\157\140 Current Job ID not found", 3)
                return
            end
            J.CopyToClipBoard(G)
        end })
    end
end
Z.TeleportUi()
Z.DynamicScanButtons = Z.DynamicScanButtons or {}
Z.BuyListUi = function()
    local G = jJ:AddTab({ Name = "Manual Buy", Description = "Buy listings manually", Icon = "sparkles" })
    local V = G:AddLeftGroupbox("Target Pets", "house", false)
    local j = G:AddRightGroupbox("\240\159\155\146 Scan Results", "list", false)
    if V then
        V:AddLabel({ Text = "\226\154\160\239\184\143 Select pets to scan for.", DoesWrap = true })
        local G
        G = V:AddValueDropdown("buypettslistx",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\166\150 Targets", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.scantargetpets = G
                W()
            end })
        local i = table.clone(Z.all_pets_names_list or {})
        table.sort(i,
            function(G, V)
                local y = J.GetPetDetails(G)
                local Z = J.GetPetDetails(V)
                local j = y and J.RarityLayoutMap[tostring(y.rarity or "")] or 0
                local i = Z and J.RarityLayoutMap[tostring(Z.rarity or "")] or 0
                if j ~= i then return j > i end
                return tostring(G) < tostring(V)
            end)
        local c = {}
        for G, V in ipairs(i) do
            local y = J.GetPetDetails(V)
            local Z = string.format("%s", V)
            if y then
                local G, j = J.RarityToColor(y.rarity or "")
                local i, c = J.EggToColor(y.eggname or "")
                Z = string.format(
                "<stroke color=\'#000000\' sizing=\'fixed\' thickness=\'1\' transparency=\'0.45\' joins=\'round\'><b><font color=\'#FFFFFF\'>%s</font></b> <font color=\'#AAB4C2\'>[</font></stroke><stroke color=\'%s\' sizing=\'fixed\' thickness=\'1\' transparency=\'0.35\' joins=\'round\'><font color=\'%s\'>%s</font></stroke><stroke color=\'#000000\' sizing=\'fixed\' thickness=\'1\' transparency=\'0.45\' joins=\'round\'><font color=\'#AAB4C2\'>]</font> </stroke><stroke color=\'%s\' sizing=\'fixed\' thickness=\'1\' transparency=\'0.50\' joins=\'round\'><b><font color=\'%s\'>%s</font></b></stroke>",
                    tostring(V), c, i, tostring(y.eggname or "Unknown Egg"), j, G, tostring(y.rarity or "Unknown"))
            end
            local j = { Text = Z, Value = V }
            table.insert(c, j)
        end
        G:SetValues(c)
        G:SetValue(r.scantargetpets)
        local T = V:AddButton({ Text = "Select All", Func = function()
            r.scantargetpets = {}
            for G, V in ipairs(Z.all_pets_names_list) do r.scantargetpets[V] = true end
            G:SetValue(r.scantargetpets, true)
            W()
        end })
        T:AddButton({ Text = "<font color=\'#FF3D17\'>Remove All</font>", Func = function()
            r.scantargetpets = {}
            G:SetValue(r.scantargetpets)
            W()
        end })
        local d = function()
            local G = string.format("\226\156\168 MinBaseWeight <font color=\'#47FF40\'>%s</font>", r.manual_min_weight)
            return G
        end
        local g
        g = V:AddInput("input_distancetMinBaseWeight",
            { Text = d(), Default = r.manual_min_weight, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Filters to show minimum base weight", Callback = function(G)
                local V = f(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    g:SetValue(tostring(r.manual_min_weight))
                    return
                end
                r.manual_min_weight = V
                W()
                g:SetText(d())
            end })
        local function E()
            for G, V in ipairs(Z.DynamicScanButtons) do if V.Holder and typeof(V.Holder) == "Instance" then V.Holder
                        :Destroy() end end
            Z.DynamicScanButtons = {}
            if j.Resize then j:Resize() end
        end
        local a = 67
        local H = function()
            E()
            local G = r.manual_showbaseweight
            local V = u.ScanForSpecificPet()
            if #V > 0 then
                for V, i in ipairs(V) do
                    local c = i.pet
                    if string.len(c) > a then c = string.sub(c, 1, a) .. "." end
                    local T = i.visualweight
                    if G == true then T = i.weight end
                    local d = ""
                    local u = J.FormatHugeNumbers(i.price, 2)
                    local g = i.level or 0
                    local E = i.fav
                    if E then d = "\226\157\164\239\184\143" end
                    local H = string.format(
                    "%s <font color=\'#9B6DFF\'>Lv.%s</font> <font color=\'#4DA6C8\'>%.2fKG</font> <font color=\'#CFCFCF\'>%s</font> <font color=\'#6FAF5F\'>\240\159\159\162%s</font>",
                        d, g, T, c, tostring(u))
                    local r = j:AddButton({ Text = H, Func = function()
                        local G = string.format("Attempting to buy %s for %s", i.pet, tostring(i.price))
                        y:Notify(G, 3)
                        local V = q.finder.BuyListing(i.owner, i.id, i.price)
                        if V then newBtn:SetVisible(false) end
                    end })
                    table.insert(Z.DynamicScanButtons, r)
                end
                if j.Resize then j:Resize() end
            else
                local G = j:AddButton({ Text = "\226\157\140 No matching pets found", Func = function() end })
                table.insert(Z.DynamicScanButtons, G)
            end
        end
        V:AddToggle("manualscanshowbaseweight",
            { Text = "\240\159\143\139\239\184\143 Show BaseWeight", Default = r.manual_showbaseweight, Tooltip =
            "Shows base weight or visual weight", Callback = function(G)
                r.manual_showbaseweight = G
                H()
                W()
            end })
        V:AddButton({ Text = "\240\159\148\141 Scan Booths", Func = function() H() end })
        V:AddButton({ Text = "\240\159\154\128 Find Server", Func = function()
            local G = Z.all_pets_names_list_keyval
            if next(r.scantargetpets) ~= nil then G = r.scantargetpets end
            u.RandomFindAndTeleport(G)
        end })
        V:AddSpacer(10)
    end
end
Z.BuyListUi()
Z.BoothListUi = function()
    local G = jJ:AddTab({ Name = "Booth Setup", Description = "Booth Settings", Icon = "sparkles" })
    local V = G:AddLeftGroupbox("Booth", "house", false)
    local j = G:AddRightGroupbox("Display Pet", "cat")
    local i = G:AddRightGroupbox("Display Fruit", "apple")
    if i then
        local G
        G = i:AddDropdown("dd_fruitlistxshowcase",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\141\137 Showcase Fruit", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if G == nil then return end
                r.showcase.fruit_list = G
                W()
            end })
        G:SetValues(L(l))
        G:SetValue(r.showcase.fruit_list)
    end
    if j then
        j:AddLabel({ Text = "\226\154\160\239\184\143 Will show highest KG pet of this type selected here.", DoesWrap = true })
        local G
        G = j:AddDropdown("dd_displaypets",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\166\150 ShowCase Pets", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.showcase.pet_list = G
                W()
            end })
        G:SetValues(Z.all_pets_names_list)
        G:SetValue(r.showcase.pet_list)
    end
    if V then
        local G = V:AddDropdown("dd_skin_list",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\167\176 Booth Skins", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.skin_booth_list = G
                W()
            end })
        G:SetValues(J.GetAllUnlockedBooths())
        G:SetValue(r.skin_booth_list)
        V:AddDivider()
        V:AddToggle("toggleAutoClaimEquip",
            { Text = "\226\154\148\239\184\143Claim Booth", Default = r.auto_claim_booth, Tooltip = "Auto claim booth", Callback = function(
                G)
                r.auto_claim_booth = G
                W()
            end })
        V:AddToggle("toggleAutoClaimEquipPet",
            { Text = "\240\159\166\150Equip Pet/Fruit", Default = r.auto_equip_big_pet, Tooltip = "Equips a pet or fruit", Callback = function(
                G)
                r.auto_equip_big_pet = G
                W()
            end })
        V:AddToggle("toggleAutoClaimEquipBooth",
            { Text = "\240\159\147\161Teleport To Booth", Default = r.teleport_to_booth, Tooltip =
            "Teleports behind the booth", Callback = function(G)
                r.teleport_to_booth = G
                W()
            end })
        local Z = function()
            local G = string.format("\226\134\148\239\184\143 Distance <font color=\'#47FF40\'>%s</font>",
                r.teleport_distance)
            return G
        end
        local j
        j = V:AddInput("input_distancetp",
            { Text = Z(), Default = r.teleport_distance, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Distance behind the booth", Callback = function(G)
                local V = z(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    j:SetValue(tostring(r.teleport_distance))
                    return
                end
                r.teleport_distance = V
                W()
                j:SetText(Z())
            end })
        V:AddToggle("togglepromotion",
            { Text = "\240\159\151\168\239\184\143<font color=\'#00FF9B\'>Promote Listings</font>", Default = r
            .auto_promote_listing, Tooltip = "Sends promotion messages randomly.", Callback = function(G)
                r.auto_promote_listing = G
                W()
            end })
        V:AddToggle("toglleJoinnewserver",
            { Text = "\240\159\147\161Join New Server", Default = r.joinnewserver, Tooltip =
            "Joins new server every X min", Callback = function(G)
                r.joinnewserver = G
                W()
            end })
        V:AddDivider()
        local i = function()
            local G = string.format("\226\143\179 Mins <font color=\'#D354FF\'>%sm</font>", r.rejoin_mins)
            return G
        end
        local c
        c = V:AddInput("input_rejoin",
            { Text = i(), Default = r.rejoin_mins, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 3", Tooltip = "Rejoin mins", Callback = function(G)
                local V = z(G)
                if not V or V < 3 then
                    y:Notify("Invalid mins (Minimum 3): " .. G, 3)
                    c:SetValue(tostring(r.rejoin_mins))
                    return
                end
                r.rejoin_mins = V
                W()
                c:SetText(i())
            end })
    end
end
Z.BoothListUi()
Z.PetListUI = function()
    local G = jJ:AddTab({ Name = "Listings" .. iJ, Description = "Create and manage listings.", Icon = "sparkles" })
    local V = G:AddLeftGroupbox("\240\159\146\176 <font color=\'#FFB833\'>Pet Listing</font> \240\159\146\176", "gift")
    local j = G:AddLeftGroupbox("\240\159\148\180 <font color=\'#FFB833\'>Remove Pet Listing</font>", "gift")
    local i = G:AddRightGroupbox("\240\159\141\137 <font color=\'#FFB833\'>Fruit Listing</font> \240\159\146\176",
        "grape")
    local J = G:AddRightGroupbox("\240\159\148\180 <font color=\'#FFB833\'>Remove Fruits Listings</font>", "gift")
    local T = G:AddLeftGroupbox("Options", "badge-info", false)
    if T then
        local G = nil
        T:AddLabel({ Text =
        "\226\154\160\239\184\143 Fixes easter bug. Equips fruits to correct the KG and unequips quickly.", DoesWrap = true })
        G = T:AddToggle("fixbugeastertoggle",
            { Text = "\226\154\170<font color=\'#00FF9B\'>Equip Pets Auto</font>", Default = r.fixkgbug_easter, Tooltip =
            "Equips and unequip pets to fix easter kg bug", DisabledTooltip = "Premium Feature", Callback = function(G)
                r.fixkgbug_easter = G
                W()
            end })
        if not Z.GetCheckIfPro() then G:SetDisabled(true) end
    end
    if J then
        local G = nil
        J:AddLabel({ Text = "\226\154\160\239\184\143 Removes all fruit listings.", DoesWrap = true })
        G = J:AddButton({ Text = "\240\159\159\162 Start Removing", DisabledTooltip = "Premium Feature", Func = function()
            u.StartRemoveListingFrutis() end })
        J:AddButton({ Text = "\240\159\148\180 Stop Removing", Func = function() u.StartRemoveListingFrutis() end })
        if not Z.GetCheckIfPro() then G:SetDisabled(true) end
    end
    if i then
        local G
        G = i:AddDropdown("dd_fruitlist",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\141\137 Fruit Types", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if G == nil then return end
                r.sellfruit.fruit_list_allow = G
                W()
            end })
        G:SetValues(L(l))
        G:SetValue(r.sellfruit.fruit_list_allow)
        local V = i:AddButton({ Text = "Select All", Tooltip = "Selects all plants on the list.", Func = function()
            local V = S(l)
            if #V > 0 then r.sellfruit.fruit_list_allow = {} end
            for G, V in ipairs(V) do r.sellfruit.fruit_list_allow[V] = true end
            G:SetValue(r.sellfruit.fruit_list_allow, true)
            W()
        end })
        V:AddButton({ Text = "<font color=\'#ED2A00\'>DeSelect All</font>", Tooltip =
        "Deselects all the plants on the list", Func = function()
            r.sellfruit.fruit_list_allow = {}
            G:SetValue(r.sellfruit.fruit_list_allow, true)
            W()
        end })
        i:AddDivider()
        local j = i:AddDropdown("_shovelwhitelistfruits",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\140\136 Mutations", Tooltip =
            "Fruits matching will be listed.", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(G)
                if G == nil then return end
                r.sellfruit.fruit_mutations = G
                W()
            end })
        j:SetValues(L(b))
        j:SetValue(r.sellfruit.fruit_mutations)
        local c = function()
            local G = string.format("Min Weight <font color=\'#47FF40\'>%s KG</font>", r.sellfruit.fruit_min_weight)
            return G
        end
        local J = function()
            local G = string.format("Max Weight <font color=\'#FF4065\'>%s KG</font>", r.sellfruit.fruit_max_weight)
            return G
        end
        local T
        T = i:AddInput("input_min_weightfruitx",
            { Text = c(), Default = r.sellfruit.fruit_min_weight, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify minimum Weight", Callback = function(G)
                local V = f(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    T:SetValue(tostring(r.sellfruit.fruit_min_weight))
                    return
                end
                if V > r.sellfruit.fruit_max_weight then
                    y:Notify("Can\'t be more than max weight", 3)
                    T:SetValue(tostring(r.sellfruit.fruit_min_weight))
                    return
                end
                r.sellfruit.fruit_min_weight = V
                W()
                T:SetText(c())
            end })
        local d
        d = i:AddInput("input_max_weightfruit",
            { Text = J(), Default = r.sellfruit.fruit_max_weight, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify maximum Weight", Callback = function(G)
                local V = f(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    d:SetValue(tostring(r.sellfruit.fruit_max_weight))
                    return
                end
                if V < r.sellfruit.fruit_min_weight then
                    y:Notify("Can\'t be lower than min weight ", 3)
                    d:SetValue(tostring(r.sellfruit.fruit_max_weight))
                    return
                end
                r.sellfruit.fruit_max_weight = V
                W()
                d:SetText(J())
            end })
        local u = function()
            local G = string.format("\240\159\159\162 Tokens <font color=\'#FF4065\'>%s</font>", r.sellfruit.fruit_price)
            return G
        end
        local q
        q = i:AddInput("input_tokenpricefruit",
            { Text = u(), Default = r.sellfruit.fruit_price, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Price for this pet", Callback = function(G)
                local V = z(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    q:SetValue(tostring(r.sellfruit.fruit_price))
                    return
                end
                r.sellfruit.fruit_price = V
                W()
                q:SetText(u())
            end })
        local g = i:AddToggle("toggleAllowFavlistfruit",
            { Text = "\226\157\164\239\184\143 Auto Unfav", Default = r.sellfruit.fruit_auto_fav, Tooltip =
            "Auto Unfav and list", Callback = function(G)
                r.sellfruit.fruit_auto_fav = G
                W()
            end })
        i:AddDivider()
        local E = nil
        E = i:AddToggle("toggleEnableGifttingfruit",
            { Text = "\226\154\161Enable Fruit-List", Default = r.sellfruit.is_fruit_enabled, Tooltip =
            "When enabled it lists items based on filters", DisabledTooltip = "Premium Feature", Callback = function(G) if r.auto_list_enabled and G == true then
                    E:SetValue(r.sellfruit.is_fruit_enabled)
                    y:Notify("\226\157\140 Pet listing is active. Turn it off to list fruits")
                    return
                else
                    r.sellfruit.is_fruit_enabled = G
                    W()
                end end })
        if not Z.GetCheckIfPro() then E:SetDisabled(true) end
    end
    if j then
        j:AddLabel({ Text = "\226\154\160\239\184\143 Removes all listings.", DoesWrap = true })
        local G
        G = j:AddDropdown("ggpetsremovefilter",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\166\150 Pets [Empty] = all", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.removelistingpetsfilter = G
                W()
            end })
        G:SetValues(Z.all_pets_names_list)
        G:SetValue(r.removelistingpetsfilter)
        j:AddDivider()
        local V = nil
        V = j:AddButton({ Text = "\240\159\159\162 Start Removing", DisabledTooltip = "Premium Feature", Func = function()
            u.StartRemoveListing() end })
        j:AddButton({ Text = "\240\159\148\180 Stop Removing", Func = function() u.StopRemoveListing() end })
        if not Z.GetCheckIfPro() then V:SetDisabled(true) end
    end
    if V then
        H.lbl_status_listing = V:AddLabel({ Text = "Status: Idle ", DoesWrap = true })
        local G
        G = V:AddDropdown("dd_giftpets_allowlist",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\166\150 Pets", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.listing_petlist = G
                W()
            end })
        G:SetValues(Z.all_pets_names_list)
        G:SetValue(r.listing_petlist)
        local j = V:AddButton({ Text = "Select All", Func = function()
            r.listing_petlist = {}
            for G, V in ipairs(Z.all_pets_names_list) do r.listing_petlist[V] = true end
            G:SetValue(r.listing_petlist)
            W()
        end })
        j:AddButton({ Text = "<font color=\'#FF3D17\'>Remove All</font>", Func = function()
            r.listing_petlist = {}
            G:SetValue(r.listing_petlist)
            W()
        end })
        local i = V:AddDropdown("dd_giftpet_mut",
            { Values = {}, Default = {}, Multi = true, Searchable = true, MaxVisibleDropdownItems = 10, Text =
            "\240\159\167\172 Mutations", Callback = function(G)
                if G == nil then return end
                r.listing_mutations = G
                W()
            end })
        i:SetValues(S(c.AllMutationsList))
        i:SetValue(r.listing_mutations)
        local J = function()
            local G = string.format("Min Level <font color=\'#47FF40\'>%s</font>", r.listing_min_level)
            return G
        end
        local T = function()
            local G = string.format("Max Level <font color=\'#FF4065\'>%s</font>", r.listing_max_level)
            return G
        end
        local d
        d = V:AddInput("input_min_age",
            { Text = J(), Default = r.listing_min_level, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify minimum Pet Age", Callback = function(G)
                local V = z(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    d:SetValue(tostring(r.listing_min_level))
                    return
                end
                if V > r.listing_max_level then
                    y:Notify("Can\'t be more than max age ", 3)
                    d:SetValue(tostring(r.listing_min_level))
                    return
                end
                r.listing_min_level = V
                W()
                d:SetText(J())
            end })
        local u
        u = V:AddInput("input_max_age",
            { Text = T(), Default = r.listing_max_level, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify maximum Pet Age", Callback = function(G)
                local V = z(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    u:SetValue(tostring(r.listing_max_level))
                    return
                end
                if V < r.listing_min_level then
                    y:Notify("Can\'t be lower than min age ", 3)
                    u:SetValue(tostring(r.listing_max_level))
                    return
                end
                r.listing_max_level = V
                W()
                u:SetText(T())
            end })
        local q = function()
            local G = string.format("Min BaseWeight <font color=\'#47FF40\'>%s</font>", r.listing_min_weight)
            return G
        end
        local g = function()
            local G = string.format("Max BaseWeight <font color=\'#FF4065\'>%s</font>", r.listing_max_weight)
            return G
        end
        local E
        E = V:AddInput("input_min_weight",
            { Text = q(), Default = r.listing_min_weight, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify minimum Pet BaseWeight", Callback = function(G)
                local V = f(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    E:SetValue(tostring(r.listing_min_weight))
                    return
                end
                if V > r.listing_max_weight then
                    y:Notify("Can\'t be more than max weight", 3)
                    E:SetValue(tostring(r.listing_min_weight))
                    return
                end
                r.listing_min_weight = V
                W()
                E:SetText(q())
            end })
        local a
        a = V:AddInput("input_max_weight",
            { Text = g(), Default = r.listing_max_weight, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Specify maximum BaseWeight", Callback = function(G)
                local V = f(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    a:SetValue(tostring(r.listing_max_weight))
                    return
                end
                if V < r.listing_min_weight then
                    y:Notify("Can\'t be lower than min weight ", 3)
                    a:SetValue(tostring(r.listing_max_weight))
                    return
                end
                r.listing_max_weight = V
                W()
                a:SetText(g())
            end })
        local Y = function()
            local G = string.format("\240\159\159\162 Tokens <font color=\'#FF4065\'>%s</font>", r.listing_token_price)
            return G
        end
        local e
        e = V:AddInput("input_tokenprice",
            { Text = Y(), Default = r.listing_token_price, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Tooltip = "Price for this pet", Callback = function(G)
                local V = z(G)
                if not V or V <= 0 then
                    y:Notify("Invalid: " .. G, 3)
                    e:SetValue(tostring(r.listing_token_price))
                    return
                end
                r.listing_token_price = V
                W()
                e:SetText(Y())
            end })
        local s = V:AddToggle("toggleAllowFavlist",
            { Text = "\226\157\164\239\184\143 Auto Unfav", Default = r.listing_auto_unfav, Tooltip =
            "Auto Unfav and list", Callback = function(G)
                r.listing_auto_unfav = G
                W()
            end })
        V:AddDivider()
        local N = nil
        N = V:AddToggle("toggleEnableGiftting",
            { Text = "\226\154\161Enable AutoList", Default = r.auto_list_enabled, Tooltip =
            "When enabled it lists items based on filters", DisabledTooltip = "Premium Feature", Callback = function(G) if r.sellfruit.is_fruit_enabled and G == true then
                    N:SetValue(r.auto_list_enabled)
                    y:Notify("\226\157\140 Fruit listing is active. Turn it off to list pets")
                    return
                else
                    r.auto_list_enabled = G
                    W()
                end end })
        if not Z.GetCheckIfPro() then N:SetDisabled(true) end
    end
end
Z.PetListUI()
Z.GetPetsSelectUi = function()
    if not H.lbl_pet_details then return end
    local G = ""
    local V = r.finder.find_petlist or {}
    local y = r.finder.find_enabled
    for Z, j in pairs(r.find_settings) do
        if not j.enabled then continue end
        local i = j.weight_min or 0
        local c = j.weight_max or 0
        local J = j.price or 0
        local T = j.min_level or 1
        local d = j.max_level or 125
        local u = j.max_keep or 300
        local q = j.is_weightagebased
        local g = j.big_weight_max
        local E = y and V[Z] == true
        local a = E and "\240\159\148\141" or "\240\159\146\164"
        local H
        if q then H = string.format(
            "%s <font color=\'#FFA500\'><b>%s</b></font> <font color=\'#FF66FF\'>[BigW: %skg+]</font> <font color=\'#AAAAAA\'>(keep:%s)</font> <font color=\'#00FF00\'>\240\159\159\162%s</font>\n",
                a, Z, tostring(g), tostring(u), tostring(J)) else H = string.format(
            "%s <font color=\'#FFA500\'><b>%s</b></font> <font color=\'#66CCFF\'>[Lv. %s-%s]</font> <font color=\'#AAAAAA\'>(%s-%skg)</font> <font color=\'#00FF00\'>\240\159\159\162%s</font>\n",
                a, Z, tostring(T), tostring(d), tostring(i), tostring(c), tostring(J)) end
        G = G .. H
    end
    H.lbl_pet_details:SetText(G)
end
Z.FindUiTab = function()
    local G = jJ:AddTab({ Name = "Snipe Pets" .. iJ, Description = "Find pets", Icon = "sparkles" })
    local V = G:AddLeftGroupbox("<font color=\'#FFFFFF\'>Pet Filter</font>", "cat", false)
    local j = G:AddRightGroupbox("\240\159\142\175 <font color=\'#FFB833\'>Pets</font>", "gift", false)
    local i = G:AddRightGroupbox("<font color=\'#FFB833\'>Pets Filtered</font>", "gift", false)
    if V then
        local G = nil
        local j
        local i
        local c
        local J
        local T
        local d
        local u
        local q
        local g
        local function E(G) if not r.find_settings[G] then r.find_settings[G] = { enabled = false, weight_min = .86, weight_max = 12.86, min_level = 1, max_level = 125, price = 3, max_keep = 300, is_weightagebased = false, big_weight_max = 112 } else
                if not r.find_settings[G].big_weight_max then
                    r.find_settings[G].is_weightagebased = false
                    r.find_settings[G].big_weight_max = 112
                end
                if not r.find_settings[G].max_keep then r.find_settings[G].max_keep = 300 end
                if not r.find_settings[G].min_level then
                    r.find_settings[G].min_level = 1
                    r.find_settings[G].max_level = 125
                end
            end end
        local function a(G)
            if not G then return end
            E(G)
            local V = r.find_settings[G]
            j:SetValue(V.enabled)
            q:SetValue(V.is_weightagebased)
            i:SetValue(tostring(V.weight_min))
            i:SetText(string.format("\240\159\159\162 Min BaseWeight <font color=\'#FF4065\'>%s</font>", V.weight_min))
            c:SetValue(tostring(V.weight_max))
            c:SetText(string.format("\240\159\148\180 Max BaseWeight <font color=\'#FF4065\'>%s</font>", V.weight_max))
            J:SetValue(tostring(V.min_level))
            J:SetText(string.format("\226\154\170 Min Lv. <font color=\'#FF4065\'>%s</font>", V.min_level))
            T:SetValue(tostring(V.max_level))
            T:SetText(string.format("\240\159\159\161 Max Lv. <font color=\'#FF4065\'>%s</font>", V.max_level))
            d:SetValue(tostring(V.price))
            d:SetText(string.format("\240\159\146\176 Tokens <font color=\'#FF4065\'>%s</font>", V.price))
            u:SetValue(tostring(V.max_keep))
            u:SetText(string.format("\226\154\160\239\184\143Pet Count Limit <font color=\'#FF4065\'>%s</font>",
                V.max_keep))
            g:SetValue(tostring(V.big_weight_max))
            g:SetText(string.format("\226\156\168Visual Weight <font color=\'#FFF603\'>%s KG</font>", V.big_weight_max))
        end
        V:AddLabel({ Text = "Select a pet to edit its specific filters.", DoesWrap = true })
        local H = V:AddDropdown("dd_edit_specific_pet",
            { Values = Z.all_pets_names_list, Default = 1, Multi = false, Text = "\240\159\144\190 Select Pet", Searchable = true, Callback = function(
                V)
                G = V
                a(G)
            end })
        V:AddDivider()
        j = V:AddToggle("Toggle_Alt_EnablePet",
            { Text = "\226\154\161 Enable Pet", Default = false, Tooltip = "Toggle finding for the pet selected above", Callback = function(
                V)
                if not G then return end
                E(G)
                r.find_settings[G].enabled = V
                W()
            end })
        i = V:AddInput("Input_Alt_MinWeight",
            { Text = "\240\159\159\162 Min BaseWeight", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 0.86", Callback = function(V)
                if not G then return end
                local Z = f(V)
                local j = tonumber(r.find_settings[G].weight_min) or 0
                local c = tonumber(r.find_settings[G].weight_max) or 12
                if not Z or Z < 0 then
                    y:Notify("Invalid: " .. V, 3)
                    if j > 0 then i:SetValue(tostring(j)) end
                    return
                end
                if Z > c then
                    y:Notify("Minimum weight can\'t be more than max weight", 3)
                    return
                end
                r.find_settings[G].weight_min = Z
                W()
                i:SetText(string.format("\240\159\159\162 Min BaseWeight <font color=\'#FF4065\'>%s</font>", Z))
            end })
        c = V:AddInput("Input_Alt_MaxWeight",
            { Text = "\240\159\148\180 Max BaseWeight", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 2.86", Callback = function(V)
                if not G then return end
                local Z = f(V)
                local j = tonumber(r.find_settings[G].weight_min) or 0
                local i = tonumber(r.find_settings[G].weight_max) or 12
                if not Z or Z < .1 then
                    y:Notify("Invalid: " .. V, 3)
                    if i > .1 then c:SetValue(tostring(r.find_settings[G].weight_max)) end
                    return
                end
                if Z < j then
                    y:Notify("Maximum weight can\'t be less than min weight ", 3)
                    return
                end
                r.find_settings[G].weight_max = Z
                W()
                c:SetText(string.format("\240\159\148\180 Max BaseWeight <font color=\'#FF4065\'>%s</font>", Z))
            end })
        J = V:AddInput("input_minlevel_filter",
            { Text = "\226\154\170 Min Lv.", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 1", Callback = function(V)
                if not G then return end
                local Z = z(V)
                if not Z or Z < 0 then
                    y:Notify("Invalid: " .. V, 3)
                    J:SetValue(tostring(r.find_settings[G].min_level))
                    return
                end
                local j = tonumber(r.find_settings[G].max_level) or 125
                if Z > j then
                    y:Notify("Can\'t be more than maximum level ", 3)
                    J:SetValue(tostring(r.find_settings[G].min_level))
                    return
                end
                r.find_settings[G].min_level = Z
                W()
                J:SetText(string.format("\226\154\170 Min Lv. <font color=\'#FF4065\'>%s</font>", Z))
            end })
        T = V:AddInput("input_maxlevel_filter",
            { Text = "\240\159\159\162 Max Lv.", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 100", Callback = function(V)
                if not G then return end
                local Z = z(V)
                if not Z or Z < 0 then
                    y:Notify("Invalid: " .. V, 3)
                    T:SetValue(tostring(r.find_settings[G].max_level))
                    return
                end
                local j = tonumber(r.find_settings[G].min_level) or 1
                if Z < j then
                    y:Notify("Can\'t be less than minimum level ", 3)
                    T:SetValue(tostring(r.find_settings[G].max_level))
                    return
                end
                r.find_settings[G].max_level = Z
                W()
                T:SetText(string.format("\240\159\159\162 Max Lv. <font color=\'#FF4065\'>%s</font>", Z))
            end })
        d = V:AddInput("Input_Alt_Price",
            { Text = "\240\159\146\176 Tokens", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
            "e.g 3", Callback = function(V)
                if not G then return end
                local Z = z(V)
                if not Z or Z <= 0 then
                    y:Notify("Invalid: " .. V, 3)
                    d:SetValue(tostring(r.find_settings[G].price))
                    return
                end
                r.find_settings[G].price = Z
                W()
                d:SetText(string.format("\240\159\146\176 Tokens <font color=\'#FF4065\'>%s</font>", Z))
            end })
        u = V:AddInput("input_maxkeeppetlimit",
            { Text = "\226\154\160\239\184\143Pet Count Limit", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Tooltip =
            "Will not buy anymore if your backpack has this amount.", Placeholder = "e.g 100", Callback = function(V)
                if not G then return end
                local Z = z(V)
                if not Z or Z < 0 then
                    y:Notify("Invalid: " .. V, 3)
                    u:SetValue(tostring(r.find_settings[G].max_keep))
                    return
                end
                r.find_settings[G].max_keep = Z
                W()
                u:SetText(string.format("\226\154\160\239\184\143Pet Count Limit <font color=\'#FF4065\'>%s</font>", Z))
            end })
        V:AddDivider()
        V:AddDivider()
        V:AddDivider()
        V:AddLabel({ Text =
        "\226\132\185\239\184\143 When this is enabled BaseWeight and Levels are ignored. Instead it will snipe based on the visual weight you see! example 63.45KG", DoesWrap = true })
        V:AddDivider()
        g = V:AddInput("input_bigweightmax",
            { Text = "Visual Weight", Default = 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Tooltip =
            "Weight based on age", Placeholder = "e.g 100kg", Callback = function(V)
                if not G then return end
                local Z = f(V)
                if not Z or Z < 0 then
                    y:Notify("Invalid: " .. V, 3)
                    g:SetValue(tostring(r.find_settings[G].big_weight_max))
                    return
                end
                r.find_settings[G].big_weight_max = Z
                W()
                g:SetText(string.format("\226\156\168Visual Weight <font color=\'#FF4065\'>%s KG</font>", Z))
            end })
        q = V:AddToggle("toggleBigWeight_enabled",
            { Text = "\240\159\159\162Enable Visual Weight", Default = false, Tooltip =
            "When this is enabled. system will not use base weight or levels. Instead will use the weight based on age or what you can see on the pet.", Callback = function(
                V)
                if not G then return end
                E(G)
                r.find_settings[G].is_weightagebased = V
                W()
            end })
        if Z.all_pets_names_list and #Z.all_pets_names_list > 0 then
            G = Z.all_pets_names_list[1]
            a(G)
        end
    end
    if i then
        i:AddLabel({ Text = "\226\132\185\239\184\143 Only pets filtered will be purchased by the snipe system.", DoesWrap = true })
        i:AddDivider()
        H.lbl_pet_details = i:AddLabel({ Text = "-", DoesWrap = true })
    end
    if j then
        j:AddLabel({ Text = "Please make sure you have selected pet filters on the left side.", DoesWrap = true })
        local G
        G = j:AddDropdown("dd_find_petlist",
            { Values = {}, Default = {}, Multi = true, Text = "\240\159\166\150 Find Pets", Searchable = true, MaxVisibleDropdownItems = 10, Changed = function(
                G)
                if not G then return end
                r.finder.find_petlist = G
                W()
            end })
        G:SetValues(Z.all_pets_names_list)
        G:SetValue(r.finder.find_petlist)
        local V = j:AddButton({ Text = "Select All", Func = function()
            r.finder.find_petlist = {}
            for G, V in ipairs(Z.all_pets_names_list) do r.finder.find_petlist[V] = true end
            G:SetValue(r.finder.find_petlist)
            W()
        end })
        V:AddButton({ Text = "<font color=\'#FF3D17\'>Remove All</font>", Func = function()
            r.finder.find_petlist = {}
            G:SetValue(r.finder.find_petlist)
            W()
        end })
        j:AddDivider()
        local y
        y = j:AddToggle("toggleEnableFinder",
            { Text = "\226\154\161Enable Finder", Default = r.finder.find_enabled, DisabledTooltip = "Premium Only", Tooltip =
            "When enabled it finds targets", Callback = function(G)
                r.finder.find_enabled = G
                W()
            end })
        local i
        i = j:AddToggle("toggletsameserver",
            { Text = "\240\159\147\161Current Server Buying Mode", Default = r.sameserver_buyonly, DisabledTooltip =
            "Premium Only", Tooltip =
            "When enabled it will only scan and buy on current server and will never teleport. [Finder must be enable for this to work]", Callback = function(
                G)
                r.sameserver_buyonly = G
                W()
            end })
        if not Z.GetCheckIfPro() then
            y:SetDisabled(true)
            i:SetDisabled(true)
        end
    end
    local c = false
    if c then
        local function V(G)
            if not G then return "#FFFFFF" end
            return string.format("#%02X%02X%02X", G.R * 255, G.G * 255, G.B * 255)
        end
        for Z, j in ipairs(J.EggDataSet) do
            local i = j.name
            local c = j.rarity
            local J = j.pets
            local T = j.color
            local d = V(T)
            local u = string.format("<font color=\"%s\">%s</font> <font color=\"#AAAAAA\">[%s]</font>", d, i, c)
            local q = G:AddLeftGroupbox(u)
            for G, V in ipairs(J) do
                task.wait()
                local Z = V.petname
                if not r.find_settings[Z] then r.find_settings[Z] = { enabled = false, weight_min = .86, weight_max = 12.86, price = 3 } end
                local j = q:AddToggle("Toggle_" .. (i .. ("_" .. Z)),
                    { Text = Z, Default = r.find_settings[Z].enabled, Tooltip = "Filter: " .. Z, Callback = function(G)
                        r.find_settings[Z].enabled = G
                        W()
                    end })
                local c = q:AddDependencyBox()
                c:SetupDependencies({ { j, true } })
                local J = function()
                    local G = r.find_settings[Z].weight_min or 0
                    local V = string.format("\240\159\159\162 Min Weight <font color=\'#FF4065\'>%s</font>", G)
                    return V
                end
                local T
                T = c:AddInput("Min_" .. Z,
                    { Text = J(), Default = r.find_settings[Z].weight_min or 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
                    "e.g 1", Tooltip = "Minimum weight", Callback = function(G)
                        local V = f(G)
                        if not V or V < 0 then
                            y:Notify("Invalid: " .. G, 3)
                            T:SetValue(tostring(r.find_settings[Z].weight_min))
                            return
                        end
                        r.find_settings[Z].weight_min = V
                        W()
                        T:SetText(J())
                    end })
                local d = function()
                    local G = r.find_settings[Z].weight_max or 0
                    local V = string.format("\240\159\148\180 Max Weight <font color=\'#FF4065\'>%s</font>", G)
                    return V
                end
                local u
                u = c:AddInput("Max_" .. Z,
                    { Text = d(), Default = r.find_settings[Z].weight_max or 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
                    "e.g 1", Tooltip = "Maximum weight", Callback = function(G)
                        local V = f(G)
                        if not V or V < 0 then
                            y:Notify("Invalid: " .. G, 3)
                            u:SetValue(tostring(r.find_settings[Z].weight_max))
                            return
                        end
                        r.find_settings[Z].weight_max = V
                        W()
                        u:SetText(d())
                    end })
                local g = function()
                    local G = r.find_settings[Z].price or 0
                    local V = string.format("\240\159\146\176 Tokens <font color=\'#FF4065\'>%s</font>", G)
                    return V
                end
                local E
                E = c:AddInput("Price_" .. Z,
                    { Text = g(), Default = r.find_settings[Z].price or 0, Numeric = true, AllowEmpty = true, Finished = true, ClearTextOnFocus = false, Placeholder =
                    "e.g 1", Tooltip = "Price", Callback = function(G)
                        local V = z(G)
                        if not V or V <= 0 then
                            y:Notify("Invalid: " .. G, 3)
                            E:SetValue(tostring(r.find_settings[Z].price))
                            return
                        end
                        r.find_settings[Z].price = V
                        W()
                        E:SetText(g())
                    end })
                c:AddDivider()
            end
        end
    end
end
task.spawn(function() Z.FindUiTab() end)
task.spawn(function() while true do
        task.wait(1)
        pcall(function() Z.GetPetsSelectUi() end)
    end end)
J.is_dex_loaded = false
J.LoadDexTool = function()
    if J.is_dex_loaded then return end
    local G, V = pcall(function()
        (loadstring(game:HttpGet("https://raw.githubusercontent.com/jodta/my-scripts/refs/heads/main/Dex%2B%2B/Decompiler%20Fix.lua")))()
        J.is_dex_loaded = true
    end)
end
J.is_spy_loaded = false
J.LoadSpyTool = function()
    if J.is_spy_loaded then return end
    local G, V = pcall(function()
        (loadstring(game:HttpGet("https://raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua", true)))()
        J.is_spy_loaded = true
    end)
end
Z.current_target_test = "Dog"
Z.SettingsUi = function()
    local G = jJ:AddTab({ Name = "Settings", Description = "Settings", Icon = "settings" })
    local j = G:AddLeftGroupbox("Webhook URL", "link")
    local i = G:AddRightGroupbox("Server", "settings-2")
    local c = G:AddRightGroupbox("<uc>Data</uc>", "blocks")
    local T
    if Z.dev_tools then T = G:AddLeftGroupbox("Dev Tools", "align-center-horizontal") end
    if c then
        local G = nil
        local y = ""
        local Z = c:AddDropdown("ddDatalistsdsx",
            { Values = {}, Default = {}, Multi = false, Searchable = true, MaxVisibleDropdownItems = 10, Text =
            "\240\159\148\146 Select Key", Tooltip = "Reads data based on key", Callback = function(Z)
                if Z == nil then return end
                y = Z
                local j = g.GetBigDataUsingKey(Z)
                local i = V.HttpService:JSONEncode(j)
                if G then G:SetText(i) end
            end })
        c:AddButton({ Text = "Copy", Func = function()
            if y == "" or y == nil then return end
            local G = g.GetBigDataUsingKey(y)
            local Z = V.HttpService:JSONEncode(G)
            J.CopyToClipBoard(Z)
        end })
        G = c:AddLabel({ Text = "--", DoesWrap = true })
        Z:SetValues(g.AllBigDataKeys)
    end
    if j then
        local G = "<font color=\'#EB27F5\'>\240\159\147\161 Webhook URL</font>"
        local V = j:AddInput("soldmutinputWebhook",
            { Text = G, Default = r.sold_webhook, Numeric = false, ClearTextOnFocus = false, Finished = false, Placeholder =
            "Sends webhook", Callback = function(G)
                r.sold_webhook = G
                W()
                y:Notify(" Webhook saved", 3)
            end })
    end
    if T then
        local G = T:AddButton({ Text = "DEX", Func = function() J.LoadDexTool() end })
        local V = T:AddButton({ Text = "SPY", Func = function() J.LoadSpyTool() end })
    end
    if i then i:AddToggle("toggleacuirejoin",
            { Text = "Auto Reconnect", Default = r.enable_auto_reconnect, Tooltip = "Reconnect if dc", Callback = function(
                G) r.enable_auto_reconnect = G end }) end
end
Z.SettingsUi()
local function JJ()
    local G = game:GetService("Players")
    local V = game:GetService("VirtualInputManager")
    local y = G.LocalPlayer
    local Z = y:WaitForChild("PlayerGui")
    local j = Z:FindFirstChild("FindSellerPrompt")
    if not j then return end
    local i, c = pcall(function() return j.Frame.Options.Yes end)
    if i and (c and (c:IsA("ImageButton") and c.Visible)) then
        local G = false
        if getconnections then
            for V, y in pairs(getconnections(c.MouseButton1Click)) do
                y:Fire()
                G = true
            end
            for V, y in pairs(getconnections(c.Activated)) do
                y:Fire()
                G = true
            end
        end
        return G
    end
end
J.RefreshPetData()
local function TJ(G, y)
    if not G then return false end
    local Z = V.Character
    if not Z then return false end
    local j = Z:FindFirstChild("HumanoidRootPart")
    if not j then return false end
    local i = j.Position
    local c = G.Position
    local J = Vector3.new(i.X, 0, i.Z)
    local T = Vector3.new(c.X, 0, c.Z)
    local d = ((J - T)).Magnitude
    return d <= y
end
J.EquipFruitOrPet = function() if not i.IsToolHeldAny() then
        if next(r.showcase.pet_list) ~= nil then
            local G = i.GetPetBiggestPet(r.showcase.pet_list)
            P(G)
            task.wait(1)
            if i.IsToolHeldAny() then return true end
        end
        if next(r.showcase.fruit_list) ~= nil then
            local G = i.GetRandomFruit()
            P(G)
            task.wait(1)
            if i.IsToolHeldAny() then return true end
        end
        local G = i.GetPetBiggestPet(r.listing_petlist)
        P(G)
        task.wait(1)
        if i.IsToolHeldAny() then return true end
        local V = i.GetFruitUsingNameList(r.showcase.fruit_list)
        P(V)
        task.wait(1)
        if i.IsToolHeldAny() then return true end
    end end
if u.taskboothclaimer then
    pcall(function() task.cancel(u.taskboothclaimer) end)
    u.taskboothclaimer = nil
end
u.taskboothclaimer = task.spawn(function() while true do
        task.wait(4)
        if not r.auto_claim_booth then
            task.wait()
            continue
        end
        local G, V = J.DoWeHaveABooth()
        if G then
            if r.auto_equip_big_pet then J.EquipFruitOrPet() end
            if r.teleport_to_booth then if V then
                    local G = V:GetPivot()
                    local y = tonumber(r.teleport_distance) or 30
                    local Z = 4
                    local j = 0
                    local i = 10
                    local c = G * CFrame.Angles(math.rad(90), 0, 0)
                    local J = c * CFrame.new(j, Z, y)
                    if not TJ(J, i) then
                        m(J)
                        task.wait(3)
                    end
                end end
            task.wait(10)
            continue
        end
        J.ClaimABooth()
    end end)
Z.petforfinding = {}
J.RandomizePets = function()
    local G = {}
    Z.petforfinding = {}
    for V, y in ipairs(Z.all_pets_names_list) do G[V] = y end
    for V = #G, 2, -1 do
        local y = math.random(V)
        G[V], G[y] = G[y], G[V]
    end
    for G, V in ipairs(G) do Z.petforfinding[V] = true end
end
if u.task_sale_check_restart then
    pcall(function() task.cancel(u.task_sale_check_restart) end)
    u.task_sale_check_restart = nil
end
u.task_sale_check_restart = task.spawn(function() while true do
        task.wait(20)
        if not r.joinnewserver then
            task.wait()
            continue
        end
        local G = d.GetSessionTime()
        local V = E.time.GetMinsFromSecs(G)
        local y = tonumber(r.rejoin_mins) or 15
        if V >= y then if Z.sales_made <= 15 then
                J.RandomizePets()
                local G = q.finder.FindAndTeleport(Z.petforfinding)
                if G then print("Found new place to tp to") end
                task.wait(1)
            end end
    end end)
J.HistoryAddPet = function(G)
    local y = V.LocalPlayer
    if not G or not G.seller or G.seller.userId ~= y.UserId or G.seller.username ~= y.Name then return end
    local j = G.item and G.item.data
    local i = j and j.PetData or {}
    local T = i.MutationType or ""
    local d = c.AllMutationListEnum[T]
    local u = G.priceWithFee or 0
    local q = G.price or 0
    local g = i.BaseWeight or 0
    local E = j.PetType or nil
    if not E then return end
    Z.sales_made = Z.sales_made + 1
    local a = K(g, 1)
    local H = tonumber(string.format("%.2f", a))
    local Y = { pet_name = j and j.PetType, nickname = i.Name, level = i.Level, weight = H, found_mutation = d, price = u, tokens =
    Z.GetMyTokens() }
    local e = J.getWebhookSoldItemNew(Y, false)
    local s = J.getWebhookSoldItemNew(Y, true)
    J.SendLiveWebhook(e, r.sold_webhook)
    J.SendLiveWebhookPublicDiscord(s, Z.webhook_category.tradesold)
end
J.HistoryAddHoldable = function(G)
    local y = V.LocalPlayer
    if not G or not G.seller or G.seller.userId ~= y.UserId or G.seller.username ~= y.Name then return end
    local j = G.priceWithFee or 0
    local i = G.price or 0
    local c = G.item
    if not c then return end
    local T = c.data
    if not T then return end
    local d = T.ItemData
    if not d then return end
    local u = d.ItemName
    if not u then return end
    local q = { item_name = d.ItemName or "", price = j, tokens = Z.GetMyTokens() }
    local g = J.getWebhookSoldItemFruitNew(q, false)
    local E = J.getWebhookSoldItemFruitNew(q, true)
    J.SendLiveWebhook(g, r.sold_webhook)
    J.SendLiveWebhookPublicDiscord(E, Z.webhook_category.tradesold)
end
J.HistoryAddPetSnipe = function(G)
    local y = V.LocalPlayer
    if not G or not G.seller or G.seller.userId == y.UserId or G.seller.username == y.Name then return end
    local j = G.item and G.item.data
    local i = j and j.PetData or {}
    local T = i.MutationType or ""
    local d = c.AllMutationListEnum[T]
    local u = G.priceWithFee or 0
    local q = G.price or 0
    local g = i.BaseWeight or 0
    local E = j.PetType or nil
    if not E then return end
    local a = K(g, 1)
    local H = tonumber(string.format("%.2f", a))
    local Y = { pet_name = j and j.PetType, nickname = i.Name, level = i.Level, weight = H, found_mutation = d, price = u, tokens =
    Z.GetMyTokens() }
    local e = J.getWebhookSnipedItem(Y, false)
    J.SendLiveWebhook(e, r.sold_webhook)
end
local function dJ() V.GameEvents.TradeEvents.Booths.AddToHistory.OnClientEvent:Connect(function(G)
        if G.item and (G.item.type and G.item.type == "Pet") then
            J.HistoryAddPetSnipe(G)
            J.HistoryAddPet(G)
        end
        if G.item and (G.item.type and G.item.type == "Holdable") then J.HistoryAddHoldable(G) end
    end) end
dJ()
Z.AlreadySentPets = {}
u.ScanForWeb = function()
    local G = { Dog = true, ["Golden Lab"] = true, Bunny = true, Turtle = true, ["Sea Otter"] = true, ["Polar Bear"] = true, Cow = true,
        ["Silver Monkey"] = true, Starfish = true, Seagull = true, Crab = true }
    local V = q.finder.GetBoothListings()
    local y = {}
    for V, j in pairs(V or {}) do if type(j) == "table" then
            local V = j.pet_uuid
            local i = j.petname
            local c = j.price
            if G[i] then continue end
            local J = tostring(V or "") .. ("|" .. tostring(c or ""))
            local T = 0
            if j.fav then T = 1 end
            if Z.AlreadySentPets[J] then continue end
            local d = Z.GetAssetId(i, Z.ItemTypes.Pet)
            if V and (i and c) then
                local G = { uuid = tostring(V), mut = j.mut, age = tonumber(j.level) or 0, bw = tonumber(j.weight) or 0, nickn =
                tostring(j.petnickname or ""), ptype = tostring(i), pr = tostring(c), i = tostring(d), fav = T }
                Z.AlreadySentPets[J] = true
                table.insert(y, G)
            end
        end end
    return y
end
u.ScanForSpecificPet = function()
    local G = q.finder.GetBoothListings()
    local V = r.scantargetpets or {}
    local y = next(V) == nil
    local Z = {}
    local j = tonumber(r.manual_min_weight) or 0
    for G, i in pairs(G) do if y or V[i.petname] then
            local V = i.weight
            local y = i.visualweight
            if V < j then continue end
            local c = { id = G, owner = i.owner, pet = i.petname, price = i.price, weight = V, visualweight = y, level =
            i.level, fav = i.fav }
            table.insert(Z, c)
        end end
    table.sort(Z, function(G, V) return ((tonumber(G.price) or 0)) < ((tonumber(V.price) or 0)) end)
    if #Z > 0 then else end
    return Z
end
u.already_tried_jobs = {}
if u.finder_loop then
    pcall(function() task.cancel(u.finder_loop) end)
    u.finder_loop = nil
end
local uJ = {}
local qJ = function(G, V)
    if not G then return false end
    local y = V.list_id
    local j = V.price
    local i = V.petnickname
    local c = V.petname
    local T = V.pet_uuid
    local d = V.level
    local u = V.weight
    local q = V.mut
    local g = V.visualweight
    local E = G.weight_min or 0
    local a = G.weight_max or 0
    local H = G.price or 0
    local r = G.min_level or 1
    local Y = G.max_level or 125
    local e = G.max_keep or 300
    local s = G.is_weightagebased
    local N = tonumber(G.big_weight_max) or 112
    local W = false
    if G.enabled and G.enabled == true then W = true end
    if Z.PET_COUNT[c] and Z.PET_COUNT[c] >= e then return false end
    if not W then return false end
    if a == 0 then return false end
    local X = string.format("[DEBUG] LV.%s petname=%s | realweight=%s | baseweight=%s", tostring(d), tostring(c),
        tostring(g), tostring(u))
    if s == false then
        if d < r or d > Y then return false end
        if u >= E and u <= a then if j <= H then return true else
                local G = { name = c, price = j, weight = J.FormatWeight(u) }
                table.insert(uJ, G)
            end end
    else if g >= N then if j <= H then return true else
                local G = { name = c, price = j, weight = J.FormatWeight(g) }
                table.insert(uJ, G)
            end end end
    return false
end
u.FirstTimeLoadTimer = 20
u.finder_loop = task.spawn(function() while true do
        task.wait(5)
        if not Z.GetCheckIfPro() then break end
        if not r.finder.find_enabled then
            Z.TEXT_SCANNER = "\240\159\148\180 Snipe System Not Enabled."
            task.wait(1)
            continue
        end
        Z.TEXT_SCANNER = "\240\159\148\142 Scanning booth listings..."
        local G = {}
        uJ = {}
        local V = 0
        local y = 0
        local j = 0
        local i = q.finder.GetBoothListings()
        for i, c in pairs(i) do
            V += 1
            local J = c.petname
            local T = c.fav
            if T and T == true then continue end
            Z.TEXT_SCANNER = string.format(
            "\240\159\148\142 Scanning listings...\240\159\147\166 Checked: %s, \240\159\144\190 Current: %s", V, J)
            local d = r.finder.find_petlist[J]
            if not d then continue end
            y = y + 1
            Z.TEXT_SCANNER = string.format(
            "\226\156\133 Target pet found.\n\240\159\144\190 Pet: %s\n\240\159\146\176 Price: %s\n\240\159\148\141 Checking filters...",
                J, tostring(c.price or "?"))
            local u = r.find_settings[c.petname]
            if not u then continue end
            if not r.finder.find_enabled then break end
            local g = qJ(u, c)
            if g == true then
                j = j + 1
                Z.TEXT_SCANNER = string.format(
                "\240\159\159\162 Match found! \240\159\144\190 Pet: %s, \240\159\146\176 Price: %s, \240\159\155\146 Buying now...",
                    J, tostring(c.price or "?"))
                local V = { id = i, owner = c.owner, pet = c.petname, price = c.price }
                if r.finder.find_enabled then
                    local y = q.finder.BuyListing(c.owner, i, c.price)
                    Z.TEXT_SCANNER = string.format(
                    "\226\156\133 Buy attempted: \240\159\144\190 Pet: %s, \240\159\146\176 Price: %s, \240\159\147\140 Result: %s",
                        J, tostring(c.price or "?"), tostring(y))
                    task.wait(9)
                    table.insert(G, V)
                else
                    Z.TEXT_SCANNER = string.format(
                    "\226\157\140 Filter failed.: \240\159\144\190 Pet: %s, \240\159\146\176 Price: %s, \226\158\161\239\184\143 Continuing scan...",
                        J, tostring(c.price or "?"))
                    task.wait(.2)
                end
            end
        end
        Z.TEXT_SCANNER = string.format(
        "\240\159\147\138 Scan complete: \240\159\147\166 Listings checked: %s, \240\159\142\175 Target pets: %s, \240\159\155\146 Buy matches: %s",
            V, y, #G)
        local c = ""
        for G, V in ipairs(uJ) do c = c .. string.format("<font color=\'#B7FF00\'>%s</font> | %s\n", V.price, V.name) end
        q.finder.UpdateStatusPetFound(c)
        task.wait(4)
        if #G == 0 then if not r.sameserver_buyonly then
                Z.TEXT_SCANNER = "\240\159\140\141 Nothing found. Finding a new server..."
                task.wait(u.FirstTimeLoadTimer)
                u.FirstTimeLoadTimer = .5
                local G = q.finder.FindNewListing()
                if G then Z.TEXT_SCANNER = "\226\156\133 New server/listing found.\n\240\159\154\128 Teleporting..." else Z.TEXT_SCANNER =
                    "\226\154\160\239\184\143 No new server found.\n\240\159\148\129 Will try again..." end
            else Z.TEXT_SCANNER = "\226\143\179 Scanning again soon..." end else
            Z.TEXT_SCANNER = string.format(
            "\226\156\133 Finished buying: \240\159\155\146 Bought/attempted: %s, \226\143\179 Scanning again soon...",
                #G)
            task.wait(3)
        end
    end end)
task.spawn(function() while true do
        task.wait(1)
        Z.AgeBreakMachine.Update()
    end end)
if u.task_listing_lister then
    pcall(function() task.cancel(u.task_listing_lister) end)
    u.task_listing_lister = nil
end
u.task_listing_lister = task.spawn(function() while true do
        task.wait(1)
        if not Z.GetCheckIfPro() then break end
        local G = u.ListSystem.UpdateStatusUI
        if not r.auto_list_enabled then
            task.wait(3)
            continue
        end
        if r.sellfruit.is_fruit_enabled then
            y:Notify("Fruit listing is active, unable to list pets.", 5)
            task.wait(5)
            continue
        end
        local V = Z.GetMyTokens()
        local j = u.ListSystem.GetAllPetsForListing()
        if #j == 0 then
            local V, y = Z.GetMyListingsCount()
            G("\226\157\140 No pets to list or reached max listing. Currently listed: " .. y)
            task.wait(3)
            continue
        end
        G("\240\159\164\150 Found pets: " .. #j)
        local c = 1
        local J = 0
        for V, y in ipairs(j) do
            task.wait()
            local Z = y.pet_uuid
            local j = y.pet_tool
            if not j then continue end
            if J >= 3 then break end
            if not r.auto_list_enabled then break end
            local T = tonumber(r.listing_token_price) or 0
            if i.IsPetFav(j) then
                G("\226\157\164\239\184\143 remove fav from pet. ")
                if r.listing_auto_unfav then
                    A(j)
                    task.wait(1)
                else
                    G("\240\159\164\150 Unable to send fav pet - Setting not enabled to unfav ")
                    task.wait(1)
                    continue
                end
            end
            G("\240\159\164\150 Listing pet: " .. (((j.Name or "Unknown")) .. (" For " .. (T .. " Tokens"))))
            local d, q = pcall(function()
                u.ListSystem.CreateListingPet(T, Z)
                task.wait(3)
            end)
            if not d then warn("List error", q) end
            G("\226\156\133 Listing create: " .. j.Name or "Unknown \226\143\179 Waiting to list next")
            J = J + 1
            task.wait(c)
        end
    end end)
if u.task_listing_fruits then
    pcall(function() task.cancel(u.task_listing_fruits) end)
    u.task_listing_fruits = nil
end
u.task_listing_fruits = task.spawn(function() while true do
        task.wait(1)
        if not Z.GetCheckIfPro() then break end
        local G = u.ListSystem.UpdateStatusUI
        if not r.sellfruit.is_fruit_enabled then
            task.wait(3)
            continue
        end
        if r.auto_list_enabled then
            y:Notify("Pet listing is active, unable to list fruits.", 5)
            task.wait(5)
            continue
        end
        local V = Z.GetMyTokens()
        local j = u.ListSystem.GetAllFruitsForListing()
        if #j == 0 then
            local V, y = Z.GetMyListingsCount()
            G("\226\157\140 No fruits to list or reached max listing. Currently listed: " .. y)
            task.wait(3)
            continue
        end
        G("\240\159\141\137 Found fruits: " .. #j)
        local c = 1
        local J = 0
        for V, y in ipairs(j) do
            task.wait()
            if not r.sellfruit.is_fruit_enabled then break end
            local Z = y.fruit_uuid
            local j = y.fruit_tool
            if not j then continue end
            if J >= 3 then break end
            local T = tonumber(r.sellfruit.fruit_price) or 0
            if i.IsFavFruit(j) then
                G("\226\157\164\239\184\143 remove fav from fruit. ")
                if r.sellfruit.fruit_auto_fav then
                    A(j)
                    task.wait(1.3)
                else
                    G("\240\159\164\150 Unable to list fav fruit - Setting not enabled to unfav ")
                    task.wait(1)
                    continue
                end
            end
            G("\240\159\141\137 Listing fruit: " .. (((j.Name or "Unknown")) .. (" For " .. (T .. " Tokens"))))
            local d, q = pcall(function()
                u.ListSystem.CreateListingHoldable(T, Z)
                task.wait(3)
            end)
            if not d then warn("List error", q) end
            G("\226\156\133\240\159\141\137 Listing create: " .. j.Name or "Unknown \226\143\179 Waiting to list next")
            J = J + 1
            task.wait(c)
        end
    end end)
if not _G.service_ui_labelupdates then _G.service_ui_labelupdates = task.spawn(function() while true do
            task.wait(.5)
            local G = {}
            local V = {}
            if r.finder.find_enabled then
                local V = "[Snipe]"
                if r.sameserver_buyonly then V = "[Snipe-SameServer]" end
                local y = string.format(
                "<stroke color=\'#000000\' thickness=\'1\'><font color=\'#39FF14\'>\240\159\142\175 %s</font> %s</stroke>",
                    V, Z.TEXT_SCANNER)
                table.insert(G, y)
            end
            if r.auto_list_enabled or r.sellfruit.is_fruit_enabled then table.insert(G, Z.TEXT_LISTING) end
            if u.is_running_remove_list or u.is_running_remove_list_fruit then table.insert(G, Z.TEXT_LISTING_REMOVE) end
            if Z.isagebreak_autorejoin_main then table.insert(G, Z.TEXT_AGEBREAK) end
            J.updateStatusList(G)
            J.updateCompactStatus(V)
        end end) end
Z.prevent_rc = false
if r.autoreconnect_tries >= 3 then Z.prevent_rc = true end
function OnDcMd() (game:GetService("GuiService")).ErrorMessageChanged:Connect(function()
        local G = (game:GetService("GuiService")):GetErrorMessage()
        if G and G ~= "" then
            Z.is_dc = true
            a.webhook.SendError("Disconnect: " .. tostring(G))
            task.wait(math.random(3, 9))
            if not Z.prevent_rc then if r.enable_auto_reconnect then pcall(function()
                        r.autoreconnect_tries = r.autoreconnect_tries + 1
                        r.was_auto_reconnect = true
                        N()
                        task.wait(3); (game:GetService("TeleportService")):Teleport(game.PlaceId, V.LocalPlayer)
                    end) end end
        end
    end) end

task.spawn(function()
    task.wait(15)
    if r.was_auto_reconnect then
        r.autoreconnect_tries = 0
        r.was_auto_reconnect = false
        a.webhook.SendSuccess("Reconnected success.")
        W()
    end
end)
task.spawn(function() while true do
        task.wait(1)
        if not r.auto_promote_listing then
            task.wait(4)
            continue
        end
        task.wait(math.random(30, 63))
        if not r.auto_promote_listing then
            task.wait(1)
            continue
        end
        local G = J.MakeMessageForPromote(r.listing_petlist, r.sellfruit.fruit_list_allow)
        J.SendChat(G)
    end end)
task.spawn(function() while true do
        task.wait(3)
        Z.PET_COUNT = i.BuildPetLookup()
    end end)
Z.checkprm_trade = function()
    local G = "exologin.json"
    if not isfile(G) then G = string.format("%s_exologin.json", Z.player_userid) end
    if isfile(G) then delfile(G) else end
    task.wait(20)
    Z.is_pro = false
    V.LocalPlayer:Kick("You have been kicked from the experience.")
end
Z.SendPetScans = function(G)
    local y = ""
    local Z, j = pcall(function()
        local Z = V.HttpService:JSONEncode(G)
        local j = (syn and syn.request) or (http and http.request) or http_request or request or
        (fluxus and fluxus.request) or (krnl and krnl.request)
        if j then
            local G = j({ Url = y, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = Z })
            return G.Body
        else
            local G = V.HttpService:PostAsync(y, Z)
            return G
        end
    end)
    if Z then local G = V.HttpService:JSONDecode(j) else end
end
Z.MakeDataForScansWebui = function()
    local G = u.ScanForWeb()
    if next(G) == nil then
        task.wait(10)
        return false
    end
    local y = #V.Players:GetPlayers()
    local j = tostring(game.JobId)
    local i = tostring(game.PlaceId)
    local c = { username = V.LocalPlayer.Name, uid = Z.player_userid, serverv = V.CurentV, pets = G, sid = j, pid = i, cc =
    Z.user_country, pc = y or 0 }
    return c
end
task.spawn(function() while true do
        task.wait(12)
        local G, V = pcall(function()
            local G = Z.MakeDataForScansWebui()
            if G then Z.SendPetScans(G) end
        end)
        if not G then warn("er: ", V) end
    end end)
Z.SimulateRealMobileTap = function()
    local G = game:GetService("Players")
    local V = game:GetService("VirtualInputManager")
    local y = G.LocalPlayer
    if not y then return false end
    local Z = y:FindFirstChild("PlayerGui")
    if not Z then return false end
    local j = Instance.new("ScreenGui")
    j.IgnoreGuiInset = true
    j.ResetOnSpawn = false
    j.DisplayOrder = 999999
    j.Parent = Z
    local i = Instance.new("TextButton")
    i.Size = UDim2.fromScale(1, 1)
    i.BackgroundTransparency = 1
    i.TextTransparency = 1
    i.Text = ""
    i.Parent = j
    task.wait(.15)
    local c = i.AbsolutePosition
    local J = i.AbsoluteSize
    local T = c.X + J.X / 2
    local d = c.Y + J.Y / 2
    local u = pcall(function()
        V:SendTouchEvent(1, 0, T, d)
        task.wait(.08)
        V:SendTouchEvent(1, 2, T, d)
    end)
    j:Destroy()
    return u
end
Z.SimulateScreenTapWithGui = function()
    local G = game:GetService("Players")
    local V = game:GetService("VirtualInputManager")
    local y = G.LocalPlayer
    if not y then return false end
    local Z = y:FindFirstChild("PlayerGui")
    if not Z then return false end
    local j = Instance.new("ScreenGui")
    j.IgnoreGuiInset = true
    j.ResetOnSpawn = false
    j.Parent = Z
    local i = Instance.new("TextButton")
    i.Size = UDim2.fromScale(1, 1)
    i.Position = UDim2.fromScale(0, 0)
    i.BackgroundTransparency = 1
    i.TextTransparency = 1
    i.AutoButtonColor = false
    i.ZIndex = 999999
    i.Parent = j
    task.wait(.1)
    local c = i.AbsolutePosition
    local J = i.AbsoluteSize
    local T = c.X + J.X / 2
    local d = c.Y + J.Y / 2
    pcall(function()
        V:SendMouseButtonEvent(T, d, 0, true, game, 1)
        task.wait(.05)
        V:SendMouseButtonEvent(T, d, 0, false, game, 1)
    end)
    j:Destroy()
    return true
end
if J.UserDevice.IsMobile() then Z.SimulateRealMobileTap() else Z.SimulateScreenTapWithGui() end
