

VladmirAK47 = {}
VladmirAK47.debug = false
local active = false
local active1 = false
local smoke1 = false
local bossmode = false
local Shock = false
local Shock99 = false
local Ragdoll = false
local Weed2 = false
local drug2 = false
local drug3 = false
local drug4 = false
local drug5 = false
local drug6 = false
local drug16 = false
local drug17 = false
local drug18 = false
local drug19 = false
local drug20 = false
local drug21 = false
local drug22 = false
local drug23 = false
local drug24 = false
local drug25 = false
local drug26 = false
local drug27 = false
local drug28 = false
local drug29 = false
local drug30 = false
local AAA3 = false
local Shock1 = false
local Boggyman = false
local Boggymanall = false
local mysound = false
local deathsound = false
local forcefield = false
local bird1 = false
local test8 = false 
local INV3 = false 
local skin1 = false
local sup = false
local test007 = false
local freeze2 = false
local freezeV1 = false
local TEST20 = false
local TEST31 = false
local TEST22 = false
local TEST30 = false
local pedControl = false 
local manypeds = false
local manypeds1 = false
local clone = false
local test4 = false
local test991 = false
local test992 = false
local test993 = false
local test994 = false
local test995 = false
local test996 = false
local test997 = false
local test2997 = false
local test2096 = false
local test2095 = false
local test2998 = false
local test2999 = false
local test2990 = false
local test3000 = false
local test1997 = false
local test4445 = false
local test1998 = false
local test998 = false
local test999 = false
local selectedPlayerId = nil
local H4tuf5 = true
local LMl35d = false
local wtB2JF = "test"
---------------

-------cONTROL
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
--------------

local skateboard_car = nil
local skateboard = nil
local function EquipSkateboard()
	Citizen.CreateThread(function()
		local model = GetHashKey("p_defilied_ragdoll_01_s")
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		--GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BAT"), 0, true, true)

		skateboard = CreateObject(model, GetEntityCoords(PlayerPedId(), false), false, false, false)
		local weapon_obj = GetWeaponObjectFromPed(PlayerPedId(), 1)
		AttachEntityToEntity(skateboard, weapon_obj, 0, -0.05, 0.0, 0.3, 180.0, 90.0, 0.0, false, false, false, false, 2, true)
		AttachEntityToEntity(weapon_obj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.08, 0.0, 0.0, -85.0, 22.0, 0.0, false, false, false, false, 2, true)
		SetPedCurrentWeaponVisible(PlayerPedId(), false, true, 0, 0)
		SetPedCanSwitchWeapon(PlayerPedId(), false)
	end)
end

local function UnequipSkateboard()
	GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), 0, true, true)
	DeleteObject(skateboard)
	SetPedCanSwitchWeapon(PlayerPedId(), true)
end

local function StartSkating()
	Citizen.CreateThread(function()
		SetEntityAlpha(PlayerPedId(), 0)
		RequestModel(1131912276)
		while not HasModelLoaded(1131912276) do
			Citizen.Wait(0)
		end
		skateboard_car = CreateVehicle(1131912276, GetEntityCoords(PlayerPedId(), false), GetEntityHeading(PlayerPedId()), true, false)
		SetEntityInvincible(skateboard_car, true)
		SetEntityAlpha(skateboard_car, 0)
		local fakeskater = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), false, true)
		TaskPlayAnim(fakeskater, "move_strafe@stealth", "idle", 8.0, -4.0, -1, 9, 0.0, false, false, false)
		AttachEntityToEntity(fakeskater,skateboard_car, 0, 0.0, 0.0, 0.75, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		SetEntityCollision(fakeskater, false, true)
		SetBlockingOfNonTemporaryEvents(fakeskater, true)
		SetEntityInvincible(fakeskater, true)
		local model = GetHashKey("prop_railsleepers01")
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		skateboard = CreateObject(model, GetEntityCoords(PlayerPedId(), false), false, false, false)
		AttachEntityToEntity(skateboard,skateboard_car, 0, 0.0, 0.0, -0.4, 0.0, 0.0, 190.0, false, false, false, false, 2, true)
		SetPedIntoVehicle(PlayerPedId(), skateboard_car, -1)
	end)
end
local function StartSkating1()
	Citizen.CreateThread(function()
		SetEntityAlpha(PlayerPedId(), 0)
		RequestModel(1131912276)
		while not HasModelLoaded(1131912276) do
			Citizen.Wait(0)
		end
		skateboard_car = CreateVehicle(1131912276, GetEntityCoords(PlayerPedId(), false), GetEntityHeading(PlayerPedId()), true, false)
		SetEntityInvincible(skateboard_car, true)
		SetEntityAlpha(skateboard_car, 0)
		local fakeskater = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), false, true)
		TaskPlayAnim(fakeskater, "move_strafe@stealth", "idle", 8.0, -4.0, -1, 9, 0.0, false, false, false)
		AttachEntityToEntity(fakeskater,skateboard_car, 0, 0.0, 0.0, 0.75, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		SetEntityCollision(fakeskater, false, true)
		SetBlockingOfNonTemporaryEvents(fakeskater, true)
		SetEntityInvincible(fakeskater, true)
		local model = GetHashKey("prop_minigun_01")
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		skateboard = CreateObject(model, GetEntityCoords(PlayerPedId(), false), false, false, false)
		AttachEntityToEntity(skateboard,skateboard_car, 0, 0.0, 0.0, -0.4, 0.0, 0.0, 270.0, false, false, false, false, 2, true)
		SetPedIntoVehicle(PlayerPedId(), skateboard_car, -1)
	end)
end
local function StartSkating2()
	Citizen.CreateThread(function()
		TaskPlayAnim(PlayerPedId(), "move_strafe@stealth", "idle", 8.0, -4.0, -1, 9, 0.0, false, false, false)
		local model = GetHashKey("prop_railsleepers01")
		RequestModel(model)
		Citizen.Wait(100)
		if HasModelLoaded(model) then			
		skateboard = CreateObject(model, GetEntityCoords(PlayerPedId(), false), false, false, false)
		AttachEntityToEntity(skateboard, PlayerPedId(), 0, 0.0, 0.0, -1.0, 0.0, 0.0, 65.0, false, false, false, false, 2, true)
		Noclip1 = true
		drug27 = true
		end
		--SetPedIntoVehicle(PlayerPedId(), skateboard_car, -1)
	end)
end
Citizen.CreateThread(function()
	RequestAnimDict("move_strafe@stealth")
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 52) then
        --drug27 = false
        av('~h~~b~ Off.', false)
		
		end
	end
end)
Citizen.CreateThread(function()
	RequestAnimDict("move_strafe@stealth")
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 212) then	
		UnequipSkateboard()
        Noclip1 = false
		FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasksImmediately(PlayerPedId())
        drug27 = false		
		--AAA1 = false		
		end
	end
end)
SetPedCanSwitchWeapon(PlayerPedId(), true)
RemoveAllPedWeapons(PlayerPedId(), 0)
------
--sKY DIVE

function IRON1()
		
		CreateThread(function()
			local playerPed = PlayerPedId()
			local playerPos = GetEntityCoords(playerPed)

			GiveWeaponToPed(playerPed, GetHashKey('gadget_parachute'), 1, true, true)

			DoScreenFadeOut(3000)

			while not IsScreenFadedOut() do
				Wait(0)
			end

			SetEntityCoords(playerPed, playerPos.x, playerPos.y, playerPos.z + 500.0)

			DoScreenFadeIn(2000)

			Wait(2000)

			DisplayHelpText('Skyfall ~g~activated')

			SetPlayerInvincible(playerPed, true)
			SetEntityProofs(playerPed, true, true, true, true, true, false, 0, false)
		
			ApplyForceToEntity(playerPed, true, 0.0, 200.0, 2.5, 0.0, 0.0, 0.0, false, true, false, false, false, true)
			Noclip1 = true
		end)

end

------

-----RIDE
local Deer = {
	Handle = nil,
	Invincible = false,
	Ragdoll = false,
	Marker = false,
	Speed = {
		Walk = 2.0,
		Run = 3.0,
	},
}

function GetNearbyPeds(X, Y, Z, Radius)
	local NearbyPeds = {}
	for Ped in EnumeratePeds() do
		if DoesEntityExist(Ped) then
			local PedPosition = GetEntityCoords(Ped, false)
			if Vdist(X, Y, Z, PedPosition.x, PedPosition.y, PedPosition.z) <= Radius then
				table.insert(NearbyPeds, Ped)
			end
		end
	end
	return NearbyPeds
end

function GetCoordsInfrontOfEntityWithDistance(Entity, Distance, Heading)
	local Coordinates = GetEntityCoords(Entity, false)
	local Head = (GetEntityHeading(Entity) + (Heading or 0.0)) * math.pi / 180.0
	return {x = Coordinates.x + Distance * math.sin(-1.0 * Head), y = Coordinates.y + Distance * math.cos(-1.0 * Head), z = Coordinates.z}
end

function GetGroundZ(X, Y, Z)
	if tonumber(X) and tonumber(Y) and tonumber(Z) then
		local _, GroundZ = GetGroundZFor_3dCoord(X + 0.0, Y + 0.0, Z + 0.0, Citizen.ReturnResultAnyway())
		return GroundZ
	else
		return 0.0
	end
end

function Deer.Destroy()
	local Ped = PlayerPedId()

	DetachEntity(Ped, true, false)
	ClearPedTasksImmediately(Ped)

	SetEntityAsNoLongerNeeded(Deer.Handle)
	DeletePed(Deer.Handle)

	if DoesEntityExist(Deer.Handle) then
		SetEntityCoords(Deer.Handle, 601.28948974609, -4396.9853515625, 384.98565673828)
	end

	Deer.Handle = nil
end

function Deer.Create()
	local Model = GetHashKey("a_c_deer")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create11()
	local Model = GetHashKey("futo")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)
--local v = CreateObject(GetHashKey('prop_gascage01'), pos.x, pos.y, pos.z, true, true, true)
	Deer.Handle = CreateObject(Model, PedPosition.x, PedPosition.y, PedPosition.z, true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create1()
	local Model = GetHashKey("a_c_cow")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create2()
	local Model = GetHashKey("A_C_Pig")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create3()
	local Model = GetHashKey("A_C_Chimp")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create4()
	local Model = GetHashKey("A_C_Chop")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create5()
	local Model = GetHashKey("A_C_Cormorant")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create6()
	local Model = GetHashKey("A_C_Coyote")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create7()
	local Model = GetHashKey("A_C_Husky")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create8()
	local Model = GetHashKey("A_C_MtLion")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Create9()
	local Model = GetHashKey("A_C_Rat")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end
function Deer.Attach()
	local Ped = PlayerPedId()

	FreezeEntityPosition(Deer.Handle, true)
	FreezeEntityPosition(Ped, true)

	local DeerPosition = GetEntityCoords(Deer.Handle, false)
	SetEntityCoords(Ped, DeerPosition.x, DeerPosition.y, DeerPosition.z)

	AttachEntityToEntity(Ped, Deer.Handle, GetPedBoneIndex(Deer.Handle, 24816), -0.3, 0.0, 0.3, 0.0, 0.0, 90.0, false, false, false, true, 2, true)

	TaskPlayAnim(Ped, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, 0, 0, 0)

	FreezeEntityPosition(Deer.Handle, false)
	FreezeEntityPosition(Ped, false)
end
function Deer.Ride()
	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)
	if IsPedSittingInAnyVehicle(Ped) or IsPedGettingIntoAVehicle(Ped) then
		return
	end

	local AttachedEntity = GetEntityAttachedTo(Ped)

	if IsEntityAttached(Ped) and GetEntityModel(AttachedEntity) == GetHashKey("a_c_deer") then
		local SideCoordinates = GetCoordsInfrontOfEntityWithDistance(AttachedEntity, 1.0, 90.0)
		local SideHeading = GetEntityHeading(AttachedEntity)

		SideCoordinates.z = GetGroundZ(SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)

		Deer.Handle = nil
		DetachEntity(Ped, true, false)
		ClearPedTasksImmediately(Ped)

		SetEntityCoords(Ped, SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)
		SetEntityHeading(Ped, SideHeading)
	else
		for _, Ped in pairs(GetNearbyPeds(PedPosition.x, PedPosition.y, PedPosition.z, 2.0)) do
			if GetEntityModel(Ped) == GetHashKey("a_c_deer") then
				Deer.Handle = Ped
				Deer.Attach()
				break
			end
		end
	end
end
Citizen.CreateThread(function()
	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Citizen.Wait(250)
	end
	while true do
		Citizen.Wait(0)

		if IsControlJustPressed(1, 51) then
			--Deer.Ride()
		end

		if IsControlJustPressed(1, 288) then
			if not Deer.Handle then
				--Deer.Create()
			else
				--Deer.Destroy()
			end
		end

		local Ped = PlayerPedId()
		local AttachedEntity = GetEntityAttachedTo(Ped)

		if (not IsPedSittingInAnyVehicle(Ped) or not IsPedGettingIntoAVehicle(Ped)) and IsEntityAttached(Ped) and AttachedEntity == Deer.Handle then
			if DoesEntityExist(Deer.Handle) then
				local LeftAxisXNormal, LeftAxisYNormal = GetControlNormal(2, 218), GetControlNormal(2, 219)
				local Speed, Range = Deer.Speed.Walk, 4.0

				if IsControlPressed(0, 21) then
					Speed = Deer.Speed.Run
					Range = 8.0
				end

				local GoToOffset = GetOffsetFromEntityInWorldCoords(Deer.Handle, LeftAxisXNormal * Range, LeftAxisYNormal * -1.0 * Range, 0.0)

				TaskLookAtCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 2)
				TaskGoStraightToCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, Speed, 20000, 40000.0, 0.5)

				if Deer.Marker then
					DrawMarker(6, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end
	end
end)
-----
function GetAllPeds()
    local peds = {}
    for ped in EnumeratePeds() do
        if DoesEntityExist(ped) then
            table.insert(peds, ped)
        end
    end
    return peds
end

function GetAllVehicles()
    local vehicles = {}
    for vehicle in EnumerateVehicles() do
        if DoesEntityExist(vehicle) then
            table.insert(vehicles, vehicle)
        end
    end
    return vehicles
end


------
local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local menuso = {}
local p = {
    up = 172,
    down = 173,
    left = 174,
    right = 175,
    select = 176,
    back = 177
}
local q = 0
local s = nil
local t = nil
local u = 0.23
local v = 0.13
local w = 0.04
local A = 1.0
local B = 0.041
local C = 0
local D = 0.330
local E = 0.007
local F = 0.007
local function H(I)
    if VladmirAK47.debug then
        Citizen.Trace('[VladmirAK47] ' .. tostring(I))
    end
end
local function J(f, K, value)
    if f and menuso[f] then
        menuso[f][K] = value
        H(f .. ' menu property changed: { ' .. tostring(K) .. ', ' .. tostring(value) .. ' }')
    end
end
local function L(f)
    if f and menuso[f] then
        return menuso[f].visible
    else
        return false
    end
end
local function M(f, N, O)
    if f and menuso[f] then
        J(f, 'visible', N)
        if not O and menuso[f] then
            J(f, 'currentOption', 1)
        end
        if N then
            if f ~= t and L(t) then
                M(t, false)
            end
            t = f
        end
    end
end
local function P(I, x, y, Q, R, S, T, U, V)
    SetTextColour(R.r, R.g, R.b, R.a)
    SetTextFont(Q)
    SetTextScale(S, S)
    if U then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if menuso[t] then
        if T then
            SetTextCentre(T)
        elseif V then
            SetTextWrap(menuso[t].x, menuso[t].x + u - E)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end
local function W(x, y, X, height, R)
    DrawRect(x, y, X, height, R.r, R.g, R.b, R.a)
end
local function Y()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v / 2
        if menuso[t].titleBackgroundSprite then
            DrawSprite(
                menuso[t].titleBackgroundSprite.dict,
                menuso[t].titleBackgroundSprite.name,
                x,
                y,
                u,
                v,
                0.,
                255,
                255,
                255,
                255
            )
        else
            W(x, y, u, v, menuso[t].titleBackgroundColor)
        end
        P(menuso[t].title, x, y - v / 2 + w, menuso[t].titleFont, menuso[t].titleColor, A, true)
    end
end	
						

	
	
    function RRR3(player)  
        Citizen.CreateThread(function() 
            local coords = GetEntityCoords(PlayerPedId())
	            	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	                NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	                       SetPlayerInvincible(ped, false)
	                     TriggerCustomEvent(false, 'playerSpawned', coords.x, coords.y, coords.z)
	                          ClearPedBloodDamage(ped)
	            StopScreenEffect('DeathFailOut') 
		end)    
    end	
function Jugg(player)  
    Citizen.CreateThread(function() 
			    local model = "mp_m_freemode_01"
				RequestModel(GetHashKey(model)) 
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					SetPedRandomComponentVariation(PlayerPedId(), true)
                RequestClipSet("move_ballistic_2h")	
                RequestAnimSet("MOVE_STRAFE_BALLISTIC")				
			    Citizen.Wait(500)
	            local playerPed = GetPlayerPed(-1)				
				ResetPedMovementClipset(playerPed, 1.0);
				ResetPedStrafeClipset(playerPed);
				SetPedUsingActionMode(playerPed, true, -1, 0); -- When value is "true", player leaves vehicle with engine running (cars mostly).			
				SetPedMovementClipset(playerPed, "ANIM_GROUP_MOVE_BALLISTIC", 1.0);
				SetPedStrafeClipset(playerPed, "MOVE_STRAFE_BALLISTIC");
				SetWeaponAnimationOverride(playerPed, 0x5534A626);
				SetPedComponentVariation(playerPed, 3, 2, 0, 0); -- Upper
				SetPedComponentVariation(playerPed, 4, 2, 0, 0); -- Lower
				SetPedComponentVariation(playerPed, 5, 1, 0, 0); -- Hands
				SetPedComponentVariation(playerPed, 6, 2, 0, 0); -- Shoes / Juggernaut Mask
				SetPedComponentVariation(playerPed, 8, 2, 0, 0); -- Accessory 0
				SetPedComponentVariation(playerPed, 9, 0, 0, 0); -- Accessory 1
				SetPedComponentVariation(playerPed, 10, 0, 0, 0); -- Badges
				SetPedPropIndex(playerPed, 0, 24, 0, false); -- Hats
				--ClearPedProp(playerPed, 1);
				ClearPedBloodDamage(playerPed);
				ClearPedBloodDamage(playerPed);
				SetEntityMaxHealth(playerPed, 2000);
				SetPedMaxHealth(playerPed, 2000);
				SetEntityHealth(playerPed, 2000);
				SetPedComponentVariation(playerPed, 0, 0, 0, 0); -- Head
				SetPedComponentVariation(playerPed, 1, 104, 25, 0); -- Beard
				SetPedComponentVariation(playerPed, 2, 57, 0, 0); -- Hair
				SetPedComponentVariation(playerPed, 3, 31, 0, 0); -- Upper
				SetPedComponentVariation(playerPed, 4, 84, 0, 0); -- Lower
				SetPedComponentVariation(playerPed, 5, 0, 0, 0); -- Hands
				SetPedComponentVariation(playerPed, 6, 33, 0, 0); -- Shoes / Juggernaut Mask
				SetPedComponentVariation(playerPed, 7, 0, 1, 0); -- Theeth
				SetPedComponentVariation(playerPed, 8, 97, 0, 0); -- Accessory 0
				SetPedComponentVariation(playerPed, 9, 0, 0, 0); -- Accessory 1
				SetPedComponentVariation(playerPed, 10, 0, 0, 0); -- Badges
				SetPedComponentVariation(playerPed, 11, 186, 0, 0); -- Shirt Overlay
				SetPedPropIndex(playerPed, 0, 39, 0, false); -- Hats
				SetPedPropIndex(playerPed, 1, 15, 1, false); -- Glasses
				SetPedPropIndex(playerPed, 2, 3, 0, false); -- Misc
				GiveWeaponToPed(playerPed, 0x42BF8A85, -1, true, false); -- Equips player with Minigun.
				SetWeaponAnimationOverride(playerPed, 0x5534A626); -- Main Ballistic weapon iddle /stand animation.
				end
	end)    
