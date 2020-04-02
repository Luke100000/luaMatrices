local mat
local metatable

mat = {
	__call = function(self, x, y, z, x1, y1, z1, x2, y2, z2)
		if not x then
			return setmetatable({0, 0, 0, 0, 0, 0, 0, 0, 0}, metatable)
		elseif type(x) == "table" then
			return setmetatable(x, metatable)
		elseif type(x) == "number" then
			return setmetatable({x, y, z, x1, y1, z1, x2, y2, z2}, metatable)
		else
			error("can not construct matrix")
		end
	end,
	
	getIdentity = function()
		return mat({
			1, 0, 0,
			0, 1, 0,
			0, 0, 1
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
			})
		else
			return mat({
				a[1] * b[1] + a[2] * b[4] + a[3] * b[7],
				a[1] * b[2] + a[2] * b[5] + a[3] * b[8],
				a[1] * b[3] + a[2] * b[6] + a[3] * b[9],
				a[4] * b[1] + a[5] * b[4] + a[6] * b[7],
				a[4] * b[2] + a[5] * b[5] + a[6] * b[8],
				a[4] * b[3] + a[5] * b[6] + a[6] * b[9],
				a[7] * b[1] + a[8] * b[4] + a[9] * b[7],
				a[7] * b[2] + a[8] * b[5] + a[9] * b[8],
				a[7] * b[3] + a[8] * b[6] + a[9] * b[9],
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
			-a[1],	-a[2],	-a[3]
			-a[4],	-a[5],	-a[6]
			-a[7],	-a[8],	-a[9],
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
		return a[1] == b[1] and a[2] == b[2] and a[3] == b[3]
			and a[4] == b[4] and a[5] == b[5] and a[6] == b[6]
			and a[7] == b[7] and a[8] == b[8] and a[9] == b[9]
	end,
	
	__len = function()
		return 3
	end,
	
	__tostring = function(a)
		return string.format("%s\t%s\t%s\n%s\t%s\t%s\n%s\t%s\t%s",
			a[1],	a[2],	a[3],
			a[4],	a[5],	a[6],
			a[7],	a[8],	a[9]
		)
	end,
	
	__index = function(self, key)
		return rawget(metatable, key)
	end,
	
	get = function(a, x, y)
		return a[(y-1)*3 + x]
	end,
	
	set = function(a, x, y, v)
		a[(y-1)*3 + x] = v
	end,
	
	clone = function(a)
		return mat({
			a[1],	a[2],	a[3],
			a[4],	a[5],	a[6],
			a[7],	a[8],	a[9]
		})
	end,
	
	unpack = function(a)
		return {
			{a[1],	a[2],	a[3]},
			{a[4],	a[5],	a[6]},
			{a[7],	a[8],	a[9]},
		}
	end,
	
	det = function(a)
		return a[1] * mat2(a[5], a[6], a[8], a[9]):det()
			- a[2] * mat2(a[4], a[6], a[7], a[9]):det()
			+ a[3] * mat2(a[4], a[5], a[7], a[8]):det()
	end,
	
	subm = function(a, offsetX, offsetY)
		return mat2({
			a[1+offsetX + offsetY*3], a[2+offsetX + offsetY*3],
			a[4+offsetX + offsetY*3], a[5+offsetX + offsetY*3],
		})
	end,
	
	transpose = function(a)
		return mat({
			a[1],	a[4],	a[7],
			a[2],	a[5],	a[8],
			a[3],	a[6],	a[9]
		})
	end,
	
	trace = function(a)
		return a[1] + a[5] + a[9]
	end,
	
	invert = function(a)
		local A = a[5] * a[9] - a[6] * a[8]
		local B = -(a[4] * a[9] - a[6] * a[7])
		local C = (a[4] * a[8] - a[5] * a[7])
		local D = -(a[2] * a[9] - a[3] * a[8])
		local E = (a[1] * a[9] - a[3] * a[7])
		local F = -(a[1] * a[8] - a[2] * a[7])
		local G = (a[2] * a[6] - a[3] * a[5])
		local H = - (a[1] * a[6] - a[3] * a[4])
		local I = (a[1] * a[5] - a[2] * a[4])
		return mat3({A, D, G, B, E, H, C, F, I}) / a:det()
	end,
}

return setmetatable(mat, mat)