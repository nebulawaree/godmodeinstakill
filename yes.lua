local KEYBIND = 'T';

if renderexploit then 
    pcall(task.cancel, renderexploit)
end;

local cloneref = cloneref or function(data: userdata) return data end;
local enchanttoggled  = false;
local getservice = function(service: string)
    return cloneref(game:FindService(service));
end;

local getrandomvalue = function(tab: table)
    return #tab > 0 and tab[math.random(1, #tab)] or ''
end;

local replicatedstorage = getservice('ReplicatedStorage');
local lplr = getservice('Players').LocalPlayer;
local inputservice = getservice('UserInputService');
local remote = replicatedstorage:WaitForChild('rbxts_include'):WaitForChild('node_modules'):WaitForChild('@rbxts'):WaitForChild('net'):WaitForChild('out'):WaitForChild('_NetManaged'):WaitForChild('RequestFortuneDoubleDown');
local effects = {
    'fire_3', 'forest_3', 'cloud_3', 'void_3', 'static_3', 'updraft_2', 
    'shield_gen_3', 'anti_knockback_2', 'rapid_regen_3', 'execute_3', 
    'wind_3', 'plunder_2', 'critical_strike_3', 'volley_3', 
    'grounded_3', 'clingy_3', 'life_steal_3', 'fortune_1'
}


renderexploit = task.spawn(function()
    repeat 
        task.wait()
        if not enchanttoggled then 
            continue
        end;
        for i,v in effects do 
            remote:FireServer({statusEffectType = v})
        end
        task.wait(0.8)
    until false;
end);

inputservice.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode[KEYBIND] and inputservice:GetFocusedTextBox() == nil then 
        enchanttoggled = not enchanttoggled;
        getservice('StarterGui'):SetCore('SendNotification', {
            Title = 'Render',
            Text = `Enchant Exploit status has been set to {tostring(enchanttoggled):upper()}!.`,
            Duration = 8,
        })
    end
end)

getservice('StarterGui'):SetCore('SendNotification', {
    Title = 'Render',
    Text = `Enchant Exploit loaded, press {KEYBIND} on your keyboard to toggle (credits to Dorblx for the method).`,
    Duration = 8,
})