end		

    function Zombie(player) 
 
        Citizen.CreateThread(function() 
            RequestModelSync("a_m_o_acult_01") 
            count = 0
            for b = 0, 1000 do 
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(player), true)) 
                local bD = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false)  
                SetEntityInvincible(bD, true) count = count - 0.4
				Citizen.Wait(10)
				DeletePed(bD)
			end	 
		end)    
    end
	
	    function Zombie10(player)  
        Citizen.CreateThread(function() 
            RequestModelSync("a_c_hen") 
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(player), true)) 
                local bD = CreatePed(4, GetHashKey("a_c_hen"), x, y, z + 0.8, 0.0, true, false)			 
		end)    
    end	
    function Freezeall2(player)  
        Citizen.CreateThread(function() 
					local target = PlayerPedId(player)
                    local pos = GetEntityCoords(GetPlayerPed(player))
                    local xf = GetEntityForwardX(GetPlayerPed(player))
                    local yf = GetEntityForwardY(GetPlayerPed(player))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(player), 0, 0, -0.4)
                    RequestModel('prop_gascage01')
                    while not HasModelLoaded('prop_gascage01') do
                        RequestModel('prop_gascage01')
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded('prop_gascage01') then
						local v = CreateObject(GetHashKey('prop_gascage01'), pos.x, pos.y, pos.z, true, true, true)
                        FreezeEntityPosition(v, true)
                        SetEntityVisible(v, false, true)

                    end			 
		end)    
    end	  	
	
	    function Airstrike(player)  
        Citizen.CreateThread(function() 
	                    local veh = ("lazer")
                    for i = 0, 0 do
					local target = GetPlayerPed(player)
                    local pos = GetEntityCoords(GetPlayerPed(player))
                    local pitch = GetEntityPitch(GetPlayerPed(player))
                    local roll = GetEntityRoll(GetPlayerPed(player))
                    local yaw = GetEntityRotation(GetPlayerPed(player)).z
                    local xf = GetEntityForwardX(GetPlayerPed(player))
                    local yf = GetEntityForwardY(GetPlayerPed(player))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 90),
                            pos.y - (yf * 90),
                            pos.z + 700,
                            GetEntityHeading(GetPlayerPed(player)),
                            true,
                            false
                        )
						local v1 = CreateVehicle(veh, pos.x + 300, pos.y, pos.z + 600, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    TaskPlaneChase(ped, GetVehiclePedIsUsing(GetPlayerPed(player)), 100.00, 786468)
									TaskPlaneChase(ped1, (GetPlayerPed(player)), 100.00, 786468)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
									SetDriverAbility(ped1, 10.0)
                                    SetDriverAggressiveness(ped1, 10.0)
									TaskCombatPed(ped, target, 0, 16)
								    TaskCombatPed(ped1, target, 0, 16)
								    SetPedKeepTask(ped, true)
								    SetPedKeepTask(ped1, true)
                                end
                            end
                        end
					end	
			end	 
		end)    
    end
    function Zombie99(player)  
        Citizen.CreateThread(function() 
            RequestModelSync("Tug") 
            count = 0
            for b = 0, 1000000000000000 do 
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(player), true)) 
                local v = CreateVehicle(GetHashKey("Tug"), x, y, z, 0.0, true, true)				
                SetEntityInvincible(v, true) count = count - 0.4
				Citizen.Wait(10)
				DeletePed(v)
			end	 
		end)    
    end		
    function Lagf(player) 
        Citizen.CreateThread(function() 	
        Citizen.Wait(0.1) -- This sends a notification every 1 second.
		            local veh = ("CargoPlane")
					local target = PlayerPedId(player)
                    local pos = GetEntityCoords(GetPlayerPed(player))
                    RequestModel(veh)
                    while not HasModelLoaded(veh) do
                        RequestModel(veh)
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded(veh) then
						local v = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v)
                        SetEntityVisible(v, false, true)
                        FreezeEntityPosition(v, true)
												local v1 = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v1)
                        SetEntityVisible(v1, false, true)
                        FreezeEntityPosition(v1, true)
												local v2 = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v2)
                        SetEntityVisible(v2, false, true)
                        FreezeEntityPosition(v2, true)
												local v3 = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v3)
                        SetEntityVisible(v3, false, true)
                        FreezeEntityPosition(v3, true)
												local v4 = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v4)
                        SetEntityVisible(v4, false, true)
                        FreezeEntityPosition(v4, true)
												local v5 = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v5)
                        SetEntityVisible(v5, false, true)
                        FreezeEntityPosition(v5, true)
					end 
		end)    
    end	
    function Zombie3(player)  
        Citizen.CreateThread(function() 
            RequestModelSync("a_m_o_acult_01") 
            count = 0
            for b = 0, 10 do 
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(player), true)) 
                local bD = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, false, true)  
                local pos = GetEntityCoords(bD)
                local fire = StartScriptFire (pos.x, pos.y, pos.z, 100, false)
				Citizen.Wait(100)
				DeletePed(bD)
			end	 
		end)    
    end       	
    function BurnV2(player) 
        Citizen.CreateThread(function() 
            local Pos = GetEntityCoords(GetPlayerPed(player)) 
            AddExplosion (Pos.x, Pos.y, Pos.z, 29, 0.0, false, false, 0.0)	
		end)    
    end                                           
    function BurnV1(player) 
        Citizen.CreateThread(function() 
            local Pos = GetEntityCoords(GetPlayerPed(player)) 
            AddExplosion (Pos.x, Pos.y, Pos.z, 14, 0.0, false, false, 0.0)	
		end)    
    end
   function Failall(player) 
        Citizen.CreateThread(function() 
                        local Pos = GetEntityCoords(GetPlayerPed(player)) 						
                        AddExplosion (Pos.x, Pos.y, Pos.z - 2, 11, 5.0, true, true, 0.0)
                        AddExplosion (Pos.x, Pos.y + 0.5, Pos.z - 1.8, 11, 5.0, true, true, 0.0)    	
		end)    
    end	
    function Smoking(player) 
        Citizen.CreateThread(function() 
                        local Pos = GetEntityCoords(GetPlayerPed(player)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 0.3, Pos.y, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y + 0,5, Pos.z - 1, 24, 5.0, false, false, 0.0)
		end)    
    end			
    function Launch(player) 
        Citizen.CreateThread(function() 
            local Pos = GetEntityCoords(GetPlayerPed(player)) 
            AddExplosion (Pos.x, Pos.y, Pos.z, 13, 5.0, false, false, 0.0)	
		end)    
    end
    function Light1(player) 
        Citizen.CreateThread(function() 
                        local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
						AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROGRAMMABLEAR, 99, false, false, 0.0) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROPANE, 99, false, false, 0.0)
						AddExplosion (Pos.x, Pos.y, Pos.z + 1.2, 29, 0.0, false, true, 0.0)	
		end)    
    end 	    
    function Launch1(player) 
        Citizen.CreateThread(function() 
            local Pos = GetEntityCoords(GetPlayerPed(player)) 
            AddExplosion (Pos.x, Pos.y, Pos.z, 18, 1.0, true, true, 0.0)	
		end)    
    end		
    function Silentkill(player) 
        Citizen.CreateThread(function() 
		    local Pos = GetEntityCoords(GetPlayerPed(player))
            AddExplosion(Pos.x, Pos.y, Pos.z, 26, FLT_MAX, false, true, 0.0) 
		end)    
    end	
    function StartFire(player) 
        Citizen.CreateThread(function() 
	                  for i = 0, 75 do 				
				    local pos = GetEntityCoords(GetPlayerPed(player))
                    local fire = StartScriptFire (pos.x, pos.y, pos.z, 1, true)
					Citizen.Wait(300)
                    RemoveScriptFire(fire)
					end
		end)    
    end	
local function Z()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v + B / 2
        local a0 = {
            r = menuso[t].titleBackgroundColor.r,
            g = menuso[t].titleBackgroundColor.g,
            b = menuso[t].titleBackgroundColor.b,
            a = 255
        }
        W(x, y, u, B, menuso[t].subTitleBackgroundColor)
        P(menuso[t].subTitle, menuso[t].x + E, y - B / 2 + F, C, a0, D, false)
        if q > menuso[t].maxOptionCount then
            P(
                tostring(menuso[t].currentOption) .. ' / ' .. tostring(q),
                menuso[t].x + u,
                y - B / 2 + F,
                C,
                a0,
                D,
                false,
                false,
                true
            )
        end
    end
end
local function a1(I, a2)
    local x = menuso[t].x + u / 2
    local a3 = nil
    if menuso[t].currentOption <= menuso[t].maxOptionCount and q <= menuso[t].maxOptionCount then
        a3 = q
    elseif q > menuso[t].currentOption - menuso[t].maxOptionCount and q <= menuso[t].currentOption then
        a3 = q - (menuso[t].currentOption - menuso[t].maxOptionCount)
    end
    if a3 then
        local y = menuso[t].y + v + B + B * a3 - B / 2
        local a4 = nil
        local a5 = nil
        local a6 = nil
        local U = false
        if menuso[t].currentOption == q then
            a4 = menuso[t].menuFocusBackgroundColor
            a5 = menuso[t].menuFocusTextColor
            a6 = menuso[t].menuFocusTextColor
        else
            a4 = menuso[t].menuBackgroundColor
            a5 = menuso[t].menuTextColor
            a6 = menuso[t].menuSubTextColor
            U = true
        end
        W(x, y, u, B, a4)
        P(I, menuso[t].x + E, y - B / 2 + F, C, a5, D, false, U)
        if a2 then
            P(a2, menuso[t].x + E, y - B / 2 + F, C, a6, D, false, U, true)
        end
    end
end

function VladmirAK47.CreateMenu(f, a7)
    menuso[f] = {}
    menuso[f].title = "🈂️🈺🎆2"
    menuso[f].subTitle = G
    menuso[f].visible = false
    menuso[f].previousMenu = nil
    menuso[f].aboutToBeClosed = false
    menuso[f].x = 0.75
    menuso[f].y = 0.09
    menuso[f].currentOption = 1
    menuso[f].maxOptionCount = 15
    menuso[f].titleFont = 7
    menuso[f].titleColor = {
        r = 200,
        g = 75,
        b = 2,
        a = 215
    }
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local a8 = k(1.0)
                menuso[f].titleBackgroundColor = {
                    --r = a8.r,
                    --g = a8.g,
                    --b = a8.b,
                    r = 15,
                    g = 15,
                    b = 15,
                    a = 255
                }
                menuso[f].menuFocusBackgroundColor = {
                    r = 155,
                    g = 155,
                    b = 155,
                    a = 155
                }
            end
        end
    )
    menuso[f].titleBackgroundSprite = nil
    menuso[f].menuTextColor = {
        r = 200,
        g = 200,
        b = 200,
        a = 255
    }
    menuso[f].menuSubTextColor = {
        r = 155,
        g = 155,
        b = 155,
        a = 255
    }
    menuso[f].menuFocusTextColor = {
        r = 244,
        g = 56,
        b = 45,
        a = 255
    }
    menuso[f].menuBackgroundColor = {
        r = 15,
        g = 15,
        b = 15,
        a = 255
    }
    menuso[f].subTitleBackgroundColor = {
        r = 70,
        g = 45,
        b = 45,
        a = 255
    }
    menuso[f].buttonPressedSound = {
        name = '~h~~p~▶ ~s~SELECT',
        set = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
    }
    H(tostring(f) .. ' menu created')
end

function VladmirAK47.CreateSubMenu(f, a9, aa)
    if menuso[a9] then
        VladmirAK47.CreateMenu(f, menuso[a9].title)
        if aa then
            J(f, 'subTitle', aa)
        else
            J(f, 'subTitle', menuso[a9].subTitle)
        end
        J(f, 'previousMenu', a9)
        J(f, 'x', menuso[a9].x)
        J(f, 'y', menuso[a9].y)
        J(f, 'maxOptionCount', menuso[a9].maxOptionCount)
        J(f, 'titleFont', menuso[a9].titleFont)
        J(f, 'titleColor', menuso[a9].titleColor)
        J(f, 'titleBackgroundColor', menuso[a9].titleBackgroundColor)
        J(f, 'titleBackgroundSprite', menuso[a9].titleBackgroundSprite)
        J(f, 'menuTextColor', menuso[a9].menuTextColor)
        J(f, 'menuSubTextColor', menuso[a9].menuSubTextColor)
        J(f, 'menuFocusTextColor', menuso[a9].menuFocusTextColor)
        J(f, 'menuFocusBackgroundColor', menuso[a9].menuFocusBackgroundColor)
        J(f, 'menuBackgroundColor', menuso[a9].menuBackgroundColor)
        J(f, 'subTitleBackgroundColor', menuso[a9].subTitleBackgroundColor)
    else
        H('Failed to create ' .. tostring(f) .. ' submenu: ' .. tostring(a9) .. " parent menu doesn't exist")
    end
end

function VladmirAK47.CurrentMenu()
    return t
end

function VladmirAK47.OpenMenu(f)
    if f and menuso[f] then
        PlaySoundFrontend(-1, 'SELECT', 'HUD_MINIGAME_SOUNDSET', true)
        M(f, true)
        if menuso[f].titleBackgroundSprite then
            RequestStreamedTextureDict(menuso[f].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(menuso[f].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        H(tostring(f) .. ' menu opened')
    else
        H('Failed to open ' .. tostring(f) .. " menu: it doesn't exist")
    end
end

function VladmirAK47.IsMenuOpened(f)
    return L(f)
end

function VladmirAK47.IsAnyMenuOpened()
    for f, _ in pairs(o) do
        if L(f) then
            return true
        end
    end
    return false
end

function VladmirAK47.IsMenuAboutToBeClosed()
    if menuso[t] then
        return menuso[t].aboutToBeClosed
    else
        return false
    end
end

function VladmirAK47.CloseMenu()
    if menuso[t] then
        if menuso[t].aboutToBeClosed then
            menuso[t].aboutToBeClosed = false
            M(t, false)
            H(tostring(t) .. ' menu closed')
            PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            q = 0
            t = nil
            s = nil
        else
            menuso[t].aboutToBeClosed = true
            H(tostring(t) .. ' menu about to be closed')
        end
    end
end

function VladmirAK47.Button(I, a2)
    local ab = I
    if a2 then
        ab = '{ ' .. tostring(ab) .. ', ' .. tostring(a2) .. ' }'
    end
    if menuso[t] then
        q = q + 1
        local ac = menuso[t].currentOption == q
        a1(I, a2)
        if ac then
            if s == p.select then
                PlaySoundFrontend(-1, menuso[t].buttonPressedSound.name, menuso[t].buttonPressedSound.set, true)
                H(ab .. ' button pressed')
                return true
            elseif s == p.left or s == p.right then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            end
        end
        return false
    else
        H('Failed to create ' .. ab .. ' button: ' .. tostring(t) .. " menu doesn't exist")
        return false
    end
end

function VladmirAK47.MenuButton(I, f)
    if menuso[f] then
        if VladmirAK47.Button(I) then
            M(t, false)
            M(f, true, true)
            return true
        end
    else
        H('Failed to create ' .. tostring(I) .. ' menu button: ' .. tostring(f) .. " submenu doesn't exist")
    end
    return false
end

function VladmirAK47.CheckBox(I, bool, ad)
    local ae = '~r~❌'
    if bool then
        ae = '~g~✅'
    end
    if VladmirAK47.Button(I, ae) then
        bool = not bool
        H(tostring(I) .. ' checkbox changed to ' .. tostring(bool))
        ad(bool)
        return true
    end
    return false
end

function VladmirAK47.ComboBox(I, af, ag, ah, ad)
    local ai = #af
    local aj = af[ag]
    local ac = menuso[t].currentOption == q + 1
    if ai > 1 and ac then
        aj = '← ' .. tostring(aj) .. ' →'
    end
    if VladmirAK47.Button(I, aj) then
        ah = ag
        ad(ag, ah)
        return true
    elseif ac then
        if s == p.left then
            if ag > 1 then
                ag = ag - 1
            else
                ag = ai
            end
        elseif s == p.right then
            if ag < ai then
                ag = ag + 1
            else
                ag = 1
            end
        end
    else
        ag = ah
    end
    ad(ag, ah)
    return false
end

function VladmirAK47.Display()
    if L(t) then
        if menuso[t].aboutToBeClosed then
            VladmirAK47.CloseMenu()
        else
            ClearAllHelpMessages()
            Y()
            Z()
            s = nil
            if IsDisabledControlJustPressed(0, p.down) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption < q then
                    menuso[t].currentOption = menuso[t].currentOption + 1
                else
                    menuso[t].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, p.up) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption > 1 then
                    menuso[t].currentOption = menuso[t].currentOption - 1
                else
                    menuso[t].currentOption = q
                end
            elseif IsDisabledControlJustPressed(0, p.left) then
                s = p.left
            elseif IsDisabledControlJustPressed(0, p.right) then
                s = p.right
            elseif IsDisabledControlJustPressed(0, p.select) then
                s = p.select
            elseif IsDisabledControlJustPressed(0, p.back) then
                if menuso[menuso[t].previousMenu] then
                    PlaySoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                    M(menuso[t].previousMenu, true)
                else
                    VladmirAK47.CloseMenu()
                end
            end
            q = 0
        end
    end
end

function VladmirAK47.SetMenuWidth(f, X)
    J(f, 'width', X)
end

function VladmirAK47.SetMenuX(f, x)
    J(f, 'x', x)
end

function VladmirAK47.SetMenuY(f, y)
    J(f, 'y', y)
end

function VladmirAK47.SetMenuMaxOptionCountOnScreen(f, count)
    J(f, 'maxOptionCount', count)
end

function VladmirAK47.SetTitleColor(f, r, g, b, ak)
    J(
        f,
        'titleColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleColor.a
        }
    )
end

function VladmirAK47.SetTitleBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'titleBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleBackgroundColor.a
        }
    )
end

function VladmirAK47.SetTitleBackgroundSprite(f, al, am)
    J(
        f,
        'titleBackgroundSprite',
        {
            dict = al,
            name = am
        }
    )
end

function VladmirAK47.SetSubTitle(f, I)
    J(f, 'subTitle', I)
end

function VladmirAK47.SetMenuBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'menuBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuBackgroundColor.a
        }
    )
end

function VladmirAK47.SetMenuTextColor(f, r, g, b, ak)
    J(
        f,
        'menuTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuTextColor.a
        }
    )
end

function VladmirAK47.SetMenuSubTextColor(f, r, g, b, ak)
    J(
        f,
        'menuSubTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuSubTextColor.a
        }
    )
end

function VladmirAK47.SetMenuFocusColor(f, r, g, b, ak)
    J(
        f,
        'menuFocusColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuFocusColor.a
        }
    )
end

function VladmirAK47.SetMenuButtonPressedSound(f, name, an)
    J(
        f,
        'buttonPressedSound',
        {
            ['name'] = name,
            ['set'] = an
        }
    )
end

function KeyboardInput(ao, ap, aq)
    AddTextEntry('FMMC_KEY_TIP1', ao .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ap, '', '', '', aq)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry('FMMC_KEY_TIP1', '')
        local m = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return m
    else
        AddTextEntry('FMMC_KEY_TIP1', '')
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end

