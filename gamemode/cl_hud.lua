print("cl_hud.lua LOADED")

local HideHud = {
    ["CHudHealth"] = true,
    ["CHudAmmo"] = true,
    ["CHudCrosshair"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudBattery"] = true,
}

local function HUDShouldDraw(name)
    if ( HideHud[name] ) then
        return false 
    end
end

hook.Add("HUDShouldDraw", "HUDShouldDraw", HUDShouldDraw)

function PaintHud() 
    local hp = LocalPlayer():Health() / 100
    draw.RoundedBox(1, 10, ScrH() - 50, 200, 40, Color (0, 0, 0, 200))
    draw.RoundedBox(1, 14, ScrH() - 46, 192 * hp, 32, Color (200, 0, 0, 200))

    draw.DrawText ( tostring(LocalPlayer():Health()), "Default", 105, ScrH() - 35, color_white, 0 )
end 

hook.Add("HUDPaint", "PaintHud", PaintHud)