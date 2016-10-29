
// var file_tag = document.getElementById('file-tag');
// var upload_file_info = document.getElementById('upload-file-info');

// if(file_tag) upload_file_info.style.display = 'none';


// function delete_file() {
// 	var input = document.getElementById('file-block').appendChild(document.createElement('input'));

// 	input.type = 'hidden';
// 	input.name = 'drop_file';

// 	document.getElementById('file-tag').style.display = 'none';
// 	document.getElementById('delete-file').style.display = 'none';
	
// 	upload_file_info.style.display = 'block';
	
// 	return false;
// }

function readURL(input) {

  if (input.files && input.files[0]) {
    var reader =  new FileReader();

    reader.onload = function (e) {
    	$('#file-tag').attr('src', e.target.result);
    	$('#file-tag').css("display","block");
    }

    reader.readAsDataURL(input.files[0]);
  }
}

$(document).ready(function() {  
	$("#file").change(function() {
	  $("#clear").css("display","block");
	  $("#raper_file").css("display","none");
	  if($("#drop-file")) $("#drop-file").remove();
	  readURL(this);
	});

	$("#clear").click(function (e) {
    $("#file-tag").css("display","none");
    $("#file").val("");
    $("#raper_file").css("display","block");
    $("#clear").css("display","none");
    $("#file-block").append("<input type='hidden' name='drop_file' id='drop-file'>");
    e.preventDefault();
  });
}); 

var category_list = document.getElementById('category-list-block');
var modal = document.getElementById('modal-category');
var close = document.getElementById('close');

if(category_list) {
	category_list.onclick = function(event) {
		if(event.target.id == 'category-edit') {
			modal.style.display = "block";
			form = document.getElementById('modal-category-form');

			document.getElementById('modal-category-name').innerHTML = event.target.name;
			document.getElementById('modal_category_name').value = event.target.name;

			form.action = "/admin/categories/" + event.target.getAttribute('data-value');
			
			return false;
		}	
	}

	close.onclick = function(event) {
		modal.style.display = "none";
	}

	window.onclick = function(event) {
		if(event.target == modal) {
			modal.style.display = "none";
		}
	}
}