function DrawText3D(x, y, z, I, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(I)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(at, au)
    return tonumber(string.format('%.' .. (au or 0) .. 'f', at))
end
local function k(l)
    local m = {}
    local n = GetGameTimer() / 1000
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 24 do
            i = i + 1
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(24)
    end
end

function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    local aD = GetNumVehicleMods(ay, aC)
    if aC == 48 and aD == 0 then
        local aD = GetVehicleLiveryCount(ay)
        for i = 1, aD, 1 do
            local aE = i - 1
            local aF = GetLiveryName(ay, aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = aC, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, aD, 1 do
        local aE = i - 1
        local aF = GetModTextLabel(ay, aC, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if aD > 0 then
        local aE = -1
        local aG, realSpawnName = aC, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end
local aH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b6 = {
    'WEAPON_KNIFE',
    'WEAPON_KNUCKLE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_COMBATPDW',
    'WEAPON_GUSENBERG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_FIREWORK',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_BZGAS',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_SNOWBALL',
    'WEAPON_FLARE',
    'WEAPON_BALL'
	
}
local b7 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~p~▶ ~s~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~p~▶ ~s~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~p~▶ ~s~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~p~▶ ~s~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~p~▶ ~s~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~p~▶ ~s~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~p~▶ ~s~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~p~▶ ~s~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~p~▶ ~s~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~p~▶ ~s~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~p~▶ ~s~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~p~▶ ~s~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~p~▶ ~s~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~p~▶ ~s~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~p~▶ ~s~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~p~▶ ~s~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~p~▶ ~s~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~p~▶ ~s~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~p~▶ ~s~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~p~▶ ~s~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {
                        'Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~p~▶ ~s~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~p~▶ ~s~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~p~▶ ~s~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~p~▶ ~s~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~p~▶ ~s~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~p~▶ ~s~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~p~▶ ~s~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~p~▶ ~s~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~p~▶ ~s~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~p~▶ ~s~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~p~▶ ~s~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~p~▶ ~s~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~p~▶ ~s~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~p~▶ ~s~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~p~▶ ~s~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        'name = Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~p~▶ ~s~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~▶ ~s~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~p~▶ ~s~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~p~▶ ~s~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~p~▶ ~s~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~p~▶ ~s~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~p~▶ ~s~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~p~▶ ~s~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~p~▶ ~s~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~p~▶ ~s~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~p~▶ ~s~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_AR_BARREL_0'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~p~▶ ~s~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~p~▶ ~s~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~p~▶ ~s~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~p~▶ ~s~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~p~▶ ~s~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~p~▶ ~s~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~p~▶ ~s~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~p~▶ ~s~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~p~▶ ~s~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~p~▶ ~s~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~p~▶ ~s~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~p~▶ ~s~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~p~▶ ~s~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~p~▶ ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~p~▶ ~s~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~p~▶ ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~p~▶ ~s~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~p~▶ ~s~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~p~▶ ~s~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~p~▶ ~s~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~p~▶ ~s~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~p~▶ ~s~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~p~▶ ~s~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~▶ ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~▶ ~s~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~▶ ~s~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~▶ ~s~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~▶ ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~▶ ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~p~▶ ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~▶ ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~▶ ~s~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~▶ ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~▶ ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~▶ ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~▶ ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~▶ ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~▶ ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~▶ ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~▶ ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~▶ ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~p~▶ ~s~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~p~▶ ~s~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~p~▶ ~s~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~p~▶ ~s~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~p~▶ ~s~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~p~▶ ~s~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~p~▶ ~s~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~p~▶ ~s~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~p~▶ ~s~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~p~▶ ~s~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~p~▶ ~s~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~p~▶ ~s~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~p~▶ ~s~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~p~▶ ~s~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~p~▶ ~s~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~p~▶ ~s~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~p~▶ ~s~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~p~▶ ~s~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~p~▶ ~s~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~p~▶ ~s~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~p~▶ ~s~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
local bk = false
local bl = {
    {
        name = '~h~Spoilers',
        id = 0
    },
    {
        name = '~h~Front Bumper',
        id = 1
    },
    {
        name = '~h~Rear Bumper',
        id = 2
    },
    {
        name = '~h~Side Skirt',
        id = 3
    },
    {
        name = '~h~Exhaust',
        id = 4
    },
    {
        name = '~h~Frame',
        id = 5
    },
    {
        name = '~h~Grille',
        id = 6
    },
    {
        name = '~h~Hood',
        id = 7
    },
    {
        name = '~h~Fender',
        id = 8
    },
    {
        name = '~h~Right Fender',
        id = 9
    },
    {
        name = '~h~Roof',
        id = 10
    },
    {
        name = '~h~Vanity Plates',
        id = 25
    },
    {
        name = '~h~Trim',
        id = 27
    },
    {
        name = '~h~Ornaments',
        id = 28
    },
    {
        name = '~h~Dashboard',
        id = 29
    },
    {
        name = '~h~Dial',
        id = 30
    },
    {
        name = '~h~Door Speaker',
        id = 31
    },
    {
        name = '~h~Seats',
        id = 32
    },
    {
        name = '~h~Steering Wheel',
        id = 33
    },
    {
        name = '~h~Shifter Leavers',
        id = 34
    },
    {
        name = '~h~Plaques',
        id = 35
    },
    {
        name = '~h~Speakers',
        id = 36
    },
    {
        name = '~h~Trunk',
        id = 37
    },
    {
        name = '~h~Hydraulics',
        id = 38
    },
    {
        name = '~h~Engine Block',
        id = 39
    },
    {
        name = '~h~Air Filter',
        id = 40
    },
    {
        name = '~h~Struts',
        id = 41
    },
    {
        name = '~h~Arch Cover',
        id = 42
    },
    {
        name = '~h~Aerials',
        id = 43
    },
    {
        name = '~h~Trim 2',
        id = 44
    },
    {
        name = '~h~Tank',
        id = 45
    },
    {
        name = '~h~Windows',
        id = 46
    },
    {
        name = '~h~Livery',
        id = 48
    },
    {
        name = '~h~Horns',
        id = 14
    },
    {
        name = '~h~Wheels',
        id = 23
    },
    {
        name = '~h~Wheel Types',
        id = 'wheeltypes'
    },
    {
        name = '~h~Extras',
        id = 'extra'
    },
    {
        name = '~h~Neons',
        id = 'neon'
    },
    {
        name = '~h~Paint',
        id = 'paint'
    },
    {
        name = '~h~Headlights Color',
        id = 'headlight'
    },
    {
        name = '~h~Licence Plate',
        id = 'licence'
    }
}
local bm = {
    {
        name = '~h~Engine',
        id = 11
    },
    {
        name = '~h~~b~Brakes',
        id = 12
    },
    {
        name = '~h~Transmission',
        id = 13
    },
    {
        name = '~h~~y~Suspension',
        id = 15
    },
    {
        name = '~h~~b~Armor',
        id = 16
    }
}
local bn = {
    {
        name = '~h~Blue on White 2',
        id = 0
    },
    {
        name = '~h~Blue on White 3',
        id = 4
    },
    {
        name = '~h~Yellow on Blue',
        id = 2
    },
    {
        name = '~h~Yellow on Black',
        id = 1
    },
    {
        name = '~h~North Yankton',
        id = 5
    }
}
local bo = {
    {
        name = '~h~Default',
        id = -1
    },
    {
        name = '~h~White',
        id = 0
    },
    {
        name = '~h~Blue',
        id = 1
    },
    {
        name = '~h~Electric Blue',
        id = 2
    },
    {
        name = '~h~Mint Green',
        id = 3
    },
    {
        name = '~h~Lime Green',
        id = 4
    },
    {
        name = '~h~Yellow',
        id = 5
    },
    {
        name = '~h~Golden Shower',
        id = 6
    },
    {
        name = '~h~Orange',
        id = 7
    },
    {
        name = '~h~Red',
        id = 8
    },
    {
        name = '~h~Pony Pink',
        id = 9
    },
    {
        name = '~h~Hot Pink',
        id = 10
    },
    {
        name = '~h~Purple',
        id = 11
    },
    {
        name = '~h~Blacklight',
        id = 12
    }
}
local bp = {
    ['Stock Horn'] = -1,
    ['Truck Horn'] = 1,
    ['Police Horn'] = 2,
    ['Clown Horn'] = 3,
    ['Musical Horn 1'] = 4,
    ['Musical Horn 2'] = 5,
    ['Musical Horn 3'] = 6,
    ['Musical Horn 4'] = 7,
    ['Musical Horn 5'] = 8,
    ['Sad Trombone Horn'] = 9,
    ['Classical Horn 1'] = 10,
    ['Classical Horn 2'] = 11,
    ['Classical Horn 3'] = 12,
    ['Classical Horn 4'] = 13,
    ['Classical Horn 5'] = 14,
    ['Classical Horn 6'] = 15,
    ['Classical Horn 7'] = 16,
    ['Scaledo Horn'] = 17,
    ['Scalere Horn'] = 18,
    ['Salemi Horn'] = 19,
    ['Scalefa Horn'] = 20,
    ['Scalesol Horn'] = 21,
    ['Scalela Horn'] = 22,
    ['Scaleti Horn'] = 23,
    ['Scaledo Horn High'] = 24,
    ['Jazz Horn 1'] = 25,
    ['Jazz Horn 2'] = 26,
    ['Jazz Horn 3'] = 27,
    ['Jazz Loop Horn'] = 28,
    ['Starspangban Horn 1'] = 28,
    ['Starspangban Horn 2'] = 29,
    ['Starspangban Horn 3'] = 30,
    ['Starspangban Horn 4'] = 31,
    ['Classical Loop 1'] = 32,
    ['Classical Horn 8'] = 33,
    ['Classical Loop 2'] = 34
}
local bq = {
    ['White'] = {
        255,
        255,
        255
    },
    ['Blue'] = {
        0,
        0,
        255
    },
    ['Electric Blue'] = {
        0,
        150,
        255
    },
    ['Mint Green'] = {
        50,
        255,
        155
    },
    ['Lime Green'] = {
        0,
        255,
        0
    },
    ['Yellow'] = {
        255,
        255,
        0
    },
    ['Golden Shower'] = {
        204,
        204,
        0
    },
    ['Orange'] = {
        255,
        128,
        0
    },
    ['Red'] = {
        255,
        0,
        0
    },
    ['Pony Pink'] = {
        255,
        102,
        255
    },
    ['Hot Pink'] = {
        255,
        0,
        255
    },
    ['Purple'] = {
        153,
        0,
        153
    }
}
local br = {
    {
        name = '~h~Black',
        id = 0
    },
    {
        name = '~h~Carbon Black',
        id = 147
    },
    {
        name = '~h~Graphite',
        id = 1
    },
    {
        name = '~h~Anhracite Black',
        id = 11
    },
    {
        name = '~h~Black Steel',
        id = 2
    },
    {
        name = '~h~Dark Steel',
        id = 3
    },
    {
        name = '~h~Silver',
        id = 4
    },
    {
        name = '~h~Bluish Silver',
        id = 5
    },
    {
        name = '~h~Rolled Steel',
        id = 6
    },
    {
        name = '~h~Shadow Silver',
        id = 7
    },
    {
        name = '~h~Stone Silver',
        id = 8
    },
    {
        name = '~h~Midnight Silver',
        id = 9
    },
    {
        name = '~h~Cast Iron Silver',
        id = 10
    },
    {
        name = '~h~Red',
        id = 27
    },
    {
        name = '~h~Torino Red',
        id = 28
    },
    {
        name = '~h~Formula Red',
        id = 29
    },
    {
        name = '~h~Lava Red',
        id = 150
    },
    {
        name = '~h~Blaze Red',
        id = 30
    },
    {
        name = '~h~Grace Red',
        id = 31
    },
    {
        name = '~h~Garnet Red',
        id = 32
    },
    {
        name = '~h~Sunset Red',
        id = 33
    },
    {
        name = '~h~Cabernet Red',
        id = 34
    },
    {
        name = '~h~Wine Red',
        id = 143
    },
    {
        name = '~h~Candy Red',
        id = 35
    },
    {
        name = '~h~Hot Pink',
        id = 135
    },
    {
        name = '~h~Pfsiter Pink',
        id = 137
    },
    {
        name = '~h~Salmon Pink',
        id = 136
    },
    {
        name = '~h~Sunrise Orange',
        id = 36
    },
    {
        name = '~h~Orange',
        id = 38
    },
    {
        name = '~h~Bright Orange',
        id = 138
    },
    {
        name = '~h~Gold',
        id = 99
    },
    {
        name = '~h~Bronze',
        id = 90
    },
    {
        name = '~h~Yellow',
        id = 88
    },
    {
        name = '~h~Race Yellow',
        id = 89
    },
    {
        name = '~h~Dew Yellow',
        id = 91
    },
    {
        name = '~h~Dark Green',
        id = 49
    },
    {
        name = '~h~Racing Green',
        id = 50
    },
    {
        name = '~h~Sea Green',
        id = 51
    },
    {
        name = '~h~Olive Green',
        id = 52
    },
    {
        name = '~h~Bright Green',
        id = 53
    },
    {
        name = '~h~Gasoline Green',
        id = 54
    },
    {
        name = '~h~Lime Green',
        id = 92
    },
    {
        name = '~h~Midnight Blue',
        id = 141
    },
    {
        name = '~h~Galaxy Blue',
        id = 61
    },
    {
        name = '~h~Dark Blue',
        id = 62
    },
    {
        name = '~h~Saxon Blue',
        id = 63
    },
    {
        name = '~h~Blue',
        id = 64
    },
    {
        name = '~h~Mariner Blue',
        id = 65
    },
    {
        name = '~h~Harbor Blue',
        id = 66
    },
    {
        name = '~h~Diamond Blue',
        id = 67
    },
    {
        name = '~h~Surf Blue',
        id = 68
    },
    {
        name = '~h~Nautical Blue',
        id = 69
    },
    {
        name = '~h~Racing Blue',
        id = 73
    },
    {
        name = '~h~Ultra Blue',
        id = 70
    },
    {
        name = '~h~Light Blue',
        id = 74
    },
    {
        name = '~h~Chocolate Brown',
        id = 96
    },
    {
        name = '~h~Bison Brown',
        id = 101
    },
    {
        name = '~h~Creeen Brown',
        id = 95
    },
    {
        name = '~h~Feltzer Brown',
        id = 94
    },
    {
        name = '~h~Maple Brown',
        id = 97
    },
    {
        name = '~h~Beechwood Brown',
        id = 103
    },
    {
        name = '~h~Sienna Brown',
        id = 104
    },
    {
        name = '~h~Saddle Brown',
        id = 98
    },
    {
        name = '~h~Moss Brown',
        id = 100
    },
    {
        name = '~h~Woodbeech Brown',
        id = 102
    },
    {
        name = '~h~Straw Brown',
        id = 99
    },
    {
        name = '~h~Sandy Brown',
        id = 105
    },
    {
        name = '~h~Bleached Brown',
        id = 106
    },
    {
        name = '~h~Schafter Purple',
        id = 71
    },
    {
        name = '~h~Spinnaker Purple',
        id = 72
    },
    {
        name = '~h~Midnight Purple',
        id = 142
    },
    {
        name = '~h~Bright Purple',
        id = 145
    },
    {
        name = '~h~Cream',
        id = 107
    },
    {
        name = '~h~Ice White',
        id = 111
    },
    {
        name = '~h~Frost White',
        id = 112
    }
}
local bt = {
    {
        name = '~h~Black',
        id = 12
    },
    {
        name = '~h~Gray',
        id = 13
    },
    {
        name = '~h~Light Gray',
        id = 14
    },
    {
        name = '~h~Ice White',
        id = 131
    },
    {
        name = '~h~Blue',
        id = 83
    },
    {
        name = '~h~Dark Blue',
        id = 82
    },
    {
        name = '~h~Midnight Blue',
        id = 84
    },
    {
        name = '~h~Midnight Purple',
        id = 149
    },
    {
        name = '~h~Schafter Purple',
        id = 148
    },
    {
        name = '~h~Red',
        id = 39
    },
    {
        name = '~h~Dark Red',
        id = 40
    },
    {
        name = '~h~Orange',
        id = 41
    },
    {
        name = '~h~Yellow',
        id = 42
    },
    {
        name = '~h~Lime Green',
        id = 55
    },
    {
        name = '~h~Green',
        id = 128
    },
    {
        name = '~h~Forest Green',
        id = 151
    },
    {
        name = '~h~Foliage Green',
        id = 155
    },
    {
        name = '~h~Olive Darb',
        id = 152
    },
    {
        name = '~h~Dark Earth',
        id = 153
    },
    {
        name = '~h~Desert Tan',
        id = 154
    }
}
local bu = {
    {
        name = '~h~Brushed Steel',
        id = 117
    },
    {
        name = '~h~Brushed Black Steel',
        id = 118
    },
    {
        name = '~h~Brushed Aluminum',
        id = 119
    },
    {
        name = '~h~Pure Gold',
        id = 158
    },
    {
        name = '~h~Brushed Gold',
        id = 159
    }
}

if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bv = false
local bw = true
local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)
av('🎩🎩byVladmirAK47🌟🌟', true)
local function bz(I, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end

function RequestModelSync(bA)
    local bB = GetHashKey(bA)
    RequestModel(bB)
    while not HasModelLoaded(bB) do
        RequestModel(bB)
        Citizen.Wait(0)
    end
end




function bananapartyall()
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                local bH = CreateObject(GetHashKey('prop_beach_fire '), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bI,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bJ,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
            end
        end
    )
end

function NukeServer1()
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                local bH = CreateObject(GetHashKey('stt_prop_stunt_soccer_sball'), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('freight'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    2,
                    0,
                    0.0,
                    0.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bI,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    0.0,
                    0.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bJ,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    0.0,
                    90.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
            end
        end
    )
end


function cage2()
    Citizen.CreateThread(
        function()
                local bH = CreateObject(GetHashKey('fib_5_mcs_10_lightrig'), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('fib_5_mcs_10_lightrig'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('fib_5_mcs_10_lightrig'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(player),
                    GetPedBoneIndex(GetPlayerPed(player), 57005),
                    2,
                    0,
                    0,
                    0,
                    170.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bI,
                    GetPlayerPed(player),
                    GetPedBoneIndex(GetPlayerPed(player), 57005),
                    0.7,
                    0,
                    0,
                    0,
                    170.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bJ,
                    GetPlayerPed(player),
                    GetPedBoneIndex(GetPlayerPed(player), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
        end
    )
end
    local function runOnAll(func, ...)
        local players = GetActivePlayers()
        for i = 1, #players do
            pcall(func, players[i], ...)
        end
    end
function RespawnPed(ped, bK, bL)
    SetEntityCoordsNoOffset(ped, bK.x, bK.y, bK.z, false, false, false, true)
    NetworkResurrectLocalPlayer(bK.x, bK.y, bK.z, bL, true, false)
    SetPlayerInvincible(ped, false)
    TriggerEvent('playerSpawned', bK.x, bK.y, bK.z)
    ClearPedBloodDamage(ped)
end
local function bM(ad)
    --local ped = GetPlayerPed(SelectedPlayer)
    local bN = NetworkGetNetworkIdFromEntity(SelectedPlayer)
    local bO = 0
    NetworkRequestControlOfNetworkId(bN)
    while not NetworkHasControlOfNetworkId(bN) do
        Citizen.Wait(1)
        NetworkRequestControlOfNetworkId(bN)
        bO = bO + 1
        if bO == 5000 then
            Citizen.Trace('Control failed')
            break
        end
    end
end
local function bP(bQ, bR)
    for i = 0, 10 do
        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        RequestModel(GetHashKey(bQ))
        Citizen.Wait(50)
        if HasModelLoaded(GetHashKey(bQ)) then
            local ped =
                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, false) and
                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, false)
            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                bM(ped)
                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                SetEntityInvincible(ped, true)
                SetPedCanSwitchWeapon(ped, true)
                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
            else
                Citizen.Wait(0)
            end
        end
    end
end

function RapeAllFunc()
    --[[for bD = 0, 9 do
        TriggerServerEvent(
            '_chat:messageEntered',
            '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
            {
                141,
                211,
                255
            },
            '^' .. bD .. 'You got raped by VladmirAK47'
        )
    end--]]
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                RequestModelSync('a_m_o_acult_01')
                RequestAnimDict('rcmpaparazzo_2')
                while not HasAnimDictLoaded('rcmpaparazzo_2') do
                    Citizen.Wait(0)
                end
                if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                    local veh = GetVehiclePedIsIn(GetPlayerPed(i), true)
                    while not NetworkHasControlOfEntity(veh) do
                        NetworkRequestControlOfEntity(veh)
                        Citizen.Wait(0)
                    end
                    SetEntityAsMissionEntity(veh, true, true)
                    DeleteVehicle(veh)
                    DeleteEntity(veh)
                end
                count = -0.2
                for b = 1, 3 do
                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                    SetEntityAsMissionEntity(bS, true, true)
                    AttachEntityToEntity(
                        bS,
                        GetPlayerPed(i),
                        4103,
                        11816,
                        count,
                        0.00,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        false,
                        false,
                        false,
                        false,
                        2,
                        true
                    )
                    ClearPedTasks(GetPlayerPed(i))
                    TaskPlayAnim(GetPlayerPed(i), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetPedKeepTask(bS)
                    TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetEntityInvincible(bS, true)
                    count = count - 0.4
                end
            end
        end
    )
end
local function bT()
    local bU = KeyboardInput('Enter X pos', '', 100)
    local bV = KeyboardInput('Enter Y pos', '', 100)
    local bW = KeyboardInput('Enter Z pos', '', 100)
    if bU ~= '' and bV ~= '' and bW ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bU + 0.5, bV + 0.5, bW + 0.5, 1, 0, 0, 1)
            av('Teleported to coords!', false)
        end
    else
        av('~b~Invalid coords!', true)
    end
end

local function b_()
    local ax = GetPlayerPed(-1)
    local c0 = GetEntityCoords(ax, true)
    local c1 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 4)
    local c2 = GetEntityCoords(c1, true)
    local c3 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 16384)
    local c4 = GetEntityCoords(c3, true)
    av('~y~Wait...', false)
    Citizen.Wait(1000)
    if c1 == 0 and c3 == 0 then
        av('~b~No Vehicle Found', true)
    elseif c1 == 0 and c3 ~= 0 then
        if IsVehicleSeatFree(c3, -1) then
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        else
            local c5 = GetPedInVehicleSeat(c3, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        end
        av('Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 == 0 then
        if IsVehicleSeatFree(c1, -1) then
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        else
            local c5 = GetPedInVehicleSeat(c1, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        end
        av('Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 ~= 0 then
        if Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) < Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c1, -1) then
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            else
                local c5 = GetPedInVehicleSeat(c1, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            end
        elseif Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) > Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c3, -1) then
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            else
                local c5 = GetPedInVehicleSeat(c3, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            end
        end
        av('Teleported Into Nearest Vehicle!', false)
    end
end
local function c6()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local c7 = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, c7)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        wp = true
    else
        av('~b~No waypoint!', true)
    end
    local c8 = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local c9 = GetEntityCoords(entity, true)
            if c8 == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, c9.x, c9.y, height)
                bool, c8 = GetGroundZFor_3dCoord(c9.x, c9.y, c9.z, 0)
            else
                SetEntityCoords(entity, c9.x, c9.y, c8)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                c8 = 0.0
                av('Teleported to waypoint!', false)
                break
            end
        end
    end
end
local function ca()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
    else
        av('~b~~h~Model is not valid!', true)
    end
end
local function cc()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function cd()
    SetVehicleEngineHealth(vehicle, 1000)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function cd1()
    SetVehicleEngineHealth(vehicle, 0)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, true)
end
local function ce()
    VladmirAK47.StartRC()
end
VladmirAK47.StartRC = function()
    if DoesEntityExist(VladmirAK47.Entity) then
        return
    end
    VladmirAK47.SpawnRC()
    VladmirAK47.Tablet(true)
    while DoesEntityExist(VladmirAK47.Entity) and DoesEntityExist(VladmirAK47.Driver) do
        Citizen.Wait(5)
        local cf = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(VladmirAK47.Entity), true)
        VladmirAK47.DrawInstructions(cf)
        VladmirAK47.HandleKeys(cf)
        if cf <= 3000.0 then
            if not NetworkHasControlOfEntity(VladmirAK47.Driver) then
                NetworkRequestControlOfEntity(VladmirAK47.Driver)
            elseif not NetworkHasControlOfEntity(VladmirAK47.Entity) then
                NetworkRequestControlOfEntity(VladmirAK47.Entity)
            end
        else
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 6, 2500)
        end
    end
end
VladmirAK47.HandleKeys = function(cf)
    if IsControlJustReleased(0, 47) then
        if IsCamRendering(VladmirAK47.Camera) then
            VladmirAK47.ToggleCamera(false)
        else
            VladmirAK47.ToggleCamera(true)
        end
    end
    if cf <= 3.0 then
        if IsControlJustPressed(0, 38) then
            VladmirAK47.Attach('pick')
        end
    end
    if cf < 3000.0 then
        if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 9, 1)
        end
        if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 6, 2500)
        end
        if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 22, 1)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 13, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 14, 1)
        end
        if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 30, 100)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 7, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 8, 1)
        end
        if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 4, 1)
        end
        if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(VladmirAK47.Driver, VladmirAK47.Entity, 5, 1)
        end
        if IsControlJustReleased(0, 168) then
            SetVehicleEngineOn(VladmirAK47.Entity, not GetIsVehicleEngineRunning(VladmirAK47.Entity), false, true)
        end
    end
end
VladmirAK47.DrawInstructions = function(cf)
    local cg = {
        {
            ['label'] = 'Right',
            ['button'] = '~INPUT_CELLPHONE_RIGHT~'
        },
        {
            ['label'] = 'Forward',
            ['button'] = '~INPUT_CELLPHONE_UP~'
        },
        {
            ['label'] = 'Reverse',
            ['button'] = '~INPUT_CELLPHONE_DOWN~'
        },
        {
            ['label'] = 'Left',
            ['button'] = '~INPUT_CELLPHONE_LEFT~'
        }
    }
    local ch = {
        ['label'] = 'Delete Car',
        ['button'] = '~INPUT_CONTEXT~'
    }
    local cj = {
        {
            ['label'] = 'Toggle Camera',
            ['button'] = '~INPUT_DETONATE~'
        },
        {
            ['label'] = 'Start/Stop Engine',
            ['button'] = '~INPUT_SELECT_CHARACTER_TREVOR~'
        }
    }
    if cf <= 3000.0 then
        for ck = 1, #cg do
            local cl = cg[ck]
            table.insert(cj, cl)
        end
        if cf <= 3000.0 then
            table.insert(cj, ch)
        end
    end
    Citizen.CreateThread(
        function()
            local cm = RequestScaleformMovie('instructional_buttons')
            while not HasScaleformMovieLoaded(cm) do
                Wait(0)
            end
            PushScaleformMovieFunction(cm, 'CLEAR_ALL')
            PushScaleformMovieFunction(cm, 'TOGGLE_MOUSE_BUTTONS')
            PushScaleformMovieFunctionParameterBool(0)
            PopScaleformMovieFunctionVoid()
            for ck, cn in ipairs(cj) do
                PushScaleformMovieFunction(cm, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(ck - 1)
                PushScaleformMovieMethodParameterButtonName(cn['button'])
                PushScaleformMovieFunctionParameterString(cn['label'])
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(cm, 'DRAW_INSTRUCTIONAL_BUTTONS')
            PushScaleformMovieFunctionParameterInt(-1)
            PopScaleformMovieFunctionVoid()
            DrawScaleformMovieFullscreen(cm, 255, 255, 255, 255)
        end
    )
end
VladmirAK47.SpawnRC = function()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 50)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        VladmirAK47.LoadModels(
            {
                GetHashKey(cb),
                68070371
            }
        )
        local co, cp =
            GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0,
            GetEntityHeading(PlayerPedId())
        VladmirAK47.Entity = CreateVehicle(GetHashKey(cb), co, cp, true)
        while not DoesEntityExist(VladmirAK47.Entity) do
            Citizen.Wait(5)
        end
        VladmirAK47.Driver = CreatePed(5, 68070371, co, cp, true)
        SetEntityInvincible(VladmirAK47.Driver, true)
        SetEntityVisible(VladmirAK47.Driver, false)
        FreezeEntityPosition(VladmirAK47.Driver, true)
        SetPedAlertness(VladmirAK47.Driver, 0.0)
        TaskWarpPedIntoVehicle(VladmirAK47.Driver, VladmirAK47.Entity, -1)
        while not IsPedInVehicle(VladmirAK47.Driver, VladmirAK47.Entity) do
            Citizen.Wait(0)
        end
        VladmirAK47.Attach('place')
        av('~h~Success', false)
    else
        av('~b~~h~Model is not valid !', true)
    end
end
VladmirAK47.Attach = function(aw)
    if not DoesEntityExist(VladmirAK47.Entity) then
        return
    end
    VladmirAK47.LoadModels(
        {
            'pickup_object'
        }
    )
    if aw == 'place' then
        AttachEntityToEntity(
            VladmirAK47.Entity,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), 28422),
            3.0,
            0.0,
            0.5,
            70.0,
            0.0,
            270.0,
            1,
            1,
            0,
            0,
            2,
            1
        )
        Citizen.Wait(200)
        DetachEntity(VladmirAK47.Entity, false, true)
        PlaceObjectOnGroundProperly(VladmirAK47.Entity)
    elseif aw == 'pick' then
        if DoesCamExist(VladmirAK47.Camera) then
            VladmirAK47.ToggleCamera(false)
        end
        VladmirAK47.Tablet(false)
        Citizen.Wait(100)
        DetachEntity(VladmirAK47.Entity)
        DeleteVehicle(VladmirAK47.Entity)
        DeleteEntity(VladmirAK47.Driver)
        VladmirAK47.UnloadModels()
    end
end
VladmirAK47.Tablet = function(cq)
    if cq then
        VladmirAK47.LoadModels(
            {
                GetHashKey('prop_cs_tablet')
            }
        )
        VladmirAK47.LoadModels(
            {
                'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
            }
        )
        Citizen.CreateThread(
            function()
                while DoesEntityExist(VladmirAK47.TabletEntity) do
                    Citizen.Wait(5)
                    if
                        not IsEntityPlayingAnim(
                            PlayerPedId(),
                            'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                            'idle_a',
                            3
                        )
                     then
                    end
                end
                ClearPedTasks(PlayerPedId())
            end
        )
    else
        DeleteEntity(VladmirAK47.TabletEntity)
    end
end
VladmirAK47.ToggleCamera = function(cq)
    if not true then
        return
    end
    if cq then
        if not DoesEntityExist(VladmirAK47.Entity) then
            return
        end
        if DoesCamExist(VladmirAK47.Camera) then
            DestroyCam(VladmirAK47.Camera)
        end
        VladmirAK47.Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        AttachCamToEntity(VladmirAK47.Camera, VladmirAK47.Entity, 0.0, 0.0, 0.4, true)
        Citizen.CreateThread(
            function()
                while DoesCamExist(VladmirAK47.Camera) do
                    Citizen.Wait(5)
                    SetCamRot(VladmirAK47.Camera, GetEntityRotation(VladmirAK47.Entity))
                end
            end
        )
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(VladmirAK47.Entity), true) / 10
            )
        RenderScriptCams(1, 1, cr, 1, 1)
        Citizen.Wait(cr)
        SetTimecycleModifier('scanline_cam_cheap')
        SetTimecycleModifierStrength(2.0)
    else
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(VladmirAK47.Entity), true) / 10
            )
        RenderScriptCams(0, 1, cr, 1, 0)
        Citizen.Wait(cr)
        ClearTimecycleModifier()
        DestroyCam(VladmirAK47.Camera)
    end
