class GOO_LIBRARY
inherit 
	WRAPPER_HANDLER -- to access from_external_pointer features of the created wrappers
	SHARED_CREATION_DICTIONARY 
	ANY -- because in the previose classes we undefined copy and is_equal.
feature
	register_creation_agents is
		-- Store creation agents for GooCanvas classes after having done it for all its preconditions.
	do
		print(once "See GOO_LIBRARY!%N")
		-- Uncomment those when you implement the classes: I'm not sure they
		-- will work written like this, but you got the idea behind it.

		creation_agents.put(agent create_goo_canvas_widget, "GooCanvasWidget")
		creation_agents.put(agent create_goo_canvas_rect, "GooCanvasRect")
		creation_agents.put(agent create_goo_canvas_group, "GooCanvasGroup")
		creation_agents.put(agent create_goo_canvas_path, "GooCanvasPath")
		creation_agents.put(agent create_goo_canvas_ellipse, "GooCanvasEllipse")
		creation_agents.put(agent create_goo_canvas_text, "GooCanvasText")
		creation_agents.put(agent create_goo_canvas_polyline, "GooCanvasPolyline")
		creation_agents.put(agent create_goo_canvas_image, "GooCanvasImage")
		creation_agents.put(agent create_goo_canvas_grid, "GooCanvasGrid")
		creation_agents.put(agent create_goo_canvas_table, "GooCanvasTable")
--		creation_agents.put(agent {GOO_CANVAS_WIDGET}.from_external_pointer, "GooCanvasWidget")
--		creation_agents.put(agent create_goo_canvas_rect, "GooCanvasRect")
--		creation_agents.put(agent {GOO_CANVAS_GROUP}.from_external_pointer, "GooCanvasGroup")
--		creation_agents.put(agent {GOO_CANVAS_PATH}.from_external_pointer, "GooCanvasPath")
--		creation_agents.put(agent {GOO_CANVAS_ELLIPSE}.from_external_pointer, "GooCanvasEllipse")
--		creation_agents.put(agent {GOO_CANVAS_TEXT}.from_external_pointer, "GooCanvasText")
--		creation_agents.put(agent {GOO_CANVAS_POLYLINE}.from_external_pointer, "GooCanvasPolyline")
--		creation_agents.put(agent {GOO_CANVAS_IMAGE}.from_external_pointer, "GooCanvasImage")
--		creation_agents.put(agent {GOO_CANVAS_GRID}.from_external_pointer, "GooCanvasGrid")
--		creation_agents.put(agent {GOO_CANVAS_TABLE}.from_external_pointer, "GooCanvasTable")
	end

	create_goo_canvas_rect (p:POINTER): GOO_CANVAS_RECT is 
		do
			create Result.from_external_pointer(p)
		end
	
	create_goo_canvas_widget (p:POINTER): GOO_CANVAS_WIDGET is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_group (p:POINTER): GOO_CANVAS_GROUP is 
		do
--			std_error.put_string ("%NHello from goo_canvas_group!%N%N")
			create Result.from_external_pointer(p)
--			std_error.put_string ("%NCiao from goo_canvas_group!%N%N")
		end
		
	create_goo_canvas_path (p:POINTER): GOO_CANVAS_PATH is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_ellipse (p:POINTER): GOO_CANVAS_ELLIPSE is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_text (p:POINTER): GOO_CANVAS_TEXT is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_polyline (p:POINTER): GOO_CANVAS_POLYLINE is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_image (p:POINTER): GOO_CANVAS_IMAGE is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_grid (p:POINTER): GOO_CANVAS_GRID is 
		do
			create Result.from_external_pointer(p)
		end
		
	create_goo_canvas_table (p:POINTER): GOO_CANVAS_TABLE is 
		do
			create Result.from_external_pointer(p)
		end
	
end
