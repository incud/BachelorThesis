-- inst.lua
-- call inst with name = name of the tikz node, label = label of tikz node
-- absp abstract point
-- x and y coordinate in the grid
function inst(name, label, absp, x, y)
    -- define statement node 
    tex.sprint("\\node[draw, minimum height=0.8cm, minimum width=4cm] ("..name..") ");
    -- statement node position
    tex.sprint("at ("..x..","..y..") {\\texttt{"..label.."}};");
    
    -- define statement abstractpoint
    tex.sprint("\\node[circle, draw, fill=white, minimum size=5pt] ");
    -- statement abstractpoint position
    tex.sprint("at ("..name..".north west) {\\footnotesize\\textsf{"..absp.."}};");
end

-- store.lua
-- name = string, name of the tikz node
-- storeitem = string of a two cols table where rows are 
--     separated with | and cell separated with &
-- heapitem = string of the same format
-- x,y = coordinates
function store(name, storeitem, heapitem, x, y)
    
    -- write table header
    tex.sprint("\\node ("..name..") at ("..x..","..y..") {");
    tex.sprint("\\begin{tabular}{| l @{ $\\mapsto$ } l |} ");
    
    -- write store
    tex.sprint("\\hline \\multicolumn{2}{|c|}{Store} \\\\ ");
    for row in string.gmatch(storeitem, '([^|]+)') do
        local storetablerow = {};
        for cell in string.gmatch(row, '([^&]+)') do
            storetablerow[#storetablerow + 1] = cell;
        end
        tex.sprint(storetablerow[1].." & "..storetablerow[2].." \\\\");
    end
    
    -- write heap
    tex.sprint("\\hline \\multicolumn{2}{|c|}{Heap} \\\\ ");
    for row in string.gmatch(heapitem, '([^|]+)') do
        local heaptablerow = {};
        for cell in string.gmatch(row, '([^&]+)') do
            heaptablerow[#heaptablerow + 1] = cell;
        end
        tex.sprint(heaptablerow[1].." & "..heaptablerow[2].." \\\\");
    end
    
    -- close table and close label of node
    tex.sprint("\\hline \\end{tabular} };");
end

-- storeret.lua
-- name = string, name of the tikz node
-- storeitem = string of a two cols table where rows are 
--     separated with | and cell separated with &
-- heapitem = string of the same format
-- x,y = coordinates
function storeret(name, storeitem, heapitem, retval, x, y)
    
    -- write table header
    tex.sprint("\\node ("..name..") at ("..x..","..y..") {");
    tex.sprint("\\begin{tabular}{| l @{ $\\mapsto$ } l |} ");
    
    -- write store
    tex.sprint("\\hline \\multicolumn{2}{|c|}{Store} \\\\ ");
    for row in string.gmatch(storeitem, '([^|]+)') do
        local storetablerow = {};
        for cell in string.gmatch(row, '([^&]+)') do
            storetablerow[#storetablerow + 1] = cell;
        end
        tex.sprint(storetablerow[1].." & "..storetablerow[2].." \\\\");
    end
    
    -- write heap
    tex.sprint("\\hline \\multicolumn{2}{|c|}{Heap} \\\\ ");
    for row in string.gmatch(heapitem, '([^|]+)') do
        local heaptablerow = {};
        for cell in string.gmatch(row, '([^&]+)') do
            heaptablerow[#heaptablerow + 1] = cell;
        end
        tex.sprint(heaptablerow[1].." & "..heaptablerow[2].." \\\\");
    end
    
    tex.sprint("\\hline \\multicolumn{2}{|c|}{Return value} \\\\ ");
    for row in string.gmatch(retval, '([^|]+)') do
        local heaptablerow = {};
        for cell in string.gmatch(row, '([^&]+)') do
            heaptablerow[#heaptablerow + 1] = cell;
        end
        tex.sprint(heaptablerow[1].." & "..heaptablerow[2].." \\\\");
    end
    
    -- close table and close label of node
    tex.sprint("\\hline \\end{tabular} };");
end