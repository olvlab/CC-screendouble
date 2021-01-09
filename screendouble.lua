-- made by olv

local arg = {...}

local monitor = peripheral.wrap(arg[1])
monitor.clear()
monitor.setTextScale(0.5)
monitor.setCursorPos(1, 1)

local oldwrite = term.write
term.write = function(sText)
 monitor.write(sText)
 return oldwrite(sText)
end

local oldblit = term.blit
term.blit = function(sText, bg, fg)
 monitor.blit(sText, bg, fg)
 return oldblit(sText, bg, fg)
end

local oldclear = term.clear
term.clear = function()
 monitor.clear()
 return oldclear()
end

local oldcpos = term.setCursorPos
term.setCursorPos = function(x, y)
 monitor.setCursorPos(x, y)
 return oldcpos(x, y)
end

local oldsbg = term.setBackgroundColor
term.setBackgroundColor = function(color)
 monitor.setBackgroundColor(color)
 return oldsbg(color)
end

local oldsfg = term.setTextColor
term.setTextColor = function(color)
 monitor.setTextColor(color)
 return oldsfg(color)
end

local oldscroll = term.scroll
term.scroll = function(n)
 monitor.scroll(n)
 return oldscroll(n)
end

local oldshutdown = os.shutdown
os.shutdown = function()
 monitor.clear()
 oldshutdown()
end

local oldreboot = os.reboot
os.reboot = function()
 monitor.clear()
 oldreboot()
end

print("Function overwrite complete. Reboot to disable.")
