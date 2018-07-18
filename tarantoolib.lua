-- box.space.my:f_update({id}, {title='Abc', date=os.time()})
function box.schema.space_mt.f_update(space, pk, data)
	local f = {}
	for k, v in pairs(space:format()) do
		f[v.name] = k
	end
	local update = {}
	for k, v in pairs(data) do
		table.insert(update, {'=', f[k] or k, v})
	end
	return space:update(pk, update)
end

-- box.space.my:f_upsert({id}, {title='Abc', date=os.time()})
function box.schema.space_mt.f_upsert(space, pk, data)
	local f = {}
	for k, v in pairs(space:format()) do
		f[v.name] = k
	end
	local upsert = {}
	for k, v in pairs(data) do
		table.insert(upsert, {'=', f[k] or k, v})
	end
	return space:upsert(pk, upsert)
end

-- box.space.my:f_auto_increment({title='Abc', date=os.time()})
function box.schema.space_mt.f_auto_increment(space, data)
	local f = {}
	for k, v in pairs(space:format()) do
		f[v.name] = k - 1
	end
	local tupple = {}
	for k, v in pairs(data) do
		tupple[f[k] or k - 1] = v
	end
	return space:auto_increment(tupple)
end

-- box.space.my:f_insert({id=1, title='Abc', date=os.time()})
function box.schema.space_mt.f_insert(space, data)
	local f = {}
	for k, v in pairs(space:format()) do
		f[v.name] = k
	end
	local tupple = {}
	for k, v in pairs(data) do
		tupple[f[k] or k] = v
	end
	return space:insert(tupple)
end

-- box.space.my:f_replace({id=1, title='Abc', date=os.time()})
function box.schema.space_mt.f_replace(space, data)
	local f = {}
	for k, v in pairs(space:format()) do
		f[v.name] = k
	end
	local tupple = {}
	for k, v in pairs(data) do
		tupple[f[k] or k] = v
	end
	return space:replace(tupple)
end

function tointeger(num)
	num = tonumber(num)
	return num and math.floor(num) or num
end

function tounsigned(num)
	num = tonumber(num)
	return num and math.floor(math.abs(num)) or num
end