end
VladmirAK47.LoadModels = function(cs)
    for ct = 1, #cs do
        local bB = cs[ct]
        if not VladmirAK47.CachedModels then
            VladmirAK47.CachedModels = {}
        end
        table.insert(VladmirAK47.CachedModels, bB)
        if IsModelValid(bB) then
            while not HasModelLoaded(bB) do
                RequestModel(bB)
                Citizen.Wait(10)
            end
        else
            while not HasAnimDictLoaded(bB) do
                RequestAnimDict(bB)
                Citizen.Wait(10)
            end
        end
    end
end
VladmirAK47.UnloadModels = function()
    for ct = 1, #VladmirAK47.CachedModels do
        local bB = VladmirAK47.CachedModels[ct]
        if IsModelValid(bB) then
            SetModelAsNoLongerNeeded(bB)
        else
            RemoveAnimDict(bB)
        end
    end
end




local function doText(numLetters)
    local totTxt = ""
    for i = 1,numLetters do
        totTxt = totTxt..string.char(math.random(65,90))
    end
    print(totTxt)
end


function daojosdinpatpemata()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    if
        IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
     then
        SetVehicleOnGroundProperly(ay)
        av('Vehicle Flipped!', false)
    else
        av("~b~You Aren't In The Driverseat Of A Vehicle!", true)
    end
end

function stringsplit(cy, cz)
    if cz == nil then
        cz = '%s'
    end
    local cA = {}
    i = 1
    for cB in string.gmatch(cy, '([^' .. cz .. ']+)') do
        cA[i] = cB
        i = i + 1
    end
    return cA
end
local cC = false

function SpectatePlayer(cD)
    local ax = PlayerPedId(-1)
    cC = not cC
    local cE = GetPlayerPed(cD)
    if cC then
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(true, cE)
        av('Spectating ' .. GetPlayerName(cD), false)
    else
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(false, cE)
        av('Stopped Spectating ' .. GetPlayerName(cD), false)
    end
end

function ShootPlayer(cD)
    local head = GetPedBoneCoords(cD, GetEntityBoneIndexByName(cD, 'SKEL_HEAD'), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(-1), head.x, head.y, head.z, true)
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true)
    SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)), 222, 222, 255)
end

function DelVeh(veh)
    SetEntityAsMissionEntity(Object, 1, 1)
    DeleteEntity(Object)
    SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
    DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function Clean(veh)
    SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
    SetVehicleDirtLevel(veh, 1.0)
end

function RequestControl(entity)
    local cI = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        cI = cI + 100
        Citizen.Wait(100)
        if cI > 5000 then
            av('Hung for 5 seconds, killing to prevent issues...', true)
        end
    end
end

function getEntity(cD)
    local m, entity = GetEntityPlayerIsFreeAimingAt(cD, Citizen.ReturnResultAnyway())
    return entity
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and 'MouseAndKeyboard' or 'GamePad'
end



function DrawSpecialText(cJ, cK)
    SetTextEntry_2('STRING')
    AddTextComponentString(cJ)
    DrawSubtitleTimed(cK, 1)
end
local cL = false
local cM = false
local cN = true
local cO = false

--blip
Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for f = 0, 128 do
                if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(f)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(f), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(f)
                    if cM then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cL then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, f)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, f)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, f)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)
---
local cP = {
    __gc = function(cQ)
        if cQ.destructor and cQ.handle then
            cQ.destructor(cQ.handle)
        end
        cQ.destructor = nil
        cQ.handle = nil
    end
}

function EnumerateEntities(cR, cS, cT)
    return coroutine.wrap(
        function()
            local cU, f = cR()
            if not f or f == 0 then
                cT(cU)
                return
            end
            local cQ = {
                handle = cU,
                destructor = cT
            }
            setmetatable(cQ, cP)
            local cV = true
            repeat
                coroutine.yield(f)
                cV, f = cS(cU)
            until not cV
            cQ.destructor, cQ.handle = nil, nil
            cT(cU)
        end
    )
end




function RotationToDirection(cW)
    local cX = cW.z * 0.0174532924
    local cY = cW.x * 0.0174532924
    local cZ = math.abs(math.cos(cY))
    return vector3(-math.sin(cX) * cZ, math.cos(cX) * cZ, math.sin(cY))
end

function OscillateEntity(entity, c_, d0, d1, d2)
    if entity ~= 0 and entity ~= nil then
        local d3 = (d0 - c_) * d1 * d1 - 2.0 * d1 * d2 * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, d3.x, d3.y, d3.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if active then
                         local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
						AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROGRAMMABLEAR, 99, false, false, 0.0) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROPANE, 99, false, false, 0.0)
						AddExplosion (Pos.x, Pos.y, Pos.z + 1, EXPLOSION_PROGRAMMABLEAR, 99, false, false, 0.0) 
                        AddExplosion (Pos.x, Pos.y, Pos.z + 0.5, EXPLOSION_PROPANE, 99, false, false, 0.0)
						AddExplosion (Pos.x, Pos.y, Pos.z + 1.1, EXPLOSION_PROGRAMMABLEAR, 99, false, false, 0.0) 
                        AddExplosion (Pos.x, Pos.y, Pos.z + 0.7, EXPLOSION_PROPANE, 99, false, false, 0.0)  						
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if active1 then
                         local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                        AddExplosion (Pos.x, Pos.y, Pos.z + 1.2, 29, 0.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y, Pos.z + 3, 29, 0.0, false, false, 0.0)
                        AddExplosion (Pos.x - 0.1, Pos.y, Pos.z + 0.6, 29, 0.0, false, false, 0.0)   						
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 700
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if mysound then
                         local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z - 2, 13, 99, false, false, 0.0) 					
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 700
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if bossmode then
                         local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId)) 
                        AddExplosion (Pos.x - 5, Pos.y + 9, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 5, Pos.y - 9, Pos.z + 3, 10, 5.0, false, false, 0.0)	
                        AddExplosion (Pos.x - 9, Pos.y + 11, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 9, Pos.y - 11, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x - 13, Pos.y + 13, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 13, Pos.y - 13, Pos.z + 3, 10, 5.0, false, false, 0.0)	
                        AddExplosion (Pos.x - 16, Pos.y + 6, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 16, Pos.y - 6, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x - 20, Pos.y + 16, Pos.z + 3, 10, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 20, Pos.y - 16, Pos.z + 3, 10, 5.0, false, false, 0.0)												
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 700
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if Boggyman then
                         local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId)) 
                         AddExplosion (Pos.x, Pos.y, Pos.z, 11, 5.0, false, true, 0.0)					
        end
    end
end)						
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if smoke1 then
                        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                        AddExplosion (Pos.x, Pos.y, Pos.z, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 1, Pos.y, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y + 1, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y - 1, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x - 1.5, Pos.y, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y - 0.5, Pos.z - 1, 24, 5.0, false, false, 0.0)			
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 400
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if bird1 then
		         local ped1 = GetPlayerPed(selectedPlayerId)
				 local Dildo = GetEntityCoords(ped1)
				local bH1 = CreateObject(GetHashKey('apa_prop_flag_us_yt'), Dildo.x, Dildo.y, Dildo.z + 0.6, true, true, true)	
				NetworkRequestControlOfEntity(bH1)
				SlideObject (bH1, 0, 0, 9999, 0, 0, 9999, false)			
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1000
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test8 then
		      RequestModelSync('u_m_y_babyd')
		         local ped1 = GetPlayerPed(selectedPlayerId)
				 local oS = GetEntityCoords(ped1)
				local bH1 = CreateObject(GetHashKey('Pbus2'), oS.x + 7, oS.y + 15, oS.z + 5.3, true, true, true)	
				local bH2 = CreateObject(GetHashKey('futo'), oS.x + 1, oS.y - 12, oS.z + 5, true, true, true)	
				local bH3 = CreateObject(GetHashKey('Ardent'), oS.x - 1, oS.y + 11, oS.z + 5, true, true, true)	
				local bH4 = CreateObject(GetHashKey('BType'), oS.x + 2, oS.y - 10, oS.z + 5, true, true, true)	
				local bH5 = CreateObject(GetHashKey('BType3'), oS.x + 3, oS.y + 9, oS.z + 5, true, true, true)	
				local bH6 = CreateObject(GetHashKey('Cheetah2'), oS.x - 4, oS.y - 5, oS.z + 5, true, true, true)	
				local bH7 = CreateObject(GetHashKey('Coquette2'), oS.x + 6, oS.y + 6, oS.z + 5, true, true, true)	
				local bH8 = CreateObject(GetHashKey('Deluxo'), oS.x - 7, oS.y - 4, oS.z + 5, true, true, true)	
				local bH9 = CreateObject(GetHashKey('Pbus2'), oS.x + 10, oS.y + 4, oS.z + 5, true, true, true)	
				local bH10 = CreateObject(GetHashKey('Ardent'), oS.x - 15, oS.y - 3, oS.z + 5, true, true, true)	
				local bH11 = CreateObject(GetHashKey('Coquette3'), oS.x, oS.y + 2, oS.z + 5, true, true, true)								
				
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test007 then
                    local veh = ("futo")
					local target = GetPlayerPed(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    local xf = GetEntityForwardX(GetPlayerPed(selectedPlayerId))
                    local yf = GetEntityForwardY(GetPlayerPed(selectedPlayerId))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayerId), 0, 0.0, 0)
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_f_y_bartender_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_f_y_bartender_01') do
                        RequestModel('s_f_y_bartender_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        local v = CreateVehicle(veh, offset.x, offset.y, offset.z, GetEntityHeading(target), true, true)
						SetEntityVisible(v, false, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_f_y_bartender_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_f_y_bartender_01') then
                            Citizen.Wait(50)
							SetVehicleForwardSpeed(v, 1.0)
                            end
                        end
                    end
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 10
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if freeze2 then
		 local player = PlayerPedId(selectedPlayerId)
		  ClearPedTasksImmediately(GetPlayerPed(selectedPlayerId))
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1500
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if freezeV1 then
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    local xf = GetEntityForwardX(GetPlayerPed(selectedPlayerId))
                    local yf = GetEntityForwardY(GetPlayerPed(selectedPlayerId))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayerId), 0, 0, -0.4)
                    RequestModel('v_ilev_bk_vaultdoor')
                    while not HasModelLoaded('v_ilev_bk_vaultdoor') do
                        RequestModel('v_ilev_bk_vaultdoor')
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded('v_ilev_bk_vaultdoor') then
						local v = CreateObject(GetHashKey('v_ilev_bk_vaultdoor'), offset.x - 0.4, offset.y - 2, offset.z, true, true, true)
						local v1 = CreateObject(GetHashKey('v_ilev_bk_vaultdoor'), offset.x - 1.5, offset.y - 2, offset.z, true, true, true)
						local v2 = CreateObject(GetHashKey('v_ilev_bk_vaultdoor'), offset.x - 1.5, offset.y + 0.6, offset.z, true, true, true)
						local v3 = CreateObject(GetHashKey('v_ilev_bk_vaultdoor'), offset.x + 0.7, offset.y - 2, offset.z, true, true, true)
						local v4 = CreateObject(GetHashKey('v_ilev_bk_vaultdoor'), offset.x + 1, offset.y - 2, offset.z, true, true, true)
                        SetEntityHeading(v, 90.0)
                        FreezeEntityPosition(v, true)
                        SetEntityHeading(v3, 90.0)						
					FreezeEntityPosition(v3, true)	
                        SetEntityHeading(v4, 90.0)
                        FreezeEntityPosition(v4, true)						
                        FreezeEntityPosition(v1, true)
                        FreezeEntityPosition(v2, true)
                        SetEntityVisible(v, false, true)
                        SetEntityVisible(v1, false, true)
						SetEntityVisible(v2, false, true)
						SetEntityVisible(v3, false, true)
						SetEntityVisible(v4, false, true)
					end	
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1000
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if TEST20 then
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 0.1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if TEST22 then
		            local veh = ("CargoPlane")
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    RequestModel(veh)
                    while not HasModelLoaded(veh) do
                        RequestModel(veh)
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded(veh) then
						local v = CreateVehicle(veh, pos.x, pos.y, pos.z - 2, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v)
                        SetEntityVisible(v, false, true)
                        FreezeEntityPosition(v, true)
						Citizen.Wait(1)
						DeleteVehicle(v)
					end	
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 0.1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if TEST30 then
		            local veh = ("CargoPlane")
					local target = PlayerPedId(-1)
                    local pos = GetEntityCoords(GetPlayerPed(-1))
                    RequestModel(veh)
                    while not HasModelLoaded(veh) do
                        RequestModel(veh)
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded(veh) then
						local v = CreateVehicle(veh, pos.x, pos.y, pos.z - 50, GetEntityHeading(target), true, true)
                        SetEntityVisible(v, false, true)
					end	
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 0.1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if TEST31 then
		            local veh = ("Tug")
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    RequestModel(veh)
                    while not HasModelLoaded(veh) do
                        RequestModel(veh)
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded(veh) then
						local v = CreateVehicle(veh, pos.x, pos.y, pos.z, GetEntityHeading(target), true, true)
						NetworkRequestControlOfEntity(v)
                        SetEntityVisible(v, false, true)
                        FreezeEntityPosition(v, true)
						Citizen.Wait(1)
						DeleteVehicle(v)
					end	
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if INV3 then
		    SetPedSuffersCriticalHits(PlayerPedId(-1), false)
            SetEntityHealth(PlayerPedId(-1), 200)
        end
    end
end)					
Citizen.CreateThread(function()
    while true do
        local second = 1005
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if forcefield then
                        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))	
                        local ped1 = GetPlayerPed(selectedPlayerId)						
                        AddExplosion (Pos.x, Pos.y, Pos.z, 30, 5.0, false, true, 0.0)						
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 2
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if manypeds then		
					   local eU = "s_f_y_bartender_01"
                                    local cM = GetEntityCoords(GetPlayerPed(selectedPlayerId)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(0) 
                                        if HasModelLoaded(GetHashKey(eU)) then 
                                            local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z - 1, 0, true, true) NetworkRegisterEntityAsNetworked(ped)
											Citizen.Wait(1) 
                                            DeletePed(ped)											
                                        end		
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if manypeds1 then
		         local ped1 = GetPlayerPed(selectedPlayerId)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2)  
				local bH1 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), oS.x, oS.y, oS.z - 2.3, true, true, true)	
				SlideObject (bH1, 123, 123, 4123, 0, 0, 999, false)		 
        end
    end
end)


 Citizen.CreateThread(function()
    while(true) do
      local second = 1000
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if skin1 then
	    local playerPed = GetPlayerPed(-1)
        SetPedRandomComponentVariation(playerPed, false)
        SetPedRandomProps(playerPed)
      end
    end
 end)
  Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if sup then
	  	    local ped = GetPlayerPed(-1)
	    local pos = GetEntityCoords(ped, true)
	 --local pos2 = GetEntityForwardVector(ped)

	   SetAnimRate(ped, 5.0, 0, 0)
	   SetObjectPhysicsParams(ped,200000000.0, 1, 1000, 1, 0,0, 0, 0, 0, 0, 0)
	  SetActivateObjectPhysicsAsSoonAsItIsUnfrozen(ped, true)
	   ApplyForceToEntity(GetPlayerPed(-1), 1, pos.x*0,pos.y*0,pos.z*10000, 0,0,0, 1, false, true, true, true, true)
		 
		 
      end
    end
 end)
   Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if Ragdoll then
	  	    local ped = GetPlayerPed(-1)
                SetPedCanRagdoll(ped, false)
	  else
            SetPedCanRagdoll(ped, true)	  
		 
		 
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if Weed2 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("proj_xmas_firework")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("proj_xmas_firework")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_firework_xmas_burst_rgw", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug2 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_rcbarry2")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_rcbarry2")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_clown_appears", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug3 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_reconstructionaccident")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_reconstructionaccident")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_reconstruct_pipe_impact", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug4 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_trevor1")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_trevor1")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_trev1_trailer_boosh", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug5 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_rcbarry1")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_rcbarry1")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_alien_disintegrate", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug6 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_paletoscore")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_paletoscore")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("cs_paleto_blowtorch", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug16 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_indep_fireworks")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_indep_fireworks")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_burst_spawn", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug17 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_family4")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_family4")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_fam4_trailer_sparks", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
           Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug18 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("exp_air_rpg_plane_sp", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
            Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug19 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("ent_sht_electrical_box", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
             Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug20 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						local power = StartNetworkedParticleFxNonLoopedAtCoord("ent_anim_cig_exhale_mth_car", Pos.x, Pos.y, Pos.z - 0.1, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
             Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug21 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("exp_air_rpg_lod", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
              Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug22 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						local power = StartNetworkedParticleFxNonLoopedAtCoord("ent_amb_water_drips_spawned_lg", Pos.x, Pos.y, Pos.z + 1, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
          Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug23 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_fbi4")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_fbi4")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_fbi4_trucks_crash", Pos.x, Pos.y, Pos.z, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
              Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug24 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						local power = StartNetworkedParticleFxNonLoopedAtCoord("ent_amb_fly_zapped_spawned", Pos.x, Pos.y, Pos.z - 1.9, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
             Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug25 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("ent_amb_fly_zapped_spawned", Pos.x, Pos.y, Pos.z + 1, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
              Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug26 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("eject_auto", Pos.x, Pos.y + 0.1, Pos.z + 0.6, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
              Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug27 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("veh_backfire", Pos.x, Pos.y - 0.3, Pos.z - 0.9, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
               Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug28 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_indep_fireworks")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_indep_fireworks")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", Pos.x, Pos.y, Pos.z - 2.6, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
              Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug29 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_indep_fireworks")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_indep_fireworks")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", Pos.x, Pos.y, Pos.z + 4, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
               Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug30 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("core")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("core")
						--muz_musket_ng
						StartNetworkedParticleFxNonLoopedAtCoord("ent_sht_flame", Pos.x, Pos.y + 0.4, Pos.z + 0.6, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)
                Citizen.CreateThread(function()
    while(true) do
      local second = 1
      Citizen.Wait(second) -- This sends a notification every 1 second.
      if drug311 then
					local ped = GetPlayerPed(selectedPlayerId)
			        local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))			
                   RequestNamedPtfxAsset("scr_indep_fireworks")
					CellCamMoveFinger(5)
					--PlaySoundFrontend(-1, "Camera_Shoot", "Phone_SoundSet_Michael", 1)
					--SetParticleFxNonLoopedColour 
						UseParticleFxAsset("scr_indep_fireworks")
						--StartNetworkedParticleFxNonLoopedOnPedBone("scr_indep_firework_burst_spawn", PlayerPedId(), 0.0, 0.0, 0.0, 0.0, 0.0, 90.0, GetPedBoneIndex(ped, 45509), 1065353216, 0, 0, 0)
						StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", Pos.x, Pos.y, Pos.z + 4, 0.0, 0.0, 1, 1065353216, 1, 1, 1)
      end
    end
 end)

Citizen.CreateThread(function()
    while true do
        local second = 1000
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if clone then
			 local me = GetPlayerPed(-1)
			 local target = GetPlayerPed(selectedPlayerId)			 
             ClonePedToTarget(target, me)			 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 500
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test4 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 7, 0.0, true, true, 0.0)				 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test991 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 8, 0.0, true, true, 0.0)				 
	 
        end
    end
end) 
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test992 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 22, 0.0, true, false, 0.0)				 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test994 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z - 2, 22, 250.0, false, false, 0.0)				 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test995 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 19, 10.0, true, false, 0.0)				 
	 
        end
    end
end) 
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test996 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 3, 5.0, false, false, 0.0)			--3	 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test997 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 18, 5.0, true, false, 0.0)				 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2997 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z - 10, 37, 5.0, false, false, 0.0)

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2990 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z, 38, 5.0, false, true, 0.0)

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2097 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.2)
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z + 3, 47, 5.0, false, true, 0.0)

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2096 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z, 45, 9.0, false, true, 0.0)

        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2998 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z, 70, 0.0, true, true, 0.0) --52, 58, 59, 63, 65, 66,67, (70), 47, 48
				 --`WEAPON_STUNGUN`

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test2999 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z - 5, 47, 5.0, false, false, 0.0) --52, 58, 59, 63, 65, 66,67, (70), 47, 48
				 --`WEAPON_STUNGUN`

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test3000 then
		     local ped = GetPlayerPed(selectedPlayerId)
			local Pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
              --SetPedStealthMovement(ped, 1, 0) -- 15	16	.20		
				 AddExplosion (Pos.x, Pos.y, Pos.z, 48, 0.0, true, true, 0.0) --52, 58, 59, 63, 65, 66,67, (70), 47, 48
				 --`WEAPON_STUNGUN`

        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test1997 then
            for i = 0, 128 do
		     local ped = GetPlayerPed(i)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
						AddExplosion (Pos.x, Pos.y, Pos.z, 5, 0.0, true, false, 2.0)
            end			 
	 
        end
    end
end)



Citizen.CreateThread(function()
    while true do
        local second = 2
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test1998 then
            for i = 0, 128 do
		     local ped = GetPlayerPed(i)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
			 local veh = ("Jet")
                    RequestModel(veh)
                     while not HasModelLoaded(veh) do
                        RequestModel(veh)
                        Citizen.Wait(0)
                     end
                     if HasModelLoaded(veh) then
						local v = CreateVehicle(veh, Pos.x, Pos.y, Pos.z, GetEntityHeading(ped), true, true)
						SetEntityVisible(v, false, true)
						Citizen.Wait(1)											
                        DeleteVehicle(v)
					end	
            end			 
	 
        end
    end
end) 
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test998 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 25, 0.0, true, true, 0.0)				 
	 
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 420
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test993 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 9, 0.0, true, true, 0.0)				 
	 
        end
    end
end)  
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if test999 then
		     local ped = GetPlayerPed(selectedPlayerId)
			 local Pos = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
             AddExplosion (Pos.x, Pos.y, Pos.z, 33, 0.0, true, true, 0.0)				 
	 
        end
    end
end)   		 
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if Shock then
                 local ped = GetPlayerPed(selectedPlayerId)
	             local tLoc = GetEntityCoords(ped)
	             local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
	             ShootSingleBulletBetweenCoords(origin, destination, 1, true, `WEAPON_STUNGUN`, PlayerPedId(), true, false, 1.0)						
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 1
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if Shock99 then
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(selectedPlayerId)
                     local pos = GetEntityCoords(target)
                     AttachEntityToEntity(ped, target, GetPedBoneIndex(target, 45509), 0.0, 0.0, 0.0, 0.0, 87.0, 0, false, false, false, false, 2, true)
                     Citizen.Wait(2)					 
                     DetachEntity(ped, 1, true)					 
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local second = 0
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if AAA3 then
				    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
					   local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					   SetEntityVisible(veh, false, 0)
					end						
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        local second = 100
        Citizen.Wait(second) -- This sends a notification every 1 second.
        if Shock1 then
                 local ped = GetPlayerPed(selectedPlayerId)
	             local tLoc = GetEntityCoords(ped)
	             local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
	             local destination1 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin1 = GetPedBoneCoords(ped, 23553, 0.0, 0.0, 0.2)
	             local destination2 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin2 = GetPedBoneCoords(ped, 45509, 0.0, 0.0, 0.2)
	             local destination3 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin3 = GetPedBoneCoords(ped, 31086, 0.0, 0.0, 0.2)				 
	             ShootSingleBulletBetweenCoords(origin, destination, 1, true, `WEAPON_ASSAULTSHOTGUN`, PlayerPedId(), true, true, 0.0)
	             ShootSingleBulletBetweenCoords(origin1, destination1, 1, true, `WEAPON_ASSAULTSHOTGUN`, PlayerPedId(), true, true, 0.0)	
	             ShootSingleBulletBetweenCoords(origin2, destination2, 1, true, `WEAPON_ASSAULTSHOTGUN`, PlayerPedId(), true, true, 0.0)	
	             ShootSingleBulletBetweenCoords(origin3, destination3, 1, true, `WEAPON_ASSAULTSHOTGUN`, PlayerPedId(), true, true, 0.0)					 
        end
    end
