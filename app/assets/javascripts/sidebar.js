var sidebar = document.getElementById('left-sidebar-menu');
var active_li = null; 
var active_div = null;

sidebar.onclick = function(event) {
	var li = event.target;
	var div = document.getElementById('nested-block-' + li.value);

	if(div != null) {
		if(div == active_div && li == active_li) {
			div.style.display = "";
			active_div.style.display = "";
			active_li.style.background = "";

			active_li = null; 
			active_div = null;
		}else {
			if(active_div == null && active_li == null) {
				active_div = div;
				active_li = li;

				active_div.style.display = "block";
				active_li.style.background = "#C8D6DB";
			}else {
				active_div.style.display = "";
				active_li.style.background = "";

				active_div = div;
				active_li = li;

				active_div.style.display = "block";
				active_li.style.background = "#C8D6DB";
			}
		}

		return false;
	}
}