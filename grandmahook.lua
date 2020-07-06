surface.CreateFont("MenuFont", {
    
    name = "DermaDefault",
    size = 32,
    
})

surface.CreateFont("ESPFont", {
    
    name = "DermaDefault",
    size = 15,
    antialias = true,
    
})

CreateClientConVar("GrandmaHook_Enable", 1, true, false)
CreateClientConVar("GrandmaHook_Crosshair", 1, true, false)
CreateClientConVar("GrandmaHook_Watermark", 1, true, false)
CreateClientConVar("GrandmaHook_NameESP", 1, true, false)
CreateClientConVar("GrandmaHook_BoxESP", 1, true, false)
CreateClientConVar("GrandmaHook_HealthESP", 1, true, false)
CreateClientConVar("GrandmaHook_ArmorESP", 1, true, false)
CreateClientConVar("GrandmaHook_Usergroup", 1, true, false)
CreateClientConVar("GrandmaHook_Aimbot", 1, true, false)
CreateClientConVar("GrandmaHook_AimbotSpeed", 50, true, false)
CreateClientConVar("GrandmaHook", 1, true, false)
CreateClientConVar("GrandmaHook_ShowEyeLine", 1, true, false)
CreateClientConVar("GrandmaHook_PlayerLight", 1, true, false)
CreateClientConVar("GrandmaHook_GlowESP", 1, true, false)
CreateClientConVar("GrandmaHook_VisualTab", 0, true, false)
CreateClientConVar("GrandmaHook_EntityESP", 0, true, false)
CreateClientConVar("GrandmaHook_antigrab", 1, true, false)
CreateClientConVar("GrandmaHook_bhop", 1, true, false)
CreateClientConVar("GrandmaHook_bhop_strafe", 1, true, false)
CreateClientConVar("GrandmaHook_anitgrab", 1, true, false)

surface.PlaySound("common/stuck1.wav")

print("GrandmaHook Initalized On " .. util.DateStamp())

local function coordinates( ent )
    local min, max = ent:OBBMins(), ent:OBBMaxs()
    local corners = {
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, max.y, max.z )
    }
end

function DrawRainbowText( frequency, str, font, x, y )
    
    surface.SetFont( font )
    
    for i = 1, #str do
        surface.SetTextColor( HSVToColor( i * frequency % 360, 1, 1 ) )
        local w = surface.GetTextSize( string.sub( str, 1, i - 1 ) )
        surface.SetTextPos( x + w, y )
        surface.DrawText( string.sub( str, i, i ) )
    end
    
end

