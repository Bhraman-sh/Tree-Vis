local Root = { empty = true }

--INSERT FUNCTION START
function Insert(tree, data)
	if tree.empty then
		tree.left = { empty = true }
		tree.right = { empty = true }
		tree.value = data
		tree.empty = false
		tree.color = false
		return
	end

	tree.color = true
	love.graphics.clear()
	PoTraversal(Root, 400, 50, 400)
	love.graphics.present()
	tree.color = false
	love.timer.sleep(1)

	if data < tree.value then
		Insert(tree.left, data)
	else
		Insert(tree.right, data)
	end
	return nil
end
--INSERT FUNCTION END

--DELETE FUNCTION START
function Delete(tree, data) end
--DELETE FUNCTION END

--FIND LARGEST
function largest(tree)
	if tree.right.empty then
		return tree.value
	end

	local x = largest(tree.right)
	return x
end
--FIND LARGEST END

--IN ORDER TRAVERSAL AND PRINT
function PoTraversal(tree, x, y, a)
	if tree.empty then
		return
	end

	if tree.color then
		love.graphics.setColor(0, 0, 1, 1)
	end

	love.graphics.circle("line", x, y, 20)
	love.graphics.print(tree.value, x, y)

	love.graphics.setColor(1, 1, 1, 1)

	a = a / 2
	if tree.left.empty == false then
		love.graphics.line(x, y, x - a, y + 60)
	end

	if tree.right.empty == false then
		love.graphics.line(x, y, x + a, y + 60)
	end

	PoTraversal(tree.left, x - a, y + 60, a)
	PoTraversal(tree.right, x + a, y + 60, a)

	return nil
end

function IoTraversal(tree)
	if tree.empty then
		return
	end

	IoTraversal(tree.left)
	print(tree.value)
	IoTraversal(tree.right)
end

--print(Root.value)

return Root
