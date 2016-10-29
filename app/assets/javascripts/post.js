var comment_list = document.getElementById('comment-list-block');
var modal = document.getElementById('modal-comment');
var close = document.getElementById('close');

if(comment_list) {
	comment_list.onclick = function(event) {
		if(event.target.id == 'comment-edit') {
			modal.style.display = "block";
			form = document.getElementById('modal-comment-form');
			console.log(event.target.parentNode.parentNode.parentNode.lastChild);
			document.getElementById('comment-content-field').value = event.target.parentNode.parentNode.parentNode.lastElementChild.innerHTML;

			form.action = "/posts/" + event.target.getAttribute('data-post') + "/comments/" + event.target.getAttribute('data-value');
			
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