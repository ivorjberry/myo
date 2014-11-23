--Halo arm band
scriptId = 'com.thalmic.halocontrol'

function onPoseEdge(pose, edge)
	if pose == "fist" then
		if edge == "on" then shoot() else endshoot() end
	elseif	pose == "fingersSpread" then grenade()
	elseif pose == "waveOut" then reload()
	elseif pose == "waveIn" then switchWeapon()	
	else
		myo.debug("unused gesture")
	end		
end

function onPeriodic()
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    return true
end

function activeAppName()
    return "Halo Control"
end

function onActiveChange(isActive)
    myo.debug("Active change, controlling mouse")
	myo.controlMouse(true)
end

--Helpers
function shoot()
	--fire weapon
	myo.mouse("left", "down")
	myo.vibrate("medium")
end

function endshoot()
	--necessary for fully auto
	myo.mouse("left", "up")
end

function grenade()
	--throw grenade
	myo.mouse("right", "click")
end

function reload()
	myo.keyboard("r", "press")
end

function switchWeapon()
	myo.keyboard("tab", "press")
end
