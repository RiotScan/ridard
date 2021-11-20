	local mo = "A.M."
	local mont = nil
	while wait() do
		local l = math.fmod(tick(),86400)
		local h = math.floor(l/3600)
		local m = math.floor(l/60-h*60)
		local s = math.floor(math.fmod(l,60))
		local y = math.floor(1970+tick()/31579200)
		local mon = {{"January",31,31},{"February",59,28},{"March",90,31},{"April",120,30},{"May",151,31},{"June",181,30},{"July",212,31},{"August",243,31},{"September",273,30},{"October",304,31},{"November",334,30},{"December",365,31}}
		if y%4 == 0 then
			mon[2][3] = 29
			for i,v in pairs(mon) do
				if i ~= 1 then
					v[2] = v[2] + 1
				end
			end
		end
		local d = math.floor(tick()/86400%365.25+1)
		for i,v in pairs(mon) do
			if v[2]-v[3]<=d then
				mont = i
			end
		end
		d = d + mon[mont][3]-mon[mont][2]
		if m <= 9 then
			m = "0" ..m
		end
		if s <= 9 then
			s = "0" ..s
		end
		if h >= 12 then
			mo = "P.M."
		else
			mo = "A.M."
		end
		if h > 12 then
			h = h - 12
		end
		watermark:CreateWatermark("Ova.Solutions |" ..user.. "|" ..h.. ":" ..m.. ":" ..s..)
	end
end
