
let count = 0;

function showMore() {
	count++;
	document.getElementById('property-detail'+count).style.display = 'block';
	return false
}