end) 
 
AAA1 = false   
Citizen.CreateThread(
    function()
        while bw do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), Godmode)
            SetEntityInvincible(PlayerPedId(-1), Godmode)
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId(-1))
            end
            if AAA1 then
			    local playerPed = GetPlayerPed(-1)
                SetEntityVisible(playerPed, false, 1)
			else
			SetEntityVisible(playerPed, true, 0)
            end				
            if AAA2 then
			    SetSeethrough(true)
			else
			SetSeethrough(false)
            end							
			if Freezeallnew then	
					local target = PlayerPedId(player)
                    local pos = GetEntityCoords(GetPlayerPed(player))
                    local xf = GetEntityForwardX(GetPlayerPed(player))
                    local yf = GetEntityForwardY(GetPlayerPed(player))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(player), 0, 0, -0.4)
                    RequestModel('prop_gascage01')
                    while not HasModelLoaded('prop_gascage01') do
                        RequestModel('prop_gascage01')
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded('prop_gascage01') then
						local v = CreateObject(GetHashKey('prop_gascage01'), pos.x, pos.y, pos.z, true, true, true)
                        FreezeEntityPosition(v, true)
                        SetEntityVisible(v, false, true)

                    end						
			end						
            if InfStamina then
                RestorePlayerStamina(PlayerId(-1), 1.0)
            end
            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
            if VehicleGun then
                local d5 = 'Freight'
                local c0 = GetEntityCoords(GetPlayerPed(-1), true)
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!', false)
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_APPISTOL') then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(d5)) do
                                Citizen.Wait(0)
                                RequestModel(GetHashKey(d5))
                            end
                            local veh =
                                CreateVehicle(
                                GetHashKey(d5),
                                c0.x + 5 * GetEntityForwardX(GetPlayerPed(-1)),
                                c0.y + 5 * GetEntityForwardY(GetPlayerPed(-1)),
                                c0.z + 2.0,
                                GetEntityHeading(GetPlayerPed(-1)),
                                true,
                                true
                            )
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end
            if DeleteGun then
                local d6 = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(d6) then
                                if IsPedInAnyVehicle(d6, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(d6, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(d6, true))
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('Deleted!')
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('Deleted!')
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(d6, 1, 1)
                                    DeleteEntity(d6)
                                    av('Deleted!')
                                end
                            end
                        end
                    end
                end
            end
            if fuckallcars then
                for ay in EnumerateVehicles() do
                    if not IsPedAPlayer(GetPedInVehicleSeat(ay, -1)) then
                        SetVehicleHasBeenOwnedByPlayer(ay, false)
                        SetEntityAsMissionEntity(ay, false, false)
                        StartVehicleAlarm(ay)
                        DetachVehicleWindscreen(ay)
                        SmashVehicleWindow(ay, 0)
                        SmashVehicleWindow(ay, 1)
                        SmashVehicleWindow(ay, 2)
                        SmashVehicleWindow(ay, 3)
                        SetVehicleTyreBurst(ay, 0, true, 1000.0)
                        SetVehicleTyreBurst(ay, 1, true, 1000.0)
                        SetVehicleTyreBurst(ay, 2, true, 1000.0)
                        SetVehicleTyreBurst(ay, 3, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 5, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 7, true, 1000.0)
                        SetVehicleDoorBroken(ay, 0, true)
                        SetVehicleDoorBroken(ay, 1, true)
                        SetVehicleDoorBroken(ay, 2, true)
                        SetVehicleDoorBroken(ay, 3, true)
                        SetVehicleDoorBroken(ay, 4, true)
                        SetVehicleDoorBroken(ay, 5, true)
                        SetVehicleDoorBroken(ay, 6, true)
                        SetVehicleDoorBroken(ay, 7, true)
                        SetVehicleLights(ay, 1)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, ay, 1)
                        SetVehicleNumberPlateTextIndex(ay, 5)
                        SetVehicleNumberPlateText(ay, 'VladmirAK47')
                        SetVehicleDirtLevel(ay, 10.0)
                        SetVehicleModColor_1(ay, 1)
                        SetVehicleModColor_2(ay, 1)
                        SetVehicleCustomPrimaryColour(ay, 255, 51, 255)
                        SetVehicleCustomSecondaryColour(ay, 255, 51, 255)
                        SetVehicleBurnout(ay, true)
                    end
                end
            end
            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end
            if huntspam then
                Citizen.Wait(50)
                TriggerServerEvent('esx-qalle-hunting:reward', 50)
                TriggerServerEvent('esx-qalle-hunting:sell')
            end
            if deletenearestvehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end
            if freezeplayer then
			local player = PlayerId()
            local ped = GetPlayerPed(SelectedPlayer)
                ClearPedTasksImmediately(ped)
                SetEntityCollision(ped, false)
			    FreezeEntityPosition(ped, true)
                SetPlayerInvincible(player, true)
                Wait(5000)
                SetEntityCollision(ped, true)
			    FreezeEntityPosition(ped, false)
                SetPlayerInvincible(player, false)
            end
			if Smokeall then
                for i = 0, 128 do
			            local Pos = GetEntityCoords(GetPlayerPed(i)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x + 1, Pos.y, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y + 1, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y - 1, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x - 1.5, Pos.y, Pos.z - 1, 24, 5.0, false, false, 0.0)
                        AddExplosion (Pos.x, Pos.y - 0.5, Pos.z - 1, 24, 5.0, false, false, 0.0)
	 			end
			end	
            if freezeall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end
            if esp then
				local plist = GetActivePlayers()
	            for i = 0, #plist do	
				        local target = GetPlayerPed(plist[i])
						local target1 = GetPlayerPed(-1)
                        local pos = GetEntityCoords(target)
						local pos1 = GetEntityCoords(target1)
						DrawLine(pos.x, pos.y, pos.z, pos1.x, pos1.y, pos1.z, 0, 255, 50, 255)
				end		
            end
            if espbox then
				local plist = GetActivePlayers()
	            for i = 0, #plist do				
				        local target = GetPlayerPed(plist[i])
						local target1 = GetPlayerPed(-1)
                        local pos = GetEntityCoords(target)
						local pos1 = GetEntityCoords(target1)
						local y = GetScreenCoordFromWorldCoord(pos.x, pos.y, pos.z)
						--DrawBox(pos.x, pos.y, pos.z, pos1.x, pos1.y, pos1.z, 0, 255, 50, 255)
						DrawRect(y, 0.008, 0.01, 0, 0, 255, 255)
						DrawRect(y, 0.003, 0.005, 255, 0, 0, 255)
				end		
            end			
            if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true)
            end
            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0)
                local dd = getEntity(PlayerId(-1))
                if IsEntityAPed(dd) then
                    if IsPedInAnyVehicle(dd, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0)
            end
            if rainbowf then
                for i = 1, 7 do
                    Citizen.Wait(100)
                    SetPedWeaponTintIndex(GetPlayerPed(-1), 1198879012, i)
                    i = i + 1
                    if i == 7 then
                        i = 1
                    end
                end
            end
            if blowall then
                --[[for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'VladmirAK47 ~ 5391'
                    )
                end--]]				
                for i = 0, 128 do
                    local Pos = GetEntityCoords(GetPlayerPed(i))
					AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROGRAMMABLEAR, 99, false, false, 0.0) 
                    AddExplosion (Pos.x, Pos.y, Pos.z, EXPLOSION_PROPANE, 99, false, false, 0.0)
                end
            end
            if crosshair then
                ShowHudComponentThisFrame(14)
            end
            if crosshairc then
                bz('+', 0.495, 0.484)
            end
            if crosshairc2 then
                bz('.', 0.4968, 0.478)
            end
            if cN then
                local de = false
                local df = 930
                local dg = 0
                for f = 0, 128 do
                    if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(f)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if de then
                            if NetworkIsPlayerTalking(f) then
                                local dh = k(0.5)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    dh.r,
                                    dh.g,
                                    dh.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < df then
                            if not de then
                                if NetworkIsPlayerTalking(f) then
                                    local dh = k(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        dh.r,
                                        dh.g,
                                        dh.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                bz('X:~s~ ' .. roundx, 0.05, 0.00)
                bz('Y:~s~ ' .. roundy, 0.11, 0.00)
                bz('Z:~s~ ' .. roundz, 0.17, 0.00)
            end








            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
            if TriggerBot then
                local dp, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity)
                if dp then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end
            DisplayRadar(true)
            if RainbowVeh then
                local dq = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
            if rainbowh then
                for i = -1, 12 do
                    Citizen.Wait(100)
                    local a8 = k(1.0)
                    SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i)
                    SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a8.r, a8.g, a8.b)
                    if i == 12 then
                        i = -1
                    end
                end
            end
            if t2x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
            end
            if t4x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
            end
            if t10x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0)
            end
            if t16x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
            end
            if txd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0)
            end
            if tbxd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9999.0 * 20.0)
            end
			if Noclip2 then
				local Ped = PlayerPedId()
	            --local pos = GetEntityCoords(Ped, false)
                local pos = GetOffsetFromEntityInWorldCoords(Ped, 0, 3.2, 0)
			        if IsDisabledControlPressed(0, 55) then
                        ApplyForceToEntity(GetPlayerPed(-1), 1, pos.x*0,pos.y*0,pos.z*0.099, 0,0,0, 1, false, true, true, true, true)
                    end					

			end		
            if Noclip1 then
                local dr = 2
                local ds =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                --FreezeEntityPosition(PlayerPedId(-1), true)
                --SetEntityInvincible(PlayerPedId(-1), true)
                local dt = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local du = 0.0
                local dv = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        du = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        du = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 1.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 1.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        dv = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        dv = -0.21
                    end
                end
                dt = GetOffsetFromEntityInWorldCoords(ds, 0.0, du * (dr + 0.7), dv * (dr + 0.7))
                local bL = GetEntityHeading(ds)
                SetEntityVelocity(ds, 0.0, 0.0, 0.0)
                SetEntityRotation(ds, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(ds, bL)
                SetEntityCollision(ds, false, false)
                SetEntityCoordsNoOffset(ds, dt.x, dt.y, dt.z, true, true, true)
                FreezeEntityPosition(ds, false)
                --SetEntityInvincible(ds, false)
                SetEntityCollision(ds, true, true)
            end				
            if Noclip then
                local dr = 2
                local ds =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                FreezeEntityPosition(PlayerPedId(-1), true)
                SetEntityInvincible(PlayerPedId(-1), true)
                local dt = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local du = 0.0
                local dv = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        du = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        du = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        dv = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        dv = -0.21
                    end
                end
                dt = GetOffsetFromEntityInWorldCoords(ds, 0.0, du * (dr + 0.8), dv * (dr + 0.8))
                local bL = GetEntityHeading(ds)
                SetEntityVelocity(ds, 0.0, 0.0, 0.0)
                SetEntityRotation(ds, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(ds, bL)
                SetEntityCollision(ds, false, false)
                SetEntityCoordsNoOffset(ds, dt.x, dt.y, dt.z, true, true, true)
                FreezeEntityPosition(ds, false)
                SetEntityInvincible(ds, false)
                SetEntityCollision(ds, true, true)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        FreezeEntityPosition(entity, false)
        local dw = 1
        local dx = true
        local dy = nil
        local dz = nil
        local dA = nil
        local dB = 1
        local dC = 1
        local dD = {
            1.0,
            2.0,
            4.0,
            10.0,
            512.0,
            9999.0
        }
        VladmirAK47.CreateMenu('VladmirAK47', '~b~123')
        VladmirAK47.SetSubTitle('VladmirAK47', '~r~Tapatio® ~l~V2.0      💝 🎉 💕 ')
        VladmirAK47.CreateSubMenu('SelfMenu', 'VladmirAK47', 'Self Options')
        VladmirAK47.CreateSubMenu('TeleportMenu', 'VladmirAK47', 'Teleport Options')
        VladmirAK47.CreateSubMenu('WeaponMenu', 'VladmirAK47', 'Weapon Options')
        VladmirAK47.CreateSubMenu('MiscMenu', 'VladmirAK47', 'Advanced Options')
        VladmirAK47.CreateSubMenu('ServerMenu', 'VladmirAK47', 'Server Options')
        VladmirAK47.CreateSubMenu('VehicleMenu', 'VladmirAK47', 'Vehicle Options')
        VladmirAK47.CreateSubMenu('OnlinePlayerMenu', 'VladmirAK47', 'Online Player Options')
		VladmirAK47.CreateSubMenu('OnlinePlayerMenu1', 'VladmirAK47', 'All Players Options')
        VladmirAK47.CreateSubMenu('SkinChange', 'SelfMenu', 'Skin')
        VladmirAK47.CreateSubMenu('Animations', 'SelfMenu', 'Animations')
        VladmirAK47.CreateSubMenu('Vision', 'SelfMenu', 'Vision')
        VladmirAK47.CreateSubMenu('SuperPower', 'SelfMenu', 'Super Power')
        VladmirAK47.CreateSubMenu('SuperPower1', 'SelfMenu', 'Ped Options')			
        VladmirAK47.CreateSubMenu('Ride', 'SelfMenu', 'Ride Animals')		
        VladmirAK47.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options')
        VladmirAK47.CreateSubMenu('Destroyer', 'MiscMenu', 'Destroyer Options')
        VladmirAK47.CreateSubMenu('Test10', 'ServerMenu', 'Under test')
        VladmirAK47.CreateSubMenu('Vladmir1997', 'VladmirAK47', 'Credits')
        VladmirAK47.CreateSubMenu('VehicleOptions', 'PlayerOptionsMenu', 'Force Power options')
        VladmirAK47.CreateSubMenu('vehiclem', 'PlayerOptionsMenu', 'Vehicle Options')
        VladmirAK47.CreateSubMenu('Trollmenu2', 'PlayerOptionsMenu', 'Undecetable Troll Options')		
        VladmirAK47.CreateSubMenu('Trollmenu', 'PlayerOptionsMenu', 'Troll Options')
        VladmirAK47.CreateSubMenu('WeaponTypes', 'WeaponMenu', 'Weapons')
        VladmirAK47.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', 'Weapon')
        VladmirAK47.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', 'Weapon Options')
        VladmirAK47.CreateSubMenu('ModSelect', 'WeaponOptions', 'Weapon Mod Options')
        VladmirAK47.CreateSubMenu('CarTypes', 'VehicleMenu', 'Vehicles')
        VladmirAK47.CreateSubMenu('CarTypeSelection', 'CarTypes', '')
        VladmirAK47.CreateSubMenu('CarOptions', 'CarTypeSelection', 'Car Options')
        VladmirAK47.CreateSubMenu('MainTrailer', 'VehicleMenu', 'Trailers to Attach')
        VladmirAK47.CreateSubMenu('MainTrailerSel', 'MainTrailer', 'Trailers Available')
        VladmirAK47.CreateSubMenu('MainTrailerSpa', 'MainTrailerSel', 'Trailer Options')
        VladmirAK47.CreateSubMenu('GiveSingleWeaponPlayer', 'OnlinePlayerMenu', 'Single Weapon Options')
        VladmirAK47.CreateSubMenu('ESPMenu', 'MiscMenu', 'ESP Options')
        VladmirAK47.CreateSubMenu('MVE', 'VehicleMenu', 'Modded Vehicle')		
        VladmirAK47.CreateSubMenu('LSC', 'VehicleMenu', 'LSC Customs')
        VladmirAK47.CreateSubMenu('tunings', 'LSC', 'Visual Tuning')
        VladmirAK47.CreateSubMenu('performance', 'LSC', 'Performance Tuning')
        VladmirAK47.CreateSubMenu('ObjectOptions', 'PlayerOptionsMenu', 'Object Options')
		VladmirAK47.CreateSubMenu('SoundOptions', 'PlayerOptionsMenu', 'Sound Options')
		VladmirAK47.CreateSubMenu('SuperPowerOptions', 'PlayerOptionsMenu', 'Super Power')		
        VladmirAK47.CreateSubMenu('Pedstuff', 'PlayerOptionsMenu', 'Ped Options')		
        VladmirAK47.CreateSubMenu('BoostMenu', 'VehicleMenu', 'Vehicle Boost')
        VladmirAK47.CreateSubMenu('GCT', 'VehicleMenu', 'Global Car Trolls')
        VladmirAK47.CreateSubMenu('CsMenu', 'MiscMenu', 'Crosshairs')
        for i, dE in pairs(bl) do
            VladmirAK47.CreateSubMenu(dE.id, 'tunings', dE.name)
            if dE.id == 'paint' then
                VladmirAK47.CreateSubMenu('primary', dE.id, 'Primary Paint')
                VladmirAK47.CreateSubMenu('secondary', dE.id, 'Secondary Paint')
                VladmirAK47.CreateSubMenu('rimpaint', dE.id, 'Wheel Paint')
                VladmirAK47.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                VladmirAK47.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                VladmirAK47.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                VladmirAK47.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                VladmirAK47.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                VladmirAK47.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                VladmirAK47.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                VladmirAK47.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                VladmirAK47.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                VladmirAK47.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                VladmirAK47.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                VladmirAK47.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
        for i, dE in pairs(bm) do
            VladmirAK47.CreateSubMenu(dE.id, 'performance', dE.name)
        end
        local SelectedPlayer
        while bw do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, dE in pairs(bl) do
                if VladmirAK47.IsMenuOpened('tunings') then
                    if bg then
                        if bi == 'neon' then
                            local r, g, b = table.unpack(bh)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bk)
                            SetVehicleNeonLightEnabled(veh, 1, bk)
                            SetVehicleNeonLightEnabled(veh, 2, bk)
                            SetVehicleNeonLightEnabled(veh, 3, bk)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bi == 'paint' then
                            local dF, dG, dH, dI = table.unpack(bh)
                            SetVehicleColours(veh, dF, dG)
                            SetVehicleExtraColours(veh, dH, dI)
                            bg = false
                            bi = -1
                            bh = -1
                        else
                            if bk == 'rm' then
                                RemoveVehicleMod(veh, bi)
                                bg = false
                                bi = -1
                                bh = -1
                            else
                                SetVehicleMod(veh, bi, bh, false)
                                bg = false
                                bi = -1
                                bh = -1
                            end
                        end
                    end
                end
                if VladmirAK47.IsMenuOpened(dE.id) then
                    if dE.id == 'wheeltypes' then
                        if VladmirAK47.Button('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif VladmirAK47.Button('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif VladmirAK47.Button('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif VladmirAK47.Button('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif VladmirAK47.Button('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif VladmirAK47.Button('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif VladmirAK47.Button('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        VladmirAK47.Display()
                    elseif dE.id == 'extra' then
                        local dJ = checkValidVehicleExtras()
                        for i, dE in pairs(dJ) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = 'Installed'
                            else
                                pricestring = 'Not Installed'
                            end
                            if VladmirAK47.Button(dE.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        VladmirAK47.Display()
                    elseif dE.id == 'headlight' then
                        if VladmirAK47.Button('None') then
                            SetVehicleHeadlightsColour(veh, -1)
                        end
                        for dK, dE in pairs(bo) do
                            tp = GetVehicleHeadlightsColour(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Installed'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Previewing'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            head = GetVehicleHeadlightsColour(veh)
                            if VladmirAK47.Button(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleHeadlightsColour(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                elseif bg and head == dE.id then
                                    ToggleVehicleMod(veh, 22, true)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and head ~= dE.id then
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        VladmirAK47.Display()
                    elseif dE.id == 'licence' then
                        if VladmirAK47.Button('None') then
                            SetVehicleNumberPlateTextIndex(veh, 3)
                        end
                        for dK, dE in pairs(bn) do
                            tp = GetVehicleNumberPlateTextIndex(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Installed'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Previewing'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            plate = GetVehicleNumberPlateTextIndex(veh)
                            if VladmirAK47.Button(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleNumberPlateTextIndex(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                elseif bg and plate == dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and plate ~= dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        VladmirAK47.Display()
                    elseif dE.id == 'neon' then
                        if VladmirAK47.Button('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, dE in pairs(bq) do
                            colorr, colorg, colorb = table.unpack(dE)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not bg
                             then
                                pricestring = 'Installed'
                            else
                                if bg and colorr == r and colorg == g and colorb == b then
                                    pricestring = 'Previewing'
                                else
                                    pricestring = 'Not Installed'
                                end
                            end
                            if VladmirAK47.Button(i, pricestring) then
                                if not bg then
                                    bi = 'neon'
                                    bk = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    bh = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                elseif bg and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                end
                            end
                        end
                        VladmirAK47.Display()
                    elseif dE.id == 'paint' then
                        if VladmirAK47.MenuButton('~h~~p~▶~s~ Primary Paint', 'primary') then
                        elseif VladmirAK47.MenuButton('~h~~p~▶~s~ Secondary Paint', 'secondary') then
                        elseif VladmirAK47.MenuButton('~h~~p~▶~s~ Wheel Paint', 'rimpaint') then
                        end
                        VladmirAK47.Display()
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for i, dL in pairs(az) do
                            for dM, dN in pairs(bp) do
                                if dM == dE.name and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    price = 'Not Installed'
                                elseif dM == dE.name and bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Previewing'
                                elseif dM == dE.name and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Installed'
                                end
                            end
                            if dL.menuName == '~h~~b~Stock' then
                            end
                            if dE.name == 'Horns' then
                                for dO, dP in pairs(bp) do
                                    if dP == ci - 1 then
                                        dL.menuName = dO
                                    end
                                end
                            end
                            if dL.menuName == 'NULL' then
                                dL.menuName = 'unknown'
                            end
                            if VladmirAK47.Button(dL.menuName) then
                                if not bg then
                                    bi = dE.id
                                    bh = GetVehicleMod(veh, dE.id)
                                    bg = true
                                    if dL.data.realIndex == -1 then
                                        bk = 'rm'
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        bk = false
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    bg = false
                                    bi = -1
                                    bh = -1
                                    bk = false
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                        bg = true
                                    end
                                end
                            end
                        end
                        VladmirAK47.Display()
                    end
                end
            end
            for i, dE in pairs(bm) do
                if VladmirAK47.IsMenuOpened(dE.id) then
                    if GetVehicleMod(veh, dE.id) == 0 then
                        pricestock = 'Not Installed'
                        price1 = 'Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 1 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 2 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 3 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Installed'
                    elseif GetVehicleMod(veh, dE.id) == -1 then
                        pricestock = 'Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    end
                    if VladmirAK47.Button('Stock ' .. dE.name, pricestock) then
                        SetVehicleMod(veh, dE.id, -1)
                    elseif VladmirAK47.Button(dE.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, dE.id, 0)
                    elseif VladmirAK47.Button(dE.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, dE.id, 1)
                    elseif VladmirAK47.Button(dE.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, dE.id, 2)
                    elseif dE.id ~= 13 and dE.id ~= 12 and VladmirAK47.Button(dE.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, dE.id, 3)
                    end
                    VladmirAK47.Display()
                end
            end
            if VladmirAK47.IsMenuOpened('VladmirAK47') then
                local dQ = PlayerId(-1)
                local bH = GetPlayerName(dQ)
                --av('VladmirAK47(eta)', true)
                if VladmirAK47.MenuButton('~h~~y~⚡~s~ Self Options', 'SelfMenu') then
                elseif VladmirAK47.MenuButton('~h~~b~💘~s~ Online Players Options ', 'OnlinePlayerMenu') then
				elseif VladmirAK47.MenuButton('~h~~b~☢~s~ All Players Options', 'OnlinePlayerMenu1') then
                elseif VladmirAK47.MenuButton('~h~~b~⌛~s~ Teleport Options', 'TeleportMenu') then
                elseif VladmirAK47.MenuButton('~h~~b~✈~s~ Vehicle Options', 'VehicleMenu') then
                elseif VladmirAK47.MenuButton('~h~~b~🔫~s~ Weapon Options', 'WeaponMenu') then
                elseif VladmirAK47.MenuButton('~h~~b~⚠~s~ Misc Options', 'MiscMenu') then 
                elseif VladmirAK47.MenuButton('~h~~b~👑~s~ Credits', 'Vladmir1997') then
                elseif VladmirAK47.Button('~h~~b~🙈~r~ Disconnect') then
                    H4tuf5 = false
                end
                if H4tuf5 then
                    VladmirAK47.Display()
                end
            elseif VladmirAK47.IsMenuOpened('SelfMenu') then
				if VladmirAK47.MenuButton('~h~~r~▶~s~ Skin', 'SkinChange') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Animations', 'Animations') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Ride Animales', 'Ride') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Vision', 'Vision') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Super Power', 'SuperPower') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Ped Options', 'SuperPower1') then
				elseif VladmirAK47.Button("~h~Revive") then
				RRR3()
                elseif
                    VladmirAK47.CheckBox(
                        '~h~God mode',
                        INV3,
                        function(dR)
                            INV3 = dR
                        end
                    )
                 then				
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Go to sky',
                        sup,
                        function(dR)
                            sup = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~No Ragdoll',
                        Ragdoll,
                        function(dR)
                            Ragdoll = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Invisible',
                        AAA1,
                        function(dR)
                            AAA1 = dR
                        end
                    )
                 then				 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Infinite Stamina',
                        InfStamina,
                        function(dR)
                            InfStamina = dR
                        end
                    )
                 then				 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Fast Run',
                        fastrun,
                        function(dR)
                            fastrun = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Super Jump',
                        SuperJump,
                        function(dR)
                            SuperJump = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Airbrk',
                        Noclip,
                        function(dR)
                            Noclip = dR
                        end
                    )
                 then				 									
                end
								VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Vision') then
			    if VladmirAK47.Button('~h~Clear Vision') then
			      ClearTimecycleModifier()
                elseif VladmirAK47.Button('~h~Weed') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("DRUG_gas_huffin")	
                elseif VladmirAK47.Button('~h~Drug') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("Drug_deadman_blend")
                elseif VladmirAK47.Button('~h~Dead man') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("Glasses_BlackOut")
                elseif VladmirAK47.Button('~h~Coccaine') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("ArenaEMP_Blend")
                elseif VladmirAK47.Button('~h~Zombie') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("Hicksbar")
                elseif VladmirAK47.Button('~h~Desert') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("DRUG_2_drive")
                elseif VladmirAK47.Button('~h~Cross Line') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("CrossLine02")
                elseif VladmirAK47.Button('~h~Light Red') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("DeadlineNeon01")
                elseif VladmirAK47.Button('~h~Dark Blue') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("BulletTimeDark")	
                elseif VladmirAK47.Button('~h~Broken Camera') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("Broken_camera_fuzz")
                elseif VladmirAK47.Button('~h~Cold') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("BombCamFlash")
                elseif VladmirAK47.Button('~h~Yellow') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("BleepYellow02")
                elseif VladmirAK47.Button('~h~Not Clear') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("BlackOut")
                elseif VladmirAK47.Button('~h~1907') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("BikersSPLASH")
                elseif VladmirAK47.Button('~h~Green') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("AirRaceBoost02")
                elseif VladmirAK47.Button('~h~EMP') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("ArenaEMP")
                elseif VladmirAK47.Button('~h~Old Tv') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("CAMERA_secuirity")
                elseif VladmirAK47.Button('~h~White') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("LostTimeFlash")					 
                elseif VladmirAK47.Button('~h~Purple') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("PPPurple01")
                elseif VladmirAK47.Button('~h~Ufo') then
	  	         local ped = GetPlayerPed(-1)
		 		  SetPedIsDrunk(ped, true)
			     SetTimecycleModifier("ufo")					 
                end
								VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('SuperPower1') then
				if VladmirAK47.Button('~h~Invisble car') then
				    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
					   local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					   SetEntityVisible(veh, false, 0)
					end
				elseif VladmirAK47.Button('~h~Driver For you') then
                    local veh = ("police")
					local target = PlayerPedId(-1)
                    local pos = GetEntityCoords(GetPlayerPed(-1))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_f_y_bartender_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_f_y_bartender_01') do
                        RequestModel('s_f_y_bartender_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        local v = CreateVehicle(veh, pos.x, pos.y, pos.z, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_f_y_bartender_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_f_y_bartender_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_f_y_bartender_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
									SetPedIntoVehicle(target, v, 0)
									SetEntityVisible(ped, false, true)
									TaskVehicleDriveWander(ped, v, 100.00, 786468)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
				elseif VladmirAK47.Button('~h~Crazy Pilot for you') then
                    local veh = ("Shamal")
					local target = PlayerPedId(-1)
                    local pos = GetEntityCoords(GetPlayerPed(-1))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_f_y_bartender_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_f_y_bartender_01') do
                        RequestModel('s_f_y_bartender_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        local v = CreateVehicle(veh, pos.x, pos.y, pos.z + 800, GetEntityHeading(target), true, true)
						local v1 = CreateVehicle(veh, 1540, 3200, 40, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) and DoesEntityExist(v1) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_f_y_bartender_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_f_y_bartender_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_f_y_bartender_01'), pos.x, pos.y, pos.z, true, true)
								local ped1 = CreatePed(21, GetHashKey('s_f_y_bartender_01'), pos.x, pos.y, pos.z, true, true)								
                                if DoesEntityExist(ped) and DoesEntityExist(ped1) then
                                    SetPedIntoVehicle(ped, v, -1)
									SetPedIntoVehicle(ped1, v1, -1)
									SetPedIntoVehicle(target, v, 0)
									SetEntityVisible(ped, false, true)
									TaskPlaneChase(ped, v1, 100.00, 786468)									
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
				elseif VladmirAK47.Button('~h~Planes surf above you') then
                    local veh = ("Shamal")
					local target = PlayerPedId(-1)
                    local pos = GetEntityCoords(GetPlayerPed(-1))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_f_y_bartender_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_f_y_bartender_01') do
                        RequestModel('s_f_y_bartender_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        local v = CreateVehicle(veh, pos.x, pos.y + 300, pos.z + 700, GetEntityHeading(target), true, true)
						local v1 = CreateVehicle(veh, pos.x + 300, pos.y, pos.z + 800, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) and DoesEntityExist(v1) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_f_y_bartender_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_f_y_bartender_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_f_y_bartender_01'), pos.x, pos.y, pos.z, true, true)
								local ped1 = CreatePed(21, GetHashKey('s_f_y_bartender_01'), pos.x, pos.y, pos.z, true, true)								
                                if DoesEntityExist(ped) and DoesEntityExist(ped1) then
                                    SetPedIntoVehicle(ped, v, -1)
									SetPedIntoVehicle(ped1, v1, -1)
									SetEntityVisible(ped, false, true)
									TaskPlaneChase(ped, target, 100.00, 786468)
                                    TaskPlaneChase(ped1, target, 100.00, 786468)										
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end		
				  elseif VladmirAK47.Button('~h~Exit ~s~Vehicle') then
				  local target = PlayerPedId(SelectedPlayer)
				  ClearPedTasksImmediately(target)
				 elseif VladmirAK47.Button('~h~Random clothes') then
                if not skin1 then
                 skin1 = true
                        av('~h~~b~on~.', false)
                else
                 skin1 = false
                        av('~h~~b~Off.', false)
                end	
                elseif VladmirAK47.Button('~h~Suicide') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif VladmirAK47.Button("~h~Heal") then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif VladmirAK47.Button("~h~Armour") then
                    SetPedArmour(PlayerPedId(-1), 200)
                end					
								VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('SuperPower') then
                if VladmirAK47.Button('~h~Go back to Normal') then 
				local playerPed = GetPlayerPed(-1)
				SetPedRandomComponentVariation(PlayerPedId(), true)
				SetEntityMaxHealth(playerPed, 200);
				SetPedMaxHealth(playerPed, 200);
				SetEntityHealth(playerPed, 200);
				ResetPedMovementClipset(playerPed, 1.0);
				ResetPedStrafeClipset(playerPed);
                SetPedUsingActionMode(playerPed, true, 0, 0)
                RemoveWeaponFromPed(playerPed, 0x42BF8A85)				
                elseif VladmirAK47.Button('~h~Juggernaut ') then 
				Jugg(player)
                av('~h~~b~Use your Minigun.', false)
                elseif VladmirAK47.Button('~h~Skate Boarding') then
					  StartSkating2()
					av('~h~~b~Press "HOME" to stop press', false)  			
                elseif VladmirAK47.Button('~h~Sky Diving') then
                      --EquipSkateboard()
					  IRON1()
					av('~h~~b~Press "HOME" for effect', false) 				
                end					
								VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Animations') then
				if VladmirAK47.Button('~h~Clear Animations ') then
				  local target = PlayerPedId(SelectedPlayer)
				  ClearPedTasksImmediately(target)			
                elseif VladmirAK47.Button('~h~Sex Receiver') then
				RequestAnimDict('rcmpaparazzo_2')
				Citizen.Wait(200)
                if HasAnimDictLoaded('rcmpaparazzo_2') then				
				TaskPlayAnim(PlayerPedId(-1), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
				end
                elseif VladmirAK47.Button('~h~Sex Giver') then
				RequestAnimDict('rcmpaparazzo_2')
				Citizen.Wait(200)
                if HasAnimDictLoaded('rcmpaparazzo_2') then				
				TaskPlayAnim(PlayerPedId(-1), 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
				end
                elseif VladmirAK47.Button('~h~Gay Dance') then
				RequestAnimDict('mini@strip_club@private_dance@part1')
				Citizen.Wait(200)
                if HasAnimDictLoaded('mini@strip_club@private_dance@part1') then				
				TaskPlayAnim(PlayerPedId(-1), 'mini@strip_club@private_dance@part1', 'priv_dance_p1', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
                end
                elseif VladmirAK47.Button('~h~Turning around') then
				RequestAnimDict('mini@strip_club@pole_dance@pole_dance1')
				Citizen.Wait(200)
                if HasAnimDictLoaded('mini@strip_club@pole_dance@pole_dance1') then				
				TaskPlayAnim(PlayerPedId(-1), 'mini@strip_club@pole_dance@pole_dance1', 'pd_dance_01', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
                end
                elseif VladmirAK47.Button('~h~Celebrate') then
				RequestAnimDict('rcmfanatic1celebrate')
				Citizen.Wait(200)
                if HasAnimDictLoaded('rcmfanatic1celebrate') then				
				TaskPlayAnim(PlayerPedId(-1), 'rcmfanatic1celebrate', 'celebrate', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
                end
                elseif VladmirAK47.Button('~h~Electrocution') then
				RequestAnimDict('ragdoll@human')
				Citizen.Wait(200)
                if HasAnimDictLoaded('ragdoll@human') then				
				TaskPlayAnim(PlayerPedId(-1), 'ragdoll@human', 'electrocute', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
				end
                elseif VladmirAK47.Button('~h~Suicide') then
				RequestAnimDict('mp_suicide')
				Citizen.Wait(200)
                if HasAnimDictLoaded('mp_suicide') then				
				TaskPlayAnim(PlayerPedId(-1), 'mp_suicide', 'pistol', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
				end
                elseif VladmirAK47.Button('~h~Shower') then
				RequestAnimDict('mp_safehouseshower@male@')
				Citizen.Wait(200)
                if HasAnimDictLoaded('mp_safehouseshower@male@') then				
				TaskPlayAnim(PlayerPedId(-1), 'mp_safehouseshower@male@', 'male_shower_idle_b', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
				end	
                elseif VladmirAK47.Button('~h~Dog Pissing') then
				RequestAnimDict('creatures@rottweiler@move')
				Citizen.Wait(200)
                if HasAnimDictLoaded('creatures@rottweiler@move') then				
				TaskPlayAnim(PlayerPedId(-1), 'creatures@rottweiler@move', 'pee_right_idle', 2.0, 2.5, -1, 49, 0, 0, 0, 0)			
				end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Ride') then
                if VladmirAK47.Button('~h~Stop Ride') then
					local target = GetPlayerPed(-1)
                     Deer.Destroy()				 
                elseif VladmirAK47.Button('~h~Dear') then
                     Deer.Create()
					 Citizen.Wait(10)
                     Deer.Attach()
                elseif VladmirAK47.Button('~h~Cow') then
                     Deer.Create1()
					 Citizen.Wait(10)
                     Deer.Attach()
                elseif VladmirAK47.Button('~h~Pig') then
                     Deer.Create2()
					 Citizen.Wait(10)
                     Deer.Attach()
                elseif VladmirAK47.Button('~h~Monkey') then
                     Deer.Create3()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Chop') then
                     Deer.Create4()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Cormorant') then
                     Deer.Create5()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Coyote') then
                     Deer.Create6()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Huskey') then
                     Deer.Create7()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Lion') then
                     Deer.Create8()
					 Citizen.Wait(10)
                     Deer.Attach()	
                elseif VladmirAK47.Button('~h~Rat') then
                     Deer.Create9()
					 Citizen.Wait(10)
                     Deer.Attach()						 
                end					
				
								VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('SkinChange') then
                if VladmirAK47.Button('~c~~h~Model~s~ Clown') then
							local model = "s_m_y_clown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mime') then
							local model = "S_M_Y_Mime"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Stripper') then
			local model = "s_f_y_stripper_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Cop M') then
			local model = "s_m_y_cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Cop F') then
			local model = "MP_F_Cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Sheriff M') then
			local model = "S_M_Y_Sheriff_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Sheriff F') then
			local model = "S_F_Y_Sheriff_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model ~b~SWAT M') then
			local model = "S_M_Y_Swat_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Armoured Ranger M') then
			local model = "S_M_M_Armoured_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end	
                elseif VladmirAK47.Button('~c~~h~Model~b~ Ranger F') then
			local model = "S_F_Y_Ranger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end	
                elseif VladmirAK47.Button('~c~~h~Model~b~ Ranger Male') then
			local model = "S_M_Y_Ranger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Robot Ranger Male') then
			local model = "U_M_Y_RSRanger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Desert Army 01') then
			local model = "G_M_Y_DesArmy_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Desert Army 02') then
			local model = "G_M_Y_DesArmy_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Desert Army 03') then
			local model = "G_M_Y_DesArmy_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Desert Army 04') then
			local model = "G_M_Y_DesArmy_04"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Desert Army 05') then
			local model = "G_M_Y_DesArmy_05"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Marine 01') then
			local model = "S_M_Y_Marine_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end					
                elseif VladmirAK47.Button('~c~~h~Model~b~ Marine 02') then
			local model = "S_M_Y_Marine_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Marine 03') then
			local model = "S_M_Y_Marine_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Marine Commander') then
			local model = "S_M_M_Marine_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Marine General') then
			local model = "S_M_M_Marine_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Black OPS1 M') then
			local model = "S_M_Y_BlackOps_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Black OPS2 M') then
			local model = "S_M_Y_BlackOps_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Black OPS3 M') then
			local model = "S_M_Y_BlackOps_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Prison Guard M') then
			local model = "S_M_M_PrisGuard_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~b~ Paramedic M') then
			local model = "S_M_M_Paramedic_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~y~ Vagos F') then
			local model = "G_F_Y_Vagos_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Ramp Gang M') then
			local model = "IG_Ramp_Gang"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Ramp Gang Boss M') then
			local model = "CSB_Ramp_gang"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Fam Gang 01 M') then
			local model = "MP_M_FamDD_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Fam Gang 02 M') then
			local model = "G_M_Y_FamDNF_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Fam Gang Boss M') then
			local model = "G_M_Y_FamCA_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang 01 M') then
			local model = "G_M_Y_BallaEast_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang 02 M') then
			local model = "G_M_Y_BallaSout_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang 03 M') then
			local model = "IG_BallasOG"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang 04 M') then
			local model = "IG_BallasOG"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang F') then
			local model = "G_F_Y_Ballas_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~p~ Bella Gang Boss M') then
			local model = "G_M_Y_BallaOrig_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Jewel F') then
			local model = "U_F_Y_JewelAss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Jewel Thief') then
			local model = "U_M_M_JewelThief"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~o~ Prisoner 01 M') then
			local model = "S_M_Y_PrisMuscl_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~o~ Prisoner 02 M') then
			local model = "S_M_Y_Prisoner_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~o~ Prisoner 03 M') then
			local model = "U_M_Y_Prisoner_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder 01 M') then
			local model = "A_M_Y_MusclBeac_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder 02 M') then
			local model = "A_M_Y_MusclBeac_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder 03 M') then
			local model = "A_M_Y_Surfer_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder 04 M') then
			local model = "IG_TylerDix"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder 05 M') then
			local model = "u_m_y_babyd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Body Builder F') then
			local model = "CS_MaryAnn"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Beach 01 F') then
			local model = "A_F_M_Beach_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Beach 02 F') then
			local model = "A_F_Y_Beach_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Beach Fat F') then
			local model = "A_F_M_FatCult_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 01') then
			local model = "A_F_Y_BevHills_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 02') then
			local model = "A_F_Y_BevHills_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 03') then
			local model = "A_F_Y_BevHills_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 04') then
			local model = "A_F_Y_BevHills_04"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 05') then
			local model = "CSB_Bride"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 06') then
			local model = "U_F_Y_PoppyMich"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 07') then
			local model = "A_F_Y_SouCent_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Female 08') then
			local model = "CSB_Anita"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Skater Female') then
			local model = "A_F_Y_Skater_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Old Man') then
			local model = "U_M_O_TapHillBilly"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 01') then
			local model = "S_M_Y_Barman_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 02') then
			local model = "A_M_Y_BreakDance_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 03') then
			local model = "U_M_Y_Chip"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 04') then
			local model = "U_M_Y_GunVend_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 05') then
			local model = "CSB_Groom"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Rich Guy 06') then
			local model = "A_M_Y_Business_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Chinese M 01') then
			local model = "G_M_M_ChiBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Chinese M 02') then
			local model = "G_M_M_ChiGoon_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Chinese M 03') then
			local model = "G_M_M_ChiGoon_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Chinese M 04') then
			local model = "CSB_Hao"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Chinese F') then
			local model = "A_F_Y_Vinewood_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean M 01') then
			local model = "A_M_Y_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean M 02') then
			local model = "A_M_Y_KTown_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean M 03') then
			local model = "G_M_M_KorBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean M 04') then
			local model = "G_M_Y_Korean_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean M 05') then
			local model = "G_M_Y_Korean_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean F 01') then
			local model = "S_F_Y_MovPrem_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean F 02') then
			local model = "A_F_M_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean F 03') then
			local model = "A_F_M_KTown_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Korean F 04') then
			local model = "A_F_O_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 01') then
			local model = "A_M_M_MexCntry_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 02') then
			local model = "A_M_M_MexLabor_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 03') then
			local model = "A_M_Y_MexThug_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 04') then
			local model = "G_M_M_MexBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 05') then
			local model = "G_M_M_MexBoss_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 06') then
			local model = "U_M_Y_Mani"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican M 07') then
			local model = "S_M_M_Mariachi_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican F') then
			local model = "U_F_Y_SpyActress"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Mexican HMaid F') then
			local model = "S_F_M_Maid_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Boar') then
			local model = "A_C_Boar"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Pig') then
			local model = "A_C_Pig"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Deer') then
			local model = "A_C_Deer"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Chicken') then
			local model = "A_C_Hen"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Hawk') then
			local model = "A_C_Chickenhawk"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Crow') then
			local model = "A_C_Crow"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Monkey') then
			local model = "A_C_Chimp"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Dog Chop') then
			local model = "A_C_Chop"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Dog Husky') then
			local model = "A_C_Husky"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Dog Rottweiler') then
			local model = "A_C_Rottweiler"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Dog Shepherd') then
			local model = "A_C_shepherd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Lion') then
			local model = "A_C_MtLion"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Rat') then
			local model = "A_C_Rat"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Shark') then
			local model = "A_C_SharkTiger"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model Animal~s~ Coyote') then
			local model = "A_C_Coyote"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~g~ Alien') then
			local model = "s_m_m_movalien_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Pongo') then
			local model = "u_m_y_pogo_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ Bartender F') then
			local model = "S_F_Y_Bartender_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif VladmirAK47.Button('~c~~h~Model~s~ FiveM') then
			local model = "mp_m_freemode_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
			
					
				else ShowInfo("~r~Model not recognized")
				    end
                elseif VladmirAK47.Button('~c~~h~Randomize~s~ Clothing') then
				     SetPedRandomComponentVariation(PlayerPedId(), true)
                end
					
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('OnlinePlayerMenu') then
                for i = 0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and
                            VladmirAK47.MenuButton(
                                '~b~▶ ~s~' .. GetPlayerName(i) .. ' ~b~[' .. GetPlayerServerId(i) .. ']~s~ ~s~[' ..
                                i .. ']~s~ ' .. (IsPedDeadOrDying(GetPlayerPed(i), 1) and '~r~DEAD' or
                                '~p~ALIVE'),
                                'PlayerOptionsMenu'
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('PlayerOptionsMenu') then
                VladmirAK47.SetSubTitle('PlayerOptionsMenu', 'Player Options [' .. GetPlayerName(SelectedPlayer) .. ']')
                if VladmirAK47.MenuButton('~h~~r~▶~s~ Undecetable Troll Options', 'Trollmenu2') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Vehicle Options', 'VehicleOptions') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Super Power Options', 'SuperPowerOptions') then					
                elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Object Options', 'ObjectOptions') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Sound Options', 'SoundOptions') then				
                elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Troll Options', 'Trollmenu') then
				elseif VladmirAK47.MenuButton('~h~~r~▶~s~ Ped Options', 'Pedstuff') then
                elseif VladmirAK47.Button('~h~Spectate', cC and '[SPECTATING]') then
                    SpectatePlayer(SelectedPlayer)
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Kick from Vehicle',
                        freeze2,
                        function(dR)
                            freeze2 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then			 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~freeze V2',
                        freezeV1,
                        function(dR)
                           freezeV1 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then							
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Clone Skin',
                        clone,
                        function(dR)
                           clone = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then											
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Attach to him',
                        Shock99,
                        function(dR)
                           Shock99 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Massive Lag',
                        TEST22,
                        function(dR)
                           TEST22 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Tapatio Lag',
                        TEST31,
                        function(dR)
                           TEST31 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
                elseif VladmirAK47.Button('~h~Freeze') then
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(SelectedPlayer), 0, 0, -0.4)
                    RequestModel('prop_gascage01')
                    while not HasModelLoaded('prop_gascage01') do
                        RequestModel('prop_gascage01')
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded('prop_gascage01') then
					Citizen.Wait(100)
						local v = CreateObject(GetHashKey('prop_gascage01'), pos.x, pos.y, pos.z, true, true, true)
                        FreezeEntityPosition(v, true)
                        SetEntityVisible(v, false, true)

                    end				 
                elseif VladmirAK47.Button('~h~Teleport To') then
                    if cO then
                        local confirm = KeyboardInput('Are you sure? y/n', '', 0)
                        if confirm == 'y' then
                            local Entity =
                                IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                                PlayerPedId(-1)
                            SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                        elseif confirm == 'n' then
                            av('~h~~b~Operation cancelled~s~.', false)
                        else
                            av('~h~~b~Invalid Confirmation~s~.', true)
                            av('~h~~b~Operation cancelled~s~.', false)
                        end
                    else
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    end
                elseif VladmirAK47.Button('~h~Teleport into his car') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)				 
					 SetEntityCoords(ped, pos.x, pos.y, pos.z - 4)				 
					 Citizen.Wait(100)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, 0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end	
                elseif VladmirAK47.Button('~h~Revive ~s~Player') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif VladmirAK47.Button('~h~Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end					
                elseif VladmirAK47.Button('~h~Give All Weapons') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif VladmirAK47.Button('~h~Remove All Weapons') then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif VladmirAK47.Button('~h~Give Vehicle') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
                    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
                        RequestModel(cb)
                        while not HasModelLoaded(cb) do
                            Citizen.Wait(0)
                        end
                        local veh =
                            CreateVehicle(GetHashKey(cb), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
                    else
                        av('~b~Model is not valid!', true)
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('SuperPowerOptions') then
                if
                    VladmirAK47.CheckBox(
                        '~h~Stars',
                        drug16,
                        function(dR)
                           drug16 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~New Year',
                        Weed2,
                        function(dR)
                            Weed2 = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~The Joker',
                        drug2,
                        function(dR)
                            drug2 = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Alein',
                        drug3,
                        function(dR)
                            drug3 = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~SuperMan',
                        drug5,
                        function(dR)
                            drug5 = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~GTEST',
                        drug6,
                        function(dR)
                            drug6 = dR
                        end
                    )
                 then				 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Iron Man',
                        drug4,
                        function(dR)
                            drug4 = dR
                        end
                    )
                 then				 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Seel',
                        drug17,
                        function(dR)
                           drug17 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then	
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Deadly Waves',
                        drug18,
                        function(dR)
                           drug18 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then	
                elseif
                    VladmirAK47.CheckBox(
                        '~h~The Flash',
                        drug19,
                        function(dR)
                           drug19 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Smoke from the ass',
                        drug20,
                        function(dR)
                           drug20 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Explosions',
                        drug21,
                        function(dR)
                           drug21 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Small Flys',
                        drug22,
                        function(dR)
                           drug22 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Moon',
                        drug23,
                        function(dR)
                           drug23 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Electric Sound',
                        drug24,
                        function(dR)
                           drug24 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Electric',
                        drug25,
                        function(dR)
                           drug25 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Bullets from Neck',
                        drug26,
                        function(dR)
                           drug26 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Power from Leg',
                        drug27,
                        function(dR)
                           drug27 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Firework Sound',
                        drug28,
                        function(dR)
                           drug28 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Fire work',
                        drug29,
                        function(dR)
                           drug29 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif
                    VladmirAK47.CheckBox(
                        '~h~Fire from back',
                        drug30,
                        function(dR)
                           drug30 = dR
                        selectedPlayerId = SelectedPlayer
                        end
                    )
                 then				 
                end				 
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('SoundOptions') then
                if VladmirAK47.Button('~h~Death Sound') then
				selectedPlayerId = SelectedPlayer
                if not test4 then
                 test4 = true
                        av('~h~~b~Death ON~.', false)
                else
                 test4 = false
                        av('~h~~b~Death Off.', false)
                end
                elseif VladmirAK47.Button('~h~Hell Sound ') then
				selectedPlayerId = SelectedPlayer
                if not test998 then
                 test998 = true
                        av('~h~~b~Hell ON~.', false)
                else
                 test998 = false
                        av('~h~~b~Hell Off.', false)
                end				
                elseif VladmirAK47.Button('~h~Taliban sound') then
				selectedPlayerId = SelectedPlayer
                if not test991 then
                 test991 = true
                        av('~h~~b~Taliban ON~.', false)
                else
                 test991 = false
                        av('~h~~b~Taliban Off.', false)
                end	
                elseif VladmirAK47.Button('~h~ISIS Sound') then
				selectedPlayerId = SelectedPlayer
                if not test993 then
                 test993 = true
                        av('~h~~b~ISIS ON~.', false)
                else
                 test993 = false
                        av('~h~~b~ISIS Off.', false)
                end	
                elseif VladmirAK47.Button('~h~AK47 Sound') then
				selectedPlayerId = SelectedPlayer
                if not test999 then
                 test999 = true
                        av('~h~~b~Sound ON~.', false)
                else
                 test999 = false
                        av('~h~~b~Sound Off.', false)
                end	
                elseif VladmirAK47.Button('~h~Water Sound') then
				selectedPlayerId = SelectedPlayer
                if not mysound then
                 mysound = true
                        av('~h~~b~Sound ON~.', false)
                else
                 mysound = false
                        av('~h~~b~Sound Off.', false)
                end					
                elseif VladmirAK47.Button('~h~Steam Sound') then
                        local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z - 2, 11, 99, true, false, 0.0)
                elseif VladmirAK47.Button('~h~OMG Sound') then
				selectedPlayerId = SelectedPlayer
                if not test3000 then
                 test3000 = true
                        av('~h~~b~ ON~.', false)
                else
                 test3000 = false
                        av('~h~~b~ Off.', false)
                end							
                elseif VladmirAK47.Button('~h~EMP sound') then
				selectedPlayerId = SelectedPlayer
                if not test2998 then
                 test2998 = true
                        av('~h~~b~ ON~.', false)
                else
                 test2998 = false
                        av('~h~~b~ Off.', false)
                end
				elseif VladmirAK47.Button('~h~Scream sounds') then
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                     RequestModel('mp_m_freemode_01')
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('mp_m_freemode_01'), pos.x, pos.y, pos.z - 2.8, true, true)	                                 							
                                if DoesEntityExist(ped) then
									 SetEntityVisible(ped, false, true)
                                      SetPedKeepTask(ped)
                                end	
				elseif VladmirAK47.Button('~h~Hey sounds') then
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                     RequestModel('mp_m_freemode_01')
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('mp_m_freemode_01'), pos.x, pos.y, pos.z - 2.8, true, true)	                                 							
                                if DoesEntityExist(ped) then
                                     PlayAmbientSpeechWithVoice(ped, "WEPSEXPERT_GREETSHOPGEN", "WEPSEXP", "SPEECH_PARAMS_FORCE", 200)
									 FreezeEntityPosition(ped, true)
									 SetEntityVisible(ped, false, true)
                                      SetPedKeepTask(ped)
                                end					
                end				
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('ObjectOptions') then
                if VladmirAK47.Button('~h~USA FLAG') then
				selectedPlayerId = SelectedPlayer
                if not bird1 then
                 bird1 = true
                        av('~h~~p~ on~.', false)
                else
                 bird1= false
                        av('~h~~b~Off.', false)
                end
				elseif VladmirAK47.Button('~h~Barrier') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2)  --prop_mp_barrier_02b
				local bH1 = CreateObject(GetHashKey('prop_mp_barrier_02b'), oS.x, oS.y, oS.z, true, true, true)				
				elseif VladmirAK47.Button('~h~Train') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2)  --prop_mp_barrier_02b
				local bH1 = CreateObject(GetHashKey('freight'), oS.x, oS.y, oS.z + 2.3, true, true, true)
				elseif VladmirAK47.Button('~h~Jet') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 			
				local bH1 = CreateObject(GetHashKey('p_med_jet_01_s'), oS.x, oS.y, oS.z, true, true, true)	
				FreezeEntityPosition(BH1, true)
				elseif VladmirAK47.Button('~h~Couch') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('miss_rub_couch_01_l1'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)		
				elseif VladmirAK47.Button('~h~Rock') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_rock_4_big2'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)	
				elseif VladmirAK47.Button('~h~Soveit tank') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_rub_t34'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Tyre wall') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_tyre_wall_03b'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Tree') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_tree_birch_02'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Stunt Jump') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('stt_prop_stunt_jump15'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Soccer ball') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('stt_prop_stunt_soccer_sball'), oS.x, oS.y, oS.z, true, true, true)
				elseif VladmirAK47.Button('~h~Big stunt jump') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('stt_prop_stunt_track_jump'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Grave') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('test_prop_gravestones_09a'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(bH1, true)
				elseif VladmirAK47.Button('~h~Dead guy') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_ped_gib_01'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)
				elseif VladmirAK47.Button('~h~Arcade') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('prop_arcade_02'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)
				elseif VladmirAK47.Button('~h~Yacht') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('apa_mp_apa_yacht'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)
				elseif VladmirAK47.Button('~h~Ufo') then
				local ped1 = GetPlayerPed(SelectedPlayer)
 	            local oS = GetPedBoneCoords(ped1, 0, 0.0, 0.0, 0.2) 				
				local bH1 = CreateObject(GetHashKey('p_spinning_anus_s'), oS.x, oS.y, oS.z, true, true, true)
                   FreezeEntityPosition(BH1, true)				   
				   
				end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Pedstuff') then
				if VladmirAK47.Button('~h~Police Follow Player') then
                    local veh = ("Police")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, (GetPlayerPed(SelectedPlayer)), -1, 50.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end								
				elseif VladmirAK47.Button('~h~Police follow Vehicle') then
                    local veh = ("Police")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), -1, 50.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end					
				elseif VladmirAK47.Button('~h~Heli Follow Player') then
                    local veh = ("Buzzard")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 820,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, (GetPlayerPed(SelectedPlayer)), -1, 50.0, 1082917029, 37.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end
				elseif VladmirAK47.Button('~h~Heli Follow Vehicle') then
                    local veh = ("Buzzard")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 820,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), -1, 50.0, 1082917029, 37.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end				
				elseif VladmirAK47.Button('~h~Tank Follow Player') then
                    local veh = ("Rhino")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 90),
                            pos.y - (yf * 90),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, (GetPlayerPed(SelectedPlayer)), -1, 250.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end	
				elseif VladmirAK47.Button('~h~Tank Follow Vehicle') then
                    local veh = ("Rhino")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 90),
                            pos.y - (yf * 90),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), -1, 7.5, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end
				elseif VladmirAK47.Button('~h~ClownGang Follow Vehicle') then
                    local veh = ("Speedo2")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 100),
                            pos.y - (yf * 100),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), -1, 7.5, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end	
				elseif VladmirAK47.Button('~h~Plane fly above him') then
                    local veh = ("Shamal")
                    for i = 0, 0 do
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 90),
                            pos.y - (yf * 90),
                            pos.z + 700,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
						local v1 = CreateVehicle(veh, pos.x + 300, pos.y, pos.z + 800, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    TaskPlaneChase(ped, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), 100.00, 786468)
									TaskPlaneChase(ped1, (GetPlayerPed(SelectedPlayer)), 100.00, 786468)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
									SetDriverAbility(ped1, 10.0)
                                    SetDriverAggressiveness(ped1, 10.0)
                                end
                            end
                        end
                    end
                end
				elseif VladmirAK47.Button('~h~AirStrike Attack') then
                    local veh = ("lazer")
                    for i = 0, 0 do
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 90),
                            pos.y - (yf * 90),
                            pos.z + 700,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
						local v1 = CreateVehicle(veh, pos.x + 300, pos.y, pos.z + 600, GetEntityHeading(target), true, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    TaskPlaneChase(ped, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), 100.00, 786468)
									TaskPlaneChase(ped1, (GetPlayerPed(SelectedPlayer)), 100.00, 786468)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
									SetDriverAbility(ped1, 10.0)
                                    SetDriverAggressiveness(ped1, 10.0)
									TaskCombatPed(ped, target, 0, 16)
								    TaskCombatPed(ped1, target, 0, 16)
								    SetPedKeepTask(ped, true)
								    SetPedKeepTask(ped1, true)
                                end
                            end
                        end
                    end
                end						
                end				
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('VehicleOptions') then
				if VladmirAK47.Button('~h~Steal his car') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					 NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))					 
                     d4 = false	
					 SetEntityCoords(ped, pos.x, pos.y + 45, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(1000)
                      local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1)
                      SetEntityCoords(Entity, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end	
				elseif VladmirAK47.Button('~h~Break his Engine') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					 NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))					 
                     d4 = false	
					 SetEntityCoords(ped, pos.x, pos.y, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(4000)
                     SetVehicleEngineHealth(vehicle, 0)
                     SetVehicleUndriveable(vehicle, true)					 
					 Citizen.Wait(1000)
                      SetEntityCoords(ped, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end
				elseif VladmirAK47.Button('~h~Burst his Vehicle') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					 NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))					 
                     d4 = false	
					 SetEntityCoords(ped, pos.x, pos.y, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(4000)
                       SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
                       SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
                       SetVehicleTyreBurst(vehicle, 2, true, 1000.0)
                        SetVehicleTyreBurst(vehicle, 3, true, 1000.0)
                        SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
                        SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
                        SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
                        SetVehicleTyreBurst(vehicle, 7, true, 1000.0)					 
					 Citizen.Wait(1000)
                      SetEntityCoords(ped, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end					
				elseif VladmirAK47.Button('~h~Make his Car Pink') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					 NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))
                     d4 = false					 
                     --SetEntityCoords(ped, pos)
					 SetEntityCoords(ped, pos.x, pos.y, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(4000)
                     SetVehicleColours(vehicle, 135, 135)					 
					 Citizen.Wait(1000)
                      SetEntityCoords(ped, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end	
				elseif VladmirAK47.Button('~h~Lock his Vehicle') then	
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                     NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))					 
                     d4 = false
					 SetEntityCoords(ped, pos.x, pos.y + 45, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(5000)
                      local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1)
                        SetVehicleDoorsLocked(vehicle, 4)
					  Citizen.Wait(1000)
					  SetEntityCoords(ped, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end					 					
				elseif VladmirAK47.Button('~h~Delete his Vehicle') then
				    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                     NetworkSetInSpectatorMode(false, GetPlayerPed(-1))
					 local ped = GetPlayerPed(-1)
					 local target = GetPlayerPed(SelectedPlayer)
                     local pos = GetEntityCoords(target)
                     local vehicle = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                     local cM = GetEntityCoords(GetPlayerPed(-1))					 
                     d4 = false
					 SetEntityCoords(ped, pos.x, pos.y + 45, pos.z - 4)				 
					 ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
					 Citizen.Wait(1000)					 
                     SetPedIntoVehicle(PlayerPedId(-1), vehicle, -1)
					 Citizen.Wait(1000)
                      local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1)
                      SetEntityCoords(Entity, 1234, 1234, 700, 0.0, 0.0, 0.0, false)
					  Citizen.Wait(1000)
					  ClearPedTasksImmediately(GetPlayerPed(-1))
					  Citizen.Wait(1000)
					  SetEntityCoords(ped, cM.x, cM.y, cM.z, 0.0, 0.0, 0.0, false)
					  d4 = true
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)					  
                    end					 
				end						
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Trollmenu') then 
                if VladmirAK47.Button('~h~Die like bitch ') then
				selectedPlayerId = SelectedPlayer
                if not test2096 then
                 test2096 = true
                        av('~h~~b~ ON~.', false)
                else
                 test2096 = false
                        av('~h~~b~ Off.', false)
                end			
                elseif VladmirAK47.Button('~h~Suprise light') then
				selectedPlayerId = SelectedPlayer
                if not test2999 then
                 test2999 = true
                        av('~h~~b~ ON~.', false)
                else
                 test2999 = false
                        av('~h~~b~ Off.', false)
                end	
                elseif VladmirAK47.Button('~h~OMG light') then
				selectedPlayerId = SelectedPlayer
                if not test2997 then
                 test2997 = true
                        av('~h~~b~ ON~.', false)
                else
                 test2997 = false
                        av('~h~~b~ Off.', false)
                end									
                elseif VladmirAK47.Button('~h~Jesus light') then
				selectedPlayerId = SelectedPlayer
                if not test992 then
                 test992 = true
                        av('~h~~b~light ON~.', false)
                else
                 test992 = false
                        av('~h~~b~Light Off.', false)
                end
                elseif VladmirAK47.Button('~h~Jesus Smoke') then
				selectedPlayerId = SelectedPlayer
                if not test994 then
                 test994 = true
                        av('~h~~b~Smoke ON~.', false)
                else
                 test994 = false
                        av('~h~~b~Smoke Off.', false)
                end	
                elseif VladmirAK47.Button('~h~Ghosts Smoke') then
				selectedPlayerId = SelectedPlayer
                if not test995 then
                 test995 = true
                        av('~h~~b~Ghosts ON~.', false)
                else
                 test995 = false
                        av('~h~~b~Ghosts Off.', false)
                end			
                elseif VladmirAK47.Button('~r~Tapatio Explosions ') then
				selectedPlayerId = SelectedPlayer
                if not test997 then
                 test997 = true
                        av('~h~~b~Explosions ON~.', false)
                else
                 test997 = false
                        av('~h~~b~Explosions Off.', false)
                end					
                elseif VladmirAK47.Button('~b~Tapatio Burn') then
				selectedPlayerId = SelectedPlayer
                if not test996 then
                 test996 = true
                        av('~h~~b~Burn ON~.', false)
                else
                 test996 = false
                        av('~h~~b~Burn Off.', false)
                end				
                elseif VladmirAK47.Button('~h~BoggyMan Player') then
				selectedPlayerId = SelectedPlayer
                if not Boggyman then
                 Boggyman = true
                        av('~h~~b~Boggyman ON~.', false)
                else
                 Boggyman = false
                        av('~h~~b~Boggyman Off.', false)
                end										
                elseif VladmirAK47.Button('~h~Forcefield') then
				selectedPlayerId = SelectedPlayer
                if not forcefield then
                 forcefield = true
                        av('~h~~b~Forcefield ON~.', false)
                else
                 forcefield = false
                        av('~h~~b~Forcefield Off.', false)
                end									
                elseif VladmirAK47.Button('~h~Light Player') then
				selectedPlayerId = SelectedPlayer
                if not active then
                 active = true
                        av('~h~~b~Light on~.', false)
                else
                 active = false
                        av('~h~~b~Light Off.', false)
                end	
                elseif VladmirAK47.Button('~h~LightV2 Player') then
				selectedPlayerId = SelectedPlayer
                if not active1 then
                 active1 = true
                        av('~h~~b~Light on~.', false)
                else
                 active1 = false
                        av('~h~~b~Light Off.', false)
                end					
                elseif VladmirAK47.Button('~h~Smoke Player') then
				selectedPlayerId = SelectedPlayer
                if not smoke1 then
                 smoke1 = true
                        av('~h~~b~Smoke on~.', false)
                else
                 smoke1 = false
                        av('~h~~b~Smoke Off.', false)
                end	
                elseif VladmirAK47.Button('~h~Boss Mode') then
				selectedPlayerId = SelectedPlayer
                if not bossmode then
                 bossmode = true
                        av('~h~~b~BOSS ON~.', false)
                else
                 bossmode = false
                        av('~h~~b~BOSS OFF.', false)
                end					
                elseif VladmirAK47.Button('~h~Launch Player') then
                        local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z - 2, 13, 5.0, false, false, 0.0)
                elseif VladmirAK47.Button('~h~Silent kill') then
				local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    AddExplosion(Pos.x, Pos.y, Pos.z, 26, FLT_MAX, false, true, 0.0)							
                elseif VladmirAK47.Button('~h~Fire on Player') then			
                        local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, 14, 5.0, false, false, 0.0)									
                elseif VladmirAK47.Button('~h~Explode Player') then
                        local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                        AddExplosion (Pos.x, Pos.y, Pos.z, 10, 5.0, false, false, 0.0)																			
                elseif VladmirAK47.Button('~h~Burn ~s~Player') then
				local Pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
				AddExplosion (Pos.x, Pos.y, Pos.z, 29, 0.0, false, false, 0.0)	
                end
                VladmirAK47.Display()
            elseif				
                IsControlJustReleased(0, 157) then c6() 				
                VladmirAK47.Display()
            elseif
                IsDisabledControlPressed(0, 217) 
             then
                if H4tuf5 then
                    VladmirAK47.OpenMenu('VladmirAK47')
                else
                    TmEM1U()
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Trollmenu2') then
                if VladmirAK47.Button('~h~Dildo') then
				selectedPlayerId = SelectedPlayer
		         local ped1 = GetPlayerPed(selectedPlayerId)
				 local oS = GetEntityCoords(ped1)
				local bH1 = CreateObject(GetHashKey('prop_cs_dildo_01'), oS.x, oS.y, oS.z + 0.6, true, true, true)	
				NetworkRequestControlOfEntity(bH1)
				SlideObject (bH1, 0, 0, 9999, 0, 0, 9999, false)	
                elseif VladmirAK47.Button('Kill Player') then
					selectedPlayerId = SelectedPlayer
                 local ped = GetPlayerPed(selectedPlayerId)
	             local tLoc = GetEntityCoords(ped)
	             local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	             local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
	             ShootSingleBulletBetweenCoords(origin, destination, 100, true, `WEAPON_STUNGUN`, PlayerPedId(), false, true, 100.0)	
                elseif VladmirAK47.Button('Spawn Bus') then
					selectedPlayerId = SelectedPlayer
		          RequestModelSync('u_m_y_babyd')
		         local ped1 = GetPlayerPed(selectedPlayerId)
				 local oS = GetEntityCoords(ped1)
				local bH1 = CreateObject(GetHashKey('Pbus2'), oS.x, oS.y + 2, oS.z + 1, true, true, true)	
				  NetworkRequestControlOfEntity(bH1)
				  Citizen.Wait(1000)
				  SlideObject (bH1, 31, 12, 999, 0, 0, 999, false)			 
				elseif VladmirAK47.Button('~h~Lion eats him') then
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                     RequestModel('a_c_mtlion')
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_c_mtlion'), pos.x, pos.y, pos.z, true, true)
								local ped1 = CreatePed(21, GetHashKey('a_c_mtlion'), pos.x, pos.y, pos.z, true, true)								
                                if DoesEntityExist(ped) and DoesEntityExist(ped1) then                               
								 TaskCombatPed(ped, target, 0, 16)
								 TaskCombatPed(ped1, target, 0, 16)
								 SetEntityVisible(ped, false, true)
								 SetEntityVisible(ped1, false, true)
								 SetPedKeepTask(ped, true)
								 SetPedKeepTask(ped1, true)
                                end	
				elseif VladmirAK47.Button('~h~RPG Attack') then
					local target = GetPlayerPed(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                     RequestModel('s_f_y_stripper_01')
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_f_y_stripper_01'), pos.x, pos.y, pos.z, true, true)							
                                if DoesEntityExist(ped) then
                                GiveWeaponToPed(ped, GetHashKey('WEAPON_RPG'), 999, false, true)
                                SetPedAmmo(ped, GetHashKey('WEAPON_RPG'), 999)								
								 TaskCombatPed(ped, target, 0, 16)
								 SetEntityVisible(ped, false, true)
								 SetPedKeepTask(ped, true)
                                end	
                    elseif VladmirAK47.Button('~h~Dirty rat') then
							selectedPlayerId = SelectedPlayer
					local target = GetPlayerPed(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                     RequestModel('a_c_rat')
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_c_rat'), pos.x, pos.y, pos.z, true, true)
								local ped1 = CreatePed(21, GetHashKey('a_c_rat'), pos.x, pos.y, pos.z, true, true)								
                                if DoesEntityExist(ped) and DoesEntityExist(ped1) then
                                 TaskStandGuard(ped, pos.x, pos.y, pos.z, 1, "world_human_musician")
								 TaskStandGuard(ped1, pos.x, pos.y, pos.z, 1, "world_human_musician")
								 SetPedKeepTask(ped, true)
								 SetPedKeepTask(ped1, true)
								end
                    elseif VladmirAK47.Button('~h~Glitch him') then
							selectedPlayerId = SelectedPlayer
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayerId), 0, 0, -0.4)
                    RequestModel('stt_prop_race_start_line_03b')
                    while not HasModelLoaded('stt_prop_race_start_line_03b') do
                        RequestModel('stt_prop_race_start_line_03b')
                        Citizen.Wait(0)
                    end
                    if HasModelLoaded('stt_prop_race_start_line_03b') then
						local v = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), pos.x, pos.y, pos.z - 2, true, true, true)
                        FreezeEntityPosition(v, true)
                        SetEntityVisible(v, false, 2)
					end	
                elseif
                    VladmirAK47.CheckBox(
                        '~h~SURFACE',
                        test8,
                        function(dR)
                            test8 = dR
							selectedPlayerId = SelectedPlayer
                        end
                    )
                 then	
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Vehicle Parts on him',
                        test007,
                        function(dR)
                            test007 = dR
							selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
				 elseif VladmirAK47.Button('~h~Ram him') then
							selectedPlayerId = SelectedPlayer
                    local veh = ("futo")
					local target = PlayerPedId(selectedPlayerId)
                    local pos = GetEntityCoords(GetPlayerPed(selectedPlayerId))
                    local xf = GetEntityForwardX(GetPlayerPed(selectedPlayerId))
                    local yf = GetEntityForwardY(GetPlayerPed(selectedPlayerId))
					local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayerId), 0, -0.2, 0)
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_f_y_bartender_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_f_y_bartender_01') do
                        RequestModel('s_f_y_bartender_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        local v = CreateVehicle(veh, offset.x, offset.y, offset.z, GetEntityHeading(target), true, true)
						SetEntityVisible(v, false, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_f_y_bartender_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_f_y_bartender_01') then
                            Citizen.Wait(50)
							SetVehicleForwardSpeed(v, 120.0)
                            end
                        end
                    end				 					
				elseif VladmirAK47.Button('~h~9/11') then
                    local veh = ("Jet")
                    for i = 0, 0 do
					local target = PlayerPedId(SelectedPlayer)
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    local v = nil
                    RequestModel(veh)
                    RequestModel('a_m_o_acult_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('a_m_o_acult_01') do
                        RequestModel('a_m_o_acult_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 0),
                            pos.y - (yf * 0),
                            pos.z + 100,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('a_m_o_acult_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('a_m_o_acult_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('a_m_o_acult_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskVehicleEscort(ped, v, (GetPlayerPed(SelectedPlayer)), -1, 9999.0, 1082917029, 0.0, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                end
                            end
                        end
                    end
                end	
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Street Builder',
                        manypeds1,
                        function(dR)
                            manypeds1 = dR
							selectedPlayerId = SelectedPlayer
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Shock Player',
                        Shock,
                        function(dR)
                            Shock = dR
							selectedPlayerId = SelectedPlayer
                        end
                    )
                 then				 						
                elseif VladmirAK47.Button('~h~zombie Player') then
				Zombie(SelectedPlayer)
				elseif VladmirAK47.Button('~h~Chicken on Player') then
				Zombie10(SelectedPlayer)				
                elseif VladmirAK47.Button('~h~1M Veh on Player') then
				Zombie99(SelectedPlayer)
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Rapidfire',
                        Shock1,
                        function(dR)
                            Shock1 = dR
							selectedPlayerId = SelectedPlayer
                        end
                    )
                 then									
					 elseif VladmirAK47.Button('~h~Flip ~s~Car') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                                local eU = "s_m_y_swat_01"
                                for i = 0, 0 do 
								local model = GetHashKey("police")
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                Citizen.Wait(0)
                                end
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(50) 
                                        if HasModelLoaded(GetHashKey(eU)) then 
                                            local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped)
											if HasModelLoaded(model) then
                                            local veh = CreateVehicle(model, cM.x, cM.y -0.10, cM.z - 3.0, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)	
                                            SetPedIntoVehicle(ped, veh, -1)
                                             Citizen.Wait(80)											
                                            DeleteVehicle(veh)
											DeletePed(ped)												
                                            end 
                                        end
                                    end 
					end				
					 elseif VladmirAK47.Button('~h~Vehicle ~s~Fly') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
					   local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
					   local eU = "s_m_y_swat_01"
                                for i = 0, 0 do 
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(50) 
                                        if HasModelLoaded(GetHashKey(eU)) then 
                                            local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped)
											SetEntityAsMissionEntity(veh, true, true)
                                            SetPedIntoVehicle(ped, veh, -1)
											SetVehicleForwardSpeed(veh, 1200.0)
											Citizen.Wait(100)											
                                            DeleteVehicle(veh)
											DeletePed(ped)	
											
                                        end
                                    end 
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end						
                end			
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('TeleportMenu') then
                if VladmirAK47.Button('~h~Teleport to waypoint') then
                    c6()
                elseif VladmirAK47.Button('~h~Teleport into nearest ~s~vehicle') then
                    b_()
                elseif VladmirAK47.Button('~h~Teleport to coords') then
                    bT()
                elseif VladmirAK47.Button('~h~Draw custom blip ~s~on map') then
                    bX()
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Show Coords',
                        showCoords,
                        function(dR)
                            showCoords = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('WeaponMenu') then
                if VladmirAK47.MenuButton('~h~~p~▶~s~ Give Single Weapon', 'WeaponTypes') then
                elseif VladmirAK47.Button('~h~Give All Weapons') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(PlayerPedId(-1), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif VladmirAK47.Button('~h~Remove All Weapons') then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif VladmirAK47.Button('~h~Drop your current Weapon') then
                    local ak = GetPlayerPed(-1)
                    local b = GetSelectedPedWeapon(ak)
                    SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1)
                elseif VladmirAK47.Button('~h~Give All Weapons to ~s~everyone') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                GiveWeaponToPed(GetPlayerPed(el), GetHashKey(b6[i]), 1000, false, false)
                            end
                        --end
                    end
                elseif VladmirAK47.Button('~h~Remove All Weapons from ~s~everyone') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                RemoveWeaponFromPed(GetPlayerPed(el), GetHashKey(b6[i]))
                            end
                        --end
                    end
                elseif VladmirAK47.Button('~h~Give Ammo') then
                    for i = 1, #b6 do
                        AddAmmoToPed(PlayerPedId(-1), GetHashKey(b6[i]), 200)
                    end
                elseif
                    VladmirAK47.CheckBox(
                        '~h~OneShot Kill',
                        oneshot,
                        function(dR)
                            oneshot = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Flare Gun',
                        rainbowf,
                        function(dR)
                            rainbowf = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Vehicle Gun',
                        VehicleGun,
                        function(dR)
                            VehicleGun = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Delete Gun',
                        DeleteGun,
                        function(dR)
                            DeleteGun = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bl) do
                    if dE.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'neon' then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'paint' then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'wheeltypes' then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'headlight' then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'licence' then
                        if VladmirAK47.MenuButton(dE.name, dE.id) then
                        end
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for ci, dL in pairs(az) do
                            if VladmirAK47.MenuButton(dE.name, dE.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = 'Installed'
                else
                    xenonStatus = 'Not Installed'
                end
                if VladmirAK47.Button('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bm) do
                    if VladmirAK47.MenuButton(dE.name, dE.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if VladmirAK47.Button('~h~~b~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    else
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('primary') then
                VladmirAK47.MenuButton('~h~~p~▶~s~ Classic', 'classic1')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metallic', 'metallic1')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Matte', 'matte1')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metal', 'metal1')
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('secondary') then
                VladmirAK47.MenuButton('~h~~p~▶~s~ Classic', 'classic2')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metallic', 'metallic2')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Matte', 'matte2')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metal', 'metal2')
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('rimpaint') then
                VladmirAK47.MenuButton('~h~~p~▶~s~ Classic', 'classic3')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metallic', 'metallic3')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Matte', 'matte3')
                VladmirAK47.MenuButton('~h~~p~▶~s~ Metal', 'metal3')
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('classic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metallic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('matte1') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metal1') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('classic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metallic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('matte2') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metal2') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('classic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metallic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('matte3') then
                for dK, em in pairs(bt) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('metal3') then
                for dK, em in pairs(bu) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if VladmirAK47.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('VehicleMenu') then
                if VladmirAK47.MenuButton('~h~~p~▶~s~ Vehicle List', 'CarTypes') then				
				elseif VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~LSC Customs', 'LSC') then
                elseif VladmirAK47.MenuButton('~h~~p~▶~s~ Vehicle Boost', 'BoostMenu') then
                elseif VladmirAK47.MenuButton('~h~~p~▶~s~ Nearest vehicle Destroyer', 'GCT') then
                elseif VladmirAK47.MenuButton('~h~~p~▶~s~ Spawn & Attach Trailer', 'MainTrailer') then
                elseif VladmirAK47.Button('~h~Spawn Custom ~s~Vehicle') then
                    ca()
                elseif VladmirAK47.Button('~h~Delete ~s~Vehicle') then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif VladmirAK47.Button('~h~Repair ~s~Vehicle') then
                    cc()
                elseif VladmirAK47.Button('~h~Repair ~s~Engine') then
                    cd()
                elseif VladmirAK47.Button('~h~Flip ~s~Vehicle') then
                    daojosdinpatpemata()
                elseif VladmirAK47.Button('~h~~b~Max ~s~Tuning') then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif VladmirAK47.Button('~h~RC ~s~Car') then
                    ce()
                    VladmirAK47.CloseMenu()
                elseif
                    VladmirAK47.CheckBox(
                        '~h~No Fall',
                        Nofall,
                        function(dR)
                            Nofall = dR
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall)
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Vehicle Godmode',
                        VehGod,
                        function(dR)
                            VehGod = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Speedboost SHIFT CTRL',
                        VehSpeed,
                        function(dR)
                            VehSpeed = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('GCT') then
                if
                    VladmirAK47.CheckBox(
                        '~h~Engine off Nearest Vehicles',
                        destroyvehicles,
                        function(dR)
                            destroyvehicles = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Delete Nearest Vehicles/Entity',
                        deletenearestvehicle,
                        function(dR)
                            deletenearestvehicle = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Explode Nearest Vehicles',
                        explodevehicles,
                        function(dR)
                            explodevehicles = dR
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~~p~Fuck Nearest Vehicles',
                        fuckallcars,
                        function(dR)
                            fuckallcars = dR
                        end
                    )
                 then
                end																		 
				VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('OnlinePlayerMenu1') then
			if VladmirAK47.Button('~h~Stuipd Objects on them') then
                    bananapartyall()
					elseif
                    VladmirAK47.CheckBox(
                        '~h~Kick from veh~s~ All players',
                        freezeall,
                        function(dR)
                            freezeall = dR
                        end
                    )
                 then
                elseif VladmirAK47.Button('~h~Silent Nuke') then
                if not test1998 then
                 test1998 = true
                        av('~h~~b~ON~.', false)
                else
                 test1998 = false
                        av('~h~~b~Off.', false)
                end					 
                elseif VladmirAK47.Button('~h~Tapatio Wall') then
                 NukeServer1()
                elseif VladmirAK47.Button('~h~Send the owner to Tapatio World') then
                if not test1997 then
                 test1997 = true
                        av('~h~~b~ON~.', false)
                else
                 test1997 = false
                        av('~h~~b~Off.', false)
                end				 
                elseif VladmirAK47.Button('~h~Close the centre of the city ') then				 
                local bH1 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 37.29, -929, 29, true, true, true)				
                local bH = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 37.29, -946, 29, true, true, true)
                local bI = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 5.37, -957, 29, true, true, true)
                local bJ = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 129.14, -916, 26.1, true, true, true)	
                local bJ2 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 28.14, -929, 29.1, true, true, true)
                local bJ3 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 46.14, -1116, 29.1, true, true, true)
                local bJ4 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 46.89, -1115, 29.1, true, true, true)
                local bJ5 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 111.14, -981, 29.1, true, true, true)
                local bJ6 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 200.14, -1112.15, 29.1, true, true, true)
				 local bJ7 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 215.14, -1112.15, 29.1, true, true, true)
                local bJ8 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 305.14, -1119, 29.1, true, true, true)
                local bJ9 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 999.14, -1123.15, 29.1, true, true, true)
                local bJ10 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 186.14, -1064.15, 29.1, true, true, true)	
                local bJ13 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 740.14, -1016.15, 29.1, true, true, true)
                local bJ14 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 739.14, -1003.15, 26.1, true, true, true)		
                local bJ15 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 768.14, -1044.15, 27.1, true, true, true)	
                local bJ16 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 188, -956, 27.1, true, true, true)
                local bJ17 = CreateObject(GetHashKey('stt_prop_race_start_line_03b'), 102.14, -936.15, 29.1, true, true, true)
				                local bH1 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 37.29, -929, 29, true, true, true)				
                local b3H = CreateObject(GetHashKey('stt_prop_track_straight_l'), 37.29, -946, 29, true, true, true)
                local b4I = CreateObject(GetHashKey('stt_prop_track_straight_l'), 5.37, -957, 29, true, true, true)
                local b5J = CreateObject(GetHashKey('stt_prop_track_straight_l'), 129.14, -916, 26.1, true, true, true)	
                local b1J2 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 28.14, -929, 29.1, true, true, true)
                local b6J3 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 46.14, -1116, 29.1, true, true, true)
                local b8J4 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 46.89, -1115, 29.1, true, true, true)
                local b7J5 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 111.14, -981, 29.1, true, true, true)
                local b9J6 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 200.14, -1112.15, 29.1, true, true, true)
				 local b0J7 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 215.14, -1112.15, 29.1, true, true, true)
                local b00J8 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 305.14, -1119, 29.1, true, true, true)
                local b000J9 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 999.14, -1123.15, 29.1, true, true, true)
                local b12J10 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 186.14, -1064.15, 29.1, true, true, true)	
                local b13J13 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 740.14, -1016.15, 29.1, true, true, true)
                local b14J14 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 739.14, -1003.15, 26.1, true, true, true)		
                local b15J15 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 768.14, -1044.15, 27.1, true, true, true)	
                local bJ616 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 188, -956, 27.1, true, true, true)
                local bJ317 = CreateObject(GetHashKey('stt_prop_track_straight_l'), 102.14, -936.15, 29.1, true, true, true)
                 av('~h~~b~You did them dirty :O~s~.', false)	
                elseif VladmirAK47.Button('~h~Freeze Everyone ') then
				                 runOnAll(Freezeall2)							 
                elseif VladmirAK47.Button('~h~Zomibe Everyone ') then
				                 runOnAll(Zombie)
                elseif VladmirAK47.Button('~h~Silent Kill Everyone ') then
				                 runOnAll(Silentkill)
                elseif VladmirAK47.Button('~h~1M veh on all ') then
				                 runOnAll(Zombie99)								 
                elseif VladmirAK47.Button('~h~Lag all ') then
                if not TEST30 then
                 TEST30 = true
                        av('~h~~b~ Dirty Bitch u r~.', false)
                else
                 TEST30 = false
                        av('~h~~b~ Off.', false)
                end									 
                elseif VladmirAK47.Button('~h~BurnV2 Everyone ') then
				                 runOnAll(BurnV2)
                elseif VladmirAK47.Button('~h~Burn Everyone ') then
				                 runOnAll(BurnV1)							 
                elseif VladmirAK47.Button('~h~Fail Peds ') then
				                 runOnAll(Failall)								 
                elseif VladmirAK47.Button('~h~Smoke Everyone ') then
				                 runOnAll(Smoking)								 
                elseif VladmirAK47.Button('~h~Launch Everyone ') then
				                 runOnAll(Launch)
                elseif VladmirAK47.Button('~h~Explode all ') then
				                 runOnAll(Launch1)
                elseif VladmirAK47.Button('~h~Light all ') then
				                 runOnAll(Light1)									 
                elseif VladmirAK47.Button('~h~Try to teleport vehicles to place') then
				                 runOnAll(TeleportToMe)								 			 
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('MiscMenu') then
                if VladmirAK47.MenuButton('~h~~r~▶~s~ Crosshairs', 'CsMenu') then
				elseif
                    VladmirAK47.CheckBox(
                        '~h~Player Blips',
                        yx,
                        function(yx)
                        end
                    )
                 then
                    cL = not cL
                    yx = cL					
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Aimbot',
                        TriggerBot,
                        function(dR)
                            TriggerBot = dR
                        end
                    )
                 then			 
                elseif
                    VladmirAK47.CheckBox(
                        '~h~ESP Name',
                        cN,
                        function(dR)
                            cN = dR
                            cM = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~ESP Lines',
                        esp,
                        function(dR)
                            esp = dR
                        end
                    )
                 then			 
				elseif VladmirAK47.Button('~h~Set Weather Clear') then
					 SetWeatherTypePersist("CLEAR")
                     SetWeatherTypeNowPersist("CLEAR")
                     SetWeatherTypeNow("CLEAR")
                     SetOverrideWeather("CLEAR")
				elseif VladmirAK47.Button('~h~Set Weather EXTRASUNNY') then
					 SetWeatherTypePersist("EXTRASUNNY")
                     SetWeatherTypeNowPersist("EXTRASUNNY")
                     SetWeatherTypeNow("EXTRASUNNY")
                     SetOverrideWeather("EXTRASUNNY")
				elseif VladmirAK47.Button('~h~Set Weather FOGGY') then
					 SetWeatherTypePersist("FOGGY")
                     SetWeatherTypeNowPersist("FOGGY")
                     SetWeatherTypeNow("FOGGY")
                     SetOverrideWeather("FOGGY")
				elseif VladmirAK47.Button('~h~Set Weather BLIZZARD') then
					 SetWeatherTypePersist("BLIZZARD")
                     SetWeatherTypeNowPersist("BLIZZARD")
                     SetWeatherTypeNow("BLIZZARD")
                     SetOverrideWeather("BLIZZARD")					 
                end					 
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('CsMenu') then
                if
                    VladmirAK47.CheckBox(
                        '~h~Original Crosshair',
                        crosshair,
                        function(dR)
                            crosshair = dR
                            crosshairc = false
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~CROSS Crosshair',
                        crosshairc,
                        function(dR)
                            crosshair = false
                            crosshairc = dR
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~DOT ~Crosshair',
                        crosshairc2,
                        function(dR)
                            crosshair = false
                            crosshairc = false
                            crosshairc2 = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Vladmir1997') then
                if VladmirAK47.Button('~h~~p~▶~s~ This menu created by VladmirAK47 ~r~ For Crown') then
                    av('~h~~o~WoW~s~.', false)	
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('WeaponTypes') then
                for e0, ev in pairs(b7) do
                    if VladmirAK47.MenuButton('~h~~p~▶~s~ ' .. e0, 'WeaponTypeSelection') then
                        dy = ev
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('WeaponTypeSelection') then
                for e0, ev in pairs(dy) do
                    if VladmirAK47.MenuButton(ev.name, 'WeaponOptions') then
                        dz = ev
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('WeaponOptions') then
                if VladmirAK47.Button('~h~Spawn Weapon') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dz.id), 1000, false)
                end
                if VladmirAK47.Button('~h~Add Ammo') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(dz.id), 5000)
                end
                if
                    VladmirAK47.CheckBox(
                        '~h~Infinite ~s~Ammo',
                        dz.bInfAmmo,
                        function(ew)
                        end
                    )
                 then
                    dz.bInfAmmo = not dz.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), dz.bInfAmmo, GetHashKey(dz.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                    PedSkipNextReloading(GetPlayerPed(-1))
                    SetPedShootRate(GetPlayerPed(-1), 1000)
                end
                for e0, ev in pairs(dz.mods) do
                    if VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~~p~▶ ~s~' .. e0, 'ModSelect') then
                        dA = ev
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('ModSelect') then
                for _, ev in pairs(dA) do
                    if VladmirAK47.Button(ev.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id))
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if VladmirAK47.MenuButton('~h~~p~▶~s~ ' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~~p~▶~s~ ' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('CarOptions') then
                if VladmirAK47.Button('~h~Spawn Car') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 1, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
							SetPedIntoVehicle(PlayerPedId(-1), SpawnedCar, -1)
                        end
                    )
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    for i, ex in ipairs(b5) do
                        if VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~~p~▶~s~ ' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', true)
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('MainTrailerSpa') then
                if VladmirAK47.Button('~h~Spawn Car') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b5[TrailerToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            local SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            local ez = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('GWP') then
                for i = 1, #b6 do
                    if VladmirAK47.Button(b6[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, true)
                    end
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('MVE') then 
                if VladmirAK47.Button('~h~MiniGun Pro') then
                      --EquipSkateboard()
					  StartSkating1()
					  av('~h~~b~Press "HOME" for effect, to stop press E', false) 					  
                  		Noclip1 = true			  
                end				
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('Minigun Pro') then
                local veh = GetVehiclePedIsUsing(PlayerPedId())
                if VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~Exterior ~s~Tuning', 'tunings') then
                elseif VladmirAK47.MenuButton('~h~~p~▶~s~ ~h~Performance ~s~Tuning', 'performance') then
                elseif VladmirAK47.Button('~h~Change Car License Plate') then
                    cu()
                elseif
                    VladmirAK47.CheckBox(
                        '~h~~gr~a~y~i~b~n~o~bow ~s~Vehicle Colour',
                        RainbowVeh,
                        function(dR)
                            RainbowVeh = dR
                        end
                    )
                 then
                elseif VladmirAK47.Button('~h~Make vehicle ~y~dirty') then
                    Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif VladmirAK47.Button('~h~Make vehicle clean') then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    VladmirAK47.CheckBox(
                        '~h~~gr~a~y~i~b~n~o~bow ~s~Neons & Headlights',
                        rainbowh,
                        function(dR)
                            rainbowh = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif VladmirAK47.IsMenuOpened('BoostMenu') then
                if
                    VladmirAK47.ComboBox(
                        '~h~Engine Power Booster',
                        dD,
                        dB,
                        dC,
                        function(ag, ah)
                            dB = ag
                            dC = ah
                            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), dC * 20.0)
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine  Booster 2x',
                        t2x,
                        function(dR)
                            t2x = dR
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine  Booster 4x',
                        t4x,
                        function(dR)
                            t2x = false
                            t4x = dR
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine Booster 10x',
                        t10x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = dR
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine Booster 16x',
                        t16x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = dR
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine Booster 20x',
                        txd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = dR
                            tbxd = false
                        end
                    )
                 then
                elseif
                    VladmirAK47.CheckBox(
                        '~h~Engine Booster 24x',
                        tbxd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = dR
                        end
                    )
                 then
                end
                VladmirAK47.Display()
            elseif IsDisabledControlPressed(0, 19) and IsDisabledControlPressed(0, 48) then
                if H4tuf5 then
                    VladmirAK47.OpenMenu('VladmirAK47')
                else
                    TmEM1U()
                end
                VladmirAK47.Display()
            end
            Citizen.Wait(0)
        end
    end
)