function OpenMenu()
    
    local Menu = vgui.Create("DFrame")
    
    surface.PlaySound("gman/gman_choose1.wav")
    
    if (IsValid(Menu) == false) then
        
        Menu:Remove()
        
    end
    
    Menu:SetPos(ScrW() / 2.9, ScrH() / 8)
    Menu:MakePopup(true)
    Menu:SetTitle("GrandmaHook   |   Best Cheat Ever Created    |  " .. util.DateStamp() .. "     |   Version BETA")
    Menu:SizeTo(ScrW() / 3, ScrH() / 3, .3, .1, 1)
    
    Menu.Paint = function(me,w,h)
        
        surface.SetDrawColor(44, 44, 44, 255)
        surface.DrawRect(0,0,w,h)     
        
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(ScrW() / 500, ScrH() / 35, ScrW() / 15, ScrH() / 1)  
        
        draw.DrawText("Welcome " .. LocalPlayer():Nick(), "MenuFont", ScrW() / 6.5, ScrH() / 7.5, Color(255,255,255,255), TEXT_ALIGN_LEFT , TEXT_ALIGN_RIGHT)
        
    end
    
    
    
    local ragebutton =  Menu:Add("DButton")
    local barStat = 0
    local isActive = false
    ragebutton:SetText("")
    ragebutton:SetSize(ScrW() / 15, ScrH() / 15)
    ragebutton:SetPos(ScrW() / 500, ScrH() / 25)
    
    ragebutton.Paint = function(me, w,h)
        
        if me:IsHovered() then
            barStat = math.Clamp(barStat + 2 * FrameTime(), 0, 300)
        else
            barStat = math.Clamp(barStat - 2 * FrameTime(), 0, 300)
        end 
        
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0,w * barStat,h)
        surface.SetDrawColor(50, 50, 255, 255)
        surface.DrawRect(0,0,w * barStat,h)
        draw.SimpleText("Rage", "MenuFont", ScrW() / 110, ScrH() / 70, Color(255,255,255,255), TEXT_ALIGN_LEFT)
        
    end
    
    ragebutton.DoClick = function()
        
        surface.PlaySound("common/wpn_select.wav")
        
        local ragetab = Menu:Add("DPanel")
        ragetab:SetText("")
        ragetab:SetSize(ScrW() / 2, ScrH() / 2)
        ragetab:SetPos(ScrW() / 15, ScrH() / 35)
        ragetab.Paint = function(me, w,h)
            
            surface.SetDrawColor(44, 44, 44, 255)
            surface.DrawRect(0,0, w - 100,h - 100)
            
        end
        
        
        
    end
    
    local legitbutton =  Menu:Add("DButton")
    local barStat = 0
    local isActive = false
    legitbutton:SetText("")
    legitbutton:SetSize(ScrW() / 15, ScrH() / 15)
    legitbutton:SetPos(ScrW() / 500, ScrH() / 9)
    legitbutton.Paint = function(me, w,h)
        
        if me:IsHovered() then
            barStat = math.Clamp(barStat + 2 * FrameTime(), 0, 1)
        else
            barStat = math.Clamp(barStat - 2 * FrameTime(), 0, 1)
        end 
        
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0, w * barStat,h)
        surface.SetDrawColor(50, 50, 255, 255)
        surface.DrawRect(0,0, w * barStat,h)
        draw.SimpleText("Legit", "MenuFont", ScrW() / 110, ScrH() / 60, Color(255,255,255,255), TEXT_ALIGN_LEFT)
        
        legitbutton.DoClick = function()
            
            surface.PlaySound("common/wpn_select.wav")
            
            local legitab = Menu:Add("DPanel")
            legitab:SetText("")
            legitab:SetSize(ScrW() / 2, ScrH() / 2)
            legitab:SetPos(ScrW() / 15, ScrH() / 35)
            legitab.Paint = function(me, w,h)
                
                surface.SetDrawColor(44, 44, 44, 255)
                surface.DrawRect(0,0, w - 100,h - 100)
                
            end
            
        end
        
    end
    
    legitbutton.DoClick = function()
        
        surface.PlaySound("common/wpn_select.wav")
        print("Test")
        
    end
    
    local visualbutton =  Menu:Add("DButton")
    local barStat = 0
    local isActive = false
    visualbutton:SetText("")
    visualbutton:SetSize(ScrW() / 15, ScrH() / 15)
    visualbutton:SetPos(ScrW() / 500, ScrH() / 5.5)
    visualbutton.Paint = function(me, w,h)
        
        if me:IsHovered() then
            barStat = math.Clamp(barStat + 2 * FrameTime(), 0, 1)
        else
            barStat = math.Clamp(barStat - 2 * FrameTime(), 0, 1)
        end 
        
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0, w * barStat,h)
        surface.SetDrawColor(50, 50, 255, 255)
        surface.DrawRect(0,0, w * barStat,h)
        draw.SimpleText("Visuals", "MenuFont", ScrW() / 200, ScrH() / 40, Color(255,255,255,255), TEXT_ALIGN_LEFT)
        
    end
    
    visualbutton.DoClick = function() 
        
        surface.PlaySound("common/wpn_select.wav")
        
        local visualtab = Menu:Add("DPanel")
        visualtab:SetText("")
        visualtab:SetSize(ScrW() / 2, ScrH() / 2)
        visualtab:SetPos(ScrW() / 15, ScrH() / 35)
        visualtab.Paint = function(me, w,h)
            
            surface.SetDrawColor(44, 44, 44, 255)
            surface.DrawRect(0,0, w - 100,h - 100)
            
        end
        
        local CrosshairCheck = visualtab:Add("DCheckBoxLabel")
        CrosshairCheck:SetPos(25,ScrH() / 28)
        CrosshairCheck:SetText("Crosshair")
        CrosshairCheck:SetConVar("GrandmaHook_Crosshair")
        
        local WaterMarkCheck = visualtab:Add("DCheckBoxLabel")
        WaterMarkCheck:SetPos(150,ScrH() / 28)
        WaterMarkCheck:SetText("Watermark")
        WaterMarkCheck:SetConVar("GrandmaHook_Watermark")
        
        local NameESP = visualtab:Add("DCheckBoxLabel")
        NameESP:SetPos(275,ScrH() / 28)
        NameESP:SetText("Name ESP")
        NameESP:SetConVar("GrandmaHook_NameESP")
        
        local BoxESP = visualtab:Add("DCheckBoxLabel")
        BoxESP:SetPos(25,ScrH() / 12)
        BoxESP:SetText("Box ESP (Buggy)")
        BoxESP:SetConVar("GrandmaHook_BoxESP")
        
        local HealthESP = visualtab:Add("DCheckBoxLabel")
        HealthESP:SetPos(150,ScrH() / 12)
        HealthESP:SetText("Health ESP")
        HealthESP:SetConVar("GrandmaHook_HealthESP")
        
        local ArmorESP = visualtab:Add("DCheckBoxLabel")
        ArmorESP:SetPos(275,ScrH() / 12)
        ArmorESP:SetText("Armor ESP")
        ArmorESP:SetConVar("GrandmaHook_ArmorESP")
        
        local Usergroup = visualtab:Add("DCheckBoxLabel")
        Usergroup:SetPos(25,ScrH() / 7.5)
        Usergroup:SetText("Usergroup ESP")
        Usergroup:SetConVar("GrandmaHook_Usergroup")
        
        local LightChec = visualtab:Add("DCheckBoxLabel")
        LightChec:SetPos(150,ScrH() / 7.5)
        LightChec:SetText("PlayerLight(Broke)")
        LightChec:SetConVar("GrandmaHook_PlayerLight")
        
        local Glow = visualtab:Add("DCheckBoxLabel")
        Glow:SetPos(275,ScrH() / 7.5)
        Glow:SetText("Glow ESP")
        Glow:SetConVar("GrandmaHook_GlowESP")
        
    end
    
    local miscbutton =  Menu:Add("DButton")
    local barStat = 0
    local isActive = false
    miscbutton:SetText("")
    miscbutton:SetSize(ScrW() / 15, ScrH() / 15)
    miscbutton:SetPos(ScrW() / 500, ScrH() / 3.9)
    miscbutton.Paint = function(me, w,h)
        
        if me:IsHovered() then
            barStat = math.Clamp(barStat + 2 * FrameTime(), 0, 1)
        else
            barStat = math.Clamp(barStat - 2 * FrameTime(), 0, 1)
        end 
        
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0, w * barStat,h)
        surface.SetDrawColor(50, 50, 255, 255)
        surface.DrawRect(0,0, w * barStat,h)
        draw.SimpleText("Misc", "MenuFont", ScrW() / 110, ScrH() / 45, Color(255,255,255,255), TEXT_ALIGN_LEFT)
        
    end
    
    miscbutton.DoClick = function()
        
        surface.PlaySound("common/wpn_select.wav")
        
        local misctab = Menu:Add("DPanel")
        misctab:SetText("")
        misctab:SetSize(ScrW() / 2, ScrH() / 2)
        misctab:SetPos(ScrW() / 15, ScrH() / 35)
        misctab.Paint = function(me, w,h)
            
            surface.SetDrawColor(44, 44, 44, 255)
            surface.DrawRect(0,0, w - 100,h - 100)
            
        end
        
        local antiscreengrab = Menu:Add("DCheckBoxLabel")
        antiscreengrab:SetPos(150,ScrH() / 16)
        antiscreengrab:SetText("AntiScreen Grab")
        antiscreengrab:SetConVar("GrandmaHook_antigrab")
        
        local BHop = Menu:Add("DCheckBoxLabel")
        BHop:SetPos(285,ScrH() / 16)
        BHop:SetText("Bhop")
        BHop:SetConVar("GrandmaHook_bhop")
        
        local SBHop = Menu:Add("DCheckBoxLabel")
        SBHop:SetPos(370,ScrH() / 16)
        SBHop:SetText("SBhop")
        SBHop:SetConVar("GrandmaHook_bhop_strafe")
        
    end
    
