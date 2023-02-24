local commentStatus, comment = pcall(require, "Comment")
if not commentStatus then
	return
end

local todoStatus, todo = pcall(require, "todo-comments")
if not todoStatus then
	return
end

comment.setup()

todo.setup()
