//



function getPeople() {
	$.getJSON('members.json')
	.done(function(data){
		var faces = '<h2>People!</h2>'
			for (var i = 0; i < data.members.length; i++) { //loop through the JSON file
				faces += '<div class="face img-responsive">';  
				faces += '<a href= "https://twitter.com/' + data.members[i].screen_name + '">'; //link to specific twitter profile
				faces += '<img src="' + data.members[i].image_url + '" height="100px" width="100px" '; //add image as the link and customize alt tags
				faces += 'alt="' + data.members[i].name + ' (@' + data.members[i].screen_name + ')">';
				faces += '</a>';
				faces += '</div>';
			}

		$('#people').html(faces);

	}).fail(function() {
		$('#people').html('<p> Something went wrong loading the photos of these beautiful people. </p>')
	}).always( function(){
		//getPeople();
	});
}

getPeople();

/*

//THE OLD WAY (PURE JAVASCRIPT)

var xhr = new XMLHttpRequest(); 

xhr.onload = function () {
	if(xhr.status === 200) {
		responseObject = JSON.parse(xhr.responseText);

		var faces = ''; //variable to hold the new data
		for (var i = 0; i < responseObject.members.length; i++) { //loop through the JSON file
			faces += '<div class="face">';  
			faces += '<a href= "https://twitter.com/' + responseObject.members[i].screen_name + '">'; //link to specific twitter profile
			faces += '<img src="' + responseObject.members[i].image_url + '" '; //add image as the link and customize alt tags
			faces += 'alt="' + responseObject.members[i].name + ' (@' + responseObject.members[i].screen_name + ')">';
			faces += '</a>';
			faces += '</div>';
		}

		document.getElementById('people').innerHTML = faces; // add the content to the page
	}
};

xhr.open('GET', 'members.json', true); 
xhr.send(null);

*/