end
concommand.Add("grandmahookmenu", OpenMenu)

hook.Add("HUDPaint", "Visuals", function() 
    
    if GetConVar("GrandmaHook_NameESP"):GetInt() == 1 then
        
        for k, v in pairs(player.GetAll()) do
            
            local pos = (v:GetShootPos() + Vector(0,15,30)):ToScreen()
            if (v ~= LocalPlayer() and (v:Alive())) then
                draw.SimpleTextOutlined(v:Nick(), "ESPFont", pos.x + 1, pos.y + 7, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
            end
        end
        
    end
    
    if GetConVar("GrandmaHook_GlowESP"):GetInt() == 1 then
        
        for k, v in pairs(player.GetAll()) do
            
            if(v:Alive()) then
                halo.Add( player.GetAll(), Color( 0, 255, 255 ), 1, 1, 15, true, true  )
            end
            
        end
        
    end
    
    if GetConVar("GrandmaHook_HealthESP"):GetInt() == 1 then
        
        for k, v in pairs(player.GetAll()) do
            
            local pos = (v:GetShootPos() + Vector(0,15,30)):ToScreen()
            if (v ~= LocalPlayer()) and (v:Alive()) then
                
                draw.SimpleTextOutlined("Health:" .. v:Health(), "ESPFont", pos.x + 1, pos.y + 20, Color(255,22,22,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
                
                
            end
        end
        
    end
    
    if GetConVar("GrandmaHook_ArmorESP"):GetInt() == 1 then
        
        for k, v in pairs(player.GetAll()) do
            
            local pos = (v:GetShootPos() + Vector(0,15,30)):ToScreen()
            
            if (v ~= LocalPlayer() and (v:Alive())) then
                draw.SimpleTextOutlined("Armor:" .. v:Armor(), "ESPFont", pos.x + 1 , pos.y + 33 , Color(22,22,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
            end
        end
        
    end
    
    if GetConVar("GrandmaHook_Usergroup"):GetInt() == 1 then
        
        for k, v in pairs(player.GetAll()) do
            
            local pos = (v:GetShootPos() + Vector(0,15,30)):ToScreen()
            if (v ~= LocalPlayer() and (v:Alive())) then
                if GetConVar("GrandmaHook_ArmorESP"):GetInt() == 1 then
                    draw.SimpleTextOutlined(v:GetUserGroup(), "ESPFont", pos.x + 1, pos.y + 45, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
                end
                
                if GetConVar("GrandmaHook_ArmorESP"):GetInt() == 0 then
                    draw.SimpleTextOutlined(v:GetUserGroup(), "ESPFont", pos.x + 1, pos.y + 30 , Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
                end
                
                
                
            end
        end
    end
    
    if GetConVar("GrandmaHook_EntityESP"):GetInt() == 1 then
        
        for k, v in pairs(ents.FindByClass("worldspawn")) do
            
            scripted_ents.Get("base_entity")
            
            local pos = (v:GetPos() + Vector(0,0,0)):ToScreen()
            
            local ents = ents.FindInCone(LocalPlayer():EyePos(), LocalPlayer():GetAimVector(), 0.000001,math.cos(math.rad(15)))
            
            draw.SimpleTextOutlined(ents, "ESPFont", pos.x + 1, pos.y + 60 , Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, Color(0,0,0,255))
            
            
        end
        
    end
    
    if GetConVar("GrandmaHook_Watermark"):GetInt() == 1 then
        
        surface.SetDrawColor(50, 50, 225, 255)
        surface.DrawRect(ScrW() / 32 - 3, ScrH() / 23.5 - 3, ScrW() / 5.7 + 6, ScrH() / 20 + 6)
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(ScrW() / 32, ScrH() / 23.5, ScrW() / 5.7 , ScrH() / 20)
        DrawRainbowText(18, "GrandmaHook By Grandma " .. util.DateStamp(), "DermaDefault", ScrW() / 17, ScrH() / 16.5)
        
    end
    
    if GetConVar("GrandmaHook_Crosshair"):GetInt() == 1 then
        
        
        surface.DrawCircle(ScrW() / 2, ScrH() / 2, ScrW() / 150, 255, 255, 255, 255)
        surface.DrawCircle(ScrW() / 2, ScrH() / 2, ScrW() / 650, 255, 255, 255, 255)
        surface.DrawCircle(ScrW() / 2, ScrH() / 2, ScrW() / 950, 255, 255, 255, 255)
        
    end
    
end)

function antiscreengrab()
    
    if GetConVar("GrandmaHook_antigrab"):GetInt() == 1 then
        
        local ss = false
        
        local renderv = render.RenderView
        local renderc = render.Clear
        local rendercap = render.Capture
        local vguiworldpanel = vgui.GetWorldPanel
        
        local function screengrab()
            if ss then return end
            ss = true
            
            renderc( 0, 0, 0, 255, true, true )
            renderv( {
                origin = LocalPlayer():EyePos(),
                angles = LocalPlayer():EyeAngles(),
                x = 0,
                y = 0,
                w = ScrW(),
                h = ScrH(),
                dopostprocess = true,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            } )
            
            local vguishits = vguiworldpanel()
            
            if IsValid( vguishits ) then
                vguishits:SetPaintedManually( true )
            end
            
            timer.Simple( 0.1, function()
                vguiworldpanel():SetPaintedManually( false )
                ss = false
            end)
        end
        
        render.Capture = function(data)
            screengrab()
            local cap = rendercap( data )
            return cap
        end
        
    end
    
end

local bhop = { }
bhop.MetaPlayer = FindMetaTable( "Player") 
bhop.oldKeyDown = bhop.MetaPlayer['KeyDown']
bhop.On = true
bhop.SOn = true
bhop.Hooks = { hook = { }, name = { } }
bhop.jump = false
function bhop.AddHook(hookname, name, func)
    table.insert( bhop.Hooks.hook, hookname )
    table.insert( bhop.Hooks.name, name )
    hook.Add( hookname, name, func ) --Hopefully you have something better
end
bhop.MetaPlayer['KeyDown'] = function( self, key )
    if self ~= LocalPlayer() then return end
    
    if (key == IN_MOVELEFT) and bhop.left then
        return true
    elseif (key == IN_MOVERIGHT) and bhop.right then
        return true
    elseif (key == IN_JUMP) and bhop.jump then
        return true
    else
        return bhop.oldKeyDown( self, key )
    end
end

local oldEyePos = LocalPlayer():EyeAngles()--This is to see where player is looking
function bhop.CreateMove( cmd )
    bhop.jump = false
    if (cmd:KeyDown( IN_JUMP )) then
        
        if (not bhop.jump) then
            if (bhop.On and not LocalPlayer():OnGround()) then --Bhop here
                cmd:RemoveKey( IN_JUMP )
            end
        else
            bhop.jump = false
        end
        
        if(bhop.SOn ) then--auto strafer
            local traceRes = LocalPlayer():EyeAngles()
            
            if( traceRes.y > oldEyePos.y ) then --If you move your mouse left, walk left, if you're jumping
                oldEyePos = traceRes
                cmd:SetSideMove( -1000000 )
                bhop.left = true
                bhop.right = false 
            elseif( oldEyePos.y > traceRes.y )  then --If you move your mouse right, move right,  while jumping
                oldEyePos = traceRes
                cmd:SetSideMove( 1000000 )
                bhop.right = true
                bhop.left = false
            end
        end
    elseif (not bhop.jump) then
        bhop.jump = true
    end		 
end

bhop.AddHook( "CreateMove", tostring(math.random(0, 133712837)), bhop.CreateMove )--add the hook

if GetConVar("GrandmaHook_bhop") then
    bhop.On = not bhop.On
end

if GetConVar("GrandmaHook_bhop_strafe") then
    bhop.SOn = not bhop.SOn
end

local function gethead(ent)
    if ent:LookupBone("ValveBiped.Bip01_Head1") then
        local pos = ent:GetBonePosition(ent:GetHitBoxBone(0, 0))
        return pos
    end
    return ent:LocalToWorld(ent:OBBCenter())
end

local function aimbot(ucmd)
    local myang = LocalPlayer():GetAngles()
    
    if input.IsMouseDown(MOUSE_LEFT) or LocalPlayer():KeyDown(262144) or aim == true then
        
        if GetConVar("GrandmaHook_Aimbot"):GetInt() == 1 then
            if LocalPlayer():GetActiveWeapon():GetClass() != "gmod_tool" and LocalPlayer():GetActiveWeapon():GetClass() != "gmod_camera" and LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" and LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physcannon" then
                local ply = LocalPlayer()
                local target = nil;
                
                for k, ent in next, player.GetAll() do
                    
                    local tr = util.TraceLine( {
                        start = LocalPlayer():EyePos(),
                        endpos = ent:EyePos(),
                        filter = {LocalPlayer(), ent}
                    } )
                    
                    if tr.HitPos == ent:EyePos() then
                        
                        if (!IsValid(ent) || ent:InVehicle() || ent == LocalPlayer() || !ent:Alive() || ent:IsNPC() || ent:Team() == TEAM_SPECTATOR) then
                            continue
                        end
                        
                        local ang = (ent:GetPos() - LocalPlayer():GetPos()):Angle()
                        local angdiffy = math.abs(math.NormalizeAngle(myang.y - ang.y ))
                        local angdiffp = math.abs(math.NormalizeAngle(myang.p - ang.p ))
                        
                        if (angdiffy < 6 and angdiffp < 6) then
                            target = ent	
                        end
                    end
                    if (target != nil) then
                        local angle = (gethead(target) - LocalPlayer():GetShootPos()):Angle()
                        angle.p = math.NormalizeAngle(angle.p)
                        angle.y = math.NormalizeAngle(angle.y)
                        local incr = GetConVar("GrandmaHook_Aimbot_Speed"):GetInt() / 100
                        ucmd:SetViewAngles(Lerp(incr, ucmd:GetViewAngles(), angle))
                    end
                end
            end
        end
    end
end


hook.Add("CreateMove", "bot", aimbot)
