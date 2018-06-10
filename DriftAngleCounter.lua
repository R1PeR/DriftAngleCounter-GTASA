script_name('DriftAngleCounter')
script_author('R1per')
script_description('Drift angle counter for single player')
local mad = require 'MoonAdditions'
local angle = 0
local x1,y1,z1,x2,y2,z2 = 0.0
local x3,x4 = 0.0
local x,y,z
--- Main

function get_angle(x,y)
	local angle = math.deg(-math.atan2(x,y))
	if angle < 0 then
        angle = angle + 360;
	end
	return angle
end


function main()

	z = mad.textdraw.new('Test', 10, 80)
	z.style = mad.font_style.PRICEDOWN
	z.width = 0.5
	z.height = 0.5
	z.outline = 0
	z.shadow = 1
	z.background = false
	z.wrap = 1
	z:set_text_color(255, 255, 255, 255)
	z:set_shadow_color(30, 30, 30, 60)

	ang = mad.textdraw.new('Test', 10, 110)
	ang.style = mad.font_style.PRICEDOWN
	ang.width = 0.5
	ang.height = 0.5
	ang.outline = 0
	ang.shadow = 1
	ang.background = false
	ang.wrap = 1
	ang:set_text_color(255, 255, 255, 255)
	ang:set_shadow_color(30, 30, 30, 60)

	final = mad.textdraw.new('Test', 10, 140)
	final.style = mad.font_style.PRICEDOWN
	final.width = 0.5
	final.height = 0.5
	final.outline = 0
	final.shadow = 1
	final.background = false
	final.wrap = 1
	final:set_text_color(255, 255, 255, 255)
	final:set_shadow_color(30, 30, 30, 60)

		if isPlayerPlaying(playerHandle) then
			while true do
				wait(0)
				if isCharInAnyCar(playerPed) then
					carHandle = getCarCharIsUsing(playerPed)
					x1,y1,z1 = getCarSpeedVector(carHandle)
					x2,y2,z2 = getCarCoordinates(carHandle)
					z.text = getCarHeading(carHandle)
					printString("Angle is:" .. math.abs(math.floor(get_angle(x1,y1) - getCarHeading(carHandle), 200)))
					--memory.write(uint address, int value, uint size, [bool unprotect=false])
					--wheel_rf_dummy = get_vehicle_component(carHandle, "wheel_rf_dummy")
					--wheel_lf_dummy = get_vehicle_component(carHandle, "wheel_lf_dummy")
					--wheel_lf_dummy.setValue("sRotationZ", 60)
					--wheel_rf_dummy.setValue("sRotationZ", 60)
			end
		end
	end
end
