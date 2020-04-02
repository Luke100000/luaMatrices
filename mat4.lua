local mat
local metatable

mat = {
	__call = function(self, x, y, z, w, x1, y1, z1, w1, x2, y2, z2, w2, x3, y3, z3, w3)
		if not x then
			return setmetatable({0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, metatable)
		elseif type(x) == "table" then
			return setmetatable(x, metatable)
		elseif type(x) == "number" then
			return setmetatable({x, y, z, w, x1, y1, z1, w1, x2, y2, z2, w2, x3, y3, z3, w3}, metatable)
		else
			error("can not construct matrix")
		end
	end,
	
	getIdentity = function()
		return mat({
			1, 0, 0, 0,
			0, 1, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1
		})
	end,
}

metatable = {
	__add = function(a, b)
		if type(a) == "number" then
			return mat({
				a + b[1],
				a + b[2],
				a + b[3],
				a + b[4],
				a + b[5],
				a + b[6],
				a + b[7],
				a + b[8],
				a + b[9],
				a + b[10],
				a + b[11],
				a + b[12],
				a + b[13],
				a + b[14],
				a + b[15],
				a + b[16],
			})
		elseif type(b) == "number" then
			return mat({
				a[1] + b,
				a[2] + b,
				a[3] + b,
				a[4] + b,
				a[5] + b,
				a[6] + b,
				a[7] + b,
				a[8] + b,
				a[9] + b,
				a[10] + b,
				a[11] + b,
				a[12] + b,
				a[13] + b,
				a[14] + b,
				a[15] + b,
				a[16] + b,
			})
		else
			return mat({
				a[1] + b[1],
				a[2] + b[2],
				a[3] + b[3],
				a[4] + b[4],
				a[5] + b[5],
				a[6] + b[6],
				a[7] + b[7],
				a[8] + b[8],
				a[9] + b[9],
				a[10] + b[10],
				a[11] + b[11],
				a[12] + b[12],
				a[13] + b[13],
				a[14] + b[14],
				a[15] + b[15],
				a[16] + b[16],
			})
		end
	end,
	
	__sub = function(a, b)
		if type(a) == "number" then
			return mat({
				a - b[1],
				a - b[2],
				a - b[3],
				a - b[4],
				a - b[5],
				a - b[6],
				a - b[7],
				a - b[8],
				a - b[9],
				a - b[10],
				a - b[11],
				a - b[12],
				a - b[13],
				a - b[14],
				a - b[15],
				a - b[16],
			})
		elseif type(b) == "number" then
			return mat({
				a[1] - b,
				a[2] - b,
				a[3] - b,
				a[4] - b,
				a[5] - b,
				a[6] - b,
				a[7] - b,
				a[8] - b,
				a[9] - b,
				a[10] - b,
				a[11] - b,
				a[12] - b,
				a[13] - b,
				a[14] - b,
				a[15] - b,
				a[16] - b,
			})
		else
			return mat({
				a[1] - b[1],
				a[2] - b[2],
				a[3] - b[3],
				a[4] - b[4],
				a[5] - b[5],
				a[6] - b[6],
				a[7] - b[7],
				a[8] - b[8],
				a[9] - b[9],
				a[10] - b[10],
				a[11] - b[11],
				a[12] - b[12],
				a[13] - b[13],
				a[14] - b[14],
				a[15] - b[15],
				a[16] - b[16],
			})
		end
	end,
	
	__mul = function(a, b)
		if type(a) == "number" then
			return mat({
				a * b[1],
				a * b[2],
				a * b[3],
				a * b[4],
				a * b[5],
				a * b[6],
				a * b[7],
				a * b[8],
				a * b[9],
				a * b[10],
				a * b[11],
				a * b[12],
				a * b[13],
				a * b[14],
				a * b[15],
				a * b[16],
			})
		elseif type(b) == "number" then
			return mat({
				a[1] * b,
				a[2] * b,
				a[3] * b,
				a[4] * b,
				a[5] * b,
				a[6] * b,
				a[7] * b,
				a[8] * b,
				a[9] * b,
				a[10] * b,
				a[11] * b,
				a[12] * b,
				a[13] * b,
				a[14] * b,
				a[15] * b,
				a[16] * b,
			})
		else
			return mat({
				a[1] * b[1] + a[2] * b[5] + a[3] * b[9] + a[4] * b[13],
				a[1] * b[2] + a[2] * b[6] + a[3] * b[10] + a[4] * b[14],
				a[1] * b[3] + a[2] * b[7] + a[3] * b[11] + a[4] * b[15],
				a[1] * b[4] + a[2] * b[8] + a[3] * b[12] + a[4] * b[16],
				a[5] * b[1] + a[6] * b[5] + a[7] * b[9] + a[8] * b[13],
				a[5] * b[2] + a[6] * b[6] + a[7] * b[10] + a[8] * b[14],
				a[5] * b[3] + a[6] * b[7] + a[7] * b[11] + a[8] * b[15],
				a[5] * b[4] + a[6] * b[8] + a[7] * b[12] + a[8] * b[16],
				a[9] * b[1] + a[10] * b[5] + a[11] * b[9] + a[12] * b[13],
				a[9] * b[2] + a[10] * b[6] + a[11] * b[10] + a[12] * b[14],
				a[9] * b[3] + a[10] * b[7] + a[11] * b[11] + a[12] * b[15],
				a[9] * b[4] + a[10] * b[8] + a[11] * b[12] + a[12] * b[16],
				a[13] * b[1] + a[14] * b[5] + a[15] * b[9] + a[16] * b[13],
				a[13] * b[2] + a[14] * b[6] + a[15] * b[10] + a[16] * b[14],
				a[13] * b[3] + a[14] * b[7] + a[15] * b[11] + a[16] * b[15],
				a[13] * b[4] + a[14] * b[8] + a[15] * b[12] + a[16] * b[16],
			})
		end
	end,
	
	__div = function(a, b)
		if type(a) == "number" then
			return mat({
				a / b[1],
				a / b[2],
				a / b[3],
				a / b[4],
				a / b[5],
				a / b[6],
				a / b[7],
				a / b[8],
				a / b[9],
				a / b[10],
				a / b[11],
				a / b[12],
				a / b[13],
				a / b[14],
				a / b[15],
				a / b[16],
			})
		elseif type(b) == "number" then
			return mat({
				a[1] / b,
				a[2] / b,
				a[3] / b,
				a[4] / b,
				a[5] / b,
				a[6] / b,
				a[7] / b,
				a[8] / b,
				a[9] / b,
				a[10] / b,
				a[11] / b,
				a[12] / b,
				a[13] / b,
				a[14] / b,
				a[15] / b,
				a[16] / b,
			})
		else
			error("you can not divide two matrices!")
		end
	end,
	
	__mod = function(a, b)
		error("not supported")
	end,
	
	__unm = function(a)
		return mat({
			-a[1],	-a[2],	-a[3],	-a[4],
			-a[5],	-a[6],	-a[7],	-a[8],
			-a[9],	-a[10],	-a[11],	-a[12],
			-a[13],	-a[14],	-a[15],	-a[16],
		})
	end,
	
	__pow = function(a, b)
		if type(a) == "number" then
			error("not supported")
		elseif type(b) == "number" then
			assert(math.floor(b) == b and b > 0, "only positive integer power supported")
			local t = a * a
			for i = 3, b do
				t = t * a
			end
			return t
		elseif b == "T" then
			return a:transpose()
		else
			error("not supported")
		end
	end,
	
	__eq = function(a, b)
		return a[1] == b[1] and a[2] == b[2] and a[3] == b[3] and a[4] == b[4]
			and a[5] == b[5] and a[6] == b[6] and a[7] == b[7] and a[8] == b[8]
			and a[9] == b[9] and a[10] == b[10] and a[11] == b[11] and a[12] == b[12]
			and a[13] == b[13] and a[14] == b[14] and a[15] == b[15] and a[16] == b[16]
	end,
	
	__len = function()
		return 4
	end,
	
	__tostring = function(a)
		return string.format("%s\t%s\t%s\t%s\n%s\t%s\t%s\t%s\n%s\t%s\t%s\t%s\n%s\t%s\t%s\t%s",
			a[1],	a[2],	a[3],	a[4],
			a[5],	a[6],	a[7],	a[8],
			a[9],	a[10],	a[11],	a[12],
			a[13],	a[14],	a[15],	a[16]
		)
	end,
	
	__index = function(self, key)
		return rawget(metatable, key)
	end,
	
	get = function(a, x, y)
		return a[(y-1)*4 + x]
	end,
	
	set = function(a, x, y, v)
		a[(y-1)*4 + x] = v
	end,
	
	clone = function(a)
		return mat({
			a[1],	a[2],	a[3],	a[4],
			a[5],	a[6],	a[7],	a[8],
			a[9],	a[10],	a[11],	a[12],
			a[13],	a[14],	a[15],	a[16],
		})
	end,
	
	unpack = function(a)
		return {
			{a[1],	a[2],	a[3],	a[4]},
			{a[5],	a[6],	a[7],	a[8]},
			{a[9],	a[10],	a[11],	a[12]},
			{a[13],	a[14],	a[15],	a[16]},
		}
	end,
	
	--todo: det is too branched-recursive and wont be optimized by the JIT compiler, causing det and therefore inverse to be incredible slow.
	det = function(a)
		return a[1] * mat3({a[6], a[7], a[8], a[10], a[11], a[12], a[14], a[15], a[16]}):det()
			- a[2] * mat3({a[5], a[7], a[8], a[9], a[11], a[12], a[13], a[15], a[16]}):det()
			+ a[3] * mat3({a[5], a[6], a[8], a[9], a[10], a[12], a[13], a[14], a[16]}):det()
			- a[4] * mat3({a[5], a[6], a[7], a[9], a[10], a[11], a[13], a[14], a[15]}):det()
	end,
	
	subm = function(a, size, offsetX, offsetY)
		if size == 3 then
			return mat3({
				a[1+offsetX + offsetY*4], a[2+offsetX + offsetY*4], a[3+offsetX + offsetY*4],
				a[5+offsetX + offsetY*4], a[6+offsetX + offsetY*4], a[7+offsetX + offsetY*4],
				a[9+offsetX + offsetY*4], a[10+offsetX + offsetY*4], a[11+offsetX + offsetY*4],
			})
		elseif size == 2 then
			return mat2({
				a[1+offsetX + offsetY*4], a[2+offsetX + offsetY*4],
				a[5+offsetX + offsetY*4], a[6+offsetX + offsetY*4],
			})
		end
	end,
	
	transpose = function(a)
		return mat({
			a[1],	a[5],	a[9],	a[13],
			a[2],	a[6],	a[10],	a[14],
			a[3],	a[6],	a[11],	a[15],
			a[4],	a[8],	a[12],	a[16],
		})
	end,
	
	trace = function(a)
		return a[1] + a[6] + a[11] + a[16]
	end,
	
	invert = function(a)
		local a2 = a^2
		local a3 = a^3
		local t = a:trace()
		local t2 = a2:trace()
		local t3 = a3:trace()
		local d = a:det()
		
		return (mat:getIdentity() / 6 * (t^3 - 3*t*t2 + 2*t3) - a * 0.5 * (t^2 - t2) + a2 * t - a3) / d
	end,
}

return setmetatable(mat, mat)