// retina.js, a high-resolution image swapper (http://retinajs.com), v0.0.2

$(function()
	{
		var user =
		{
			username: document.getElementById("username").value,
			password: document.getElementById("password").value,
			email: document.getElementById("email").value,
		}
		createUser(user);
	});

function createUser(user){

	$.ajax(
			{
				url: "api/",
				data: JSON.stringify(user),
				type: "post",
				dataType: "json",
				contentType: "application/json",
				success: function(response) {
					console.log(response);
					alert(user.username+", welcome!");
				},
				error: function(response) {
					console.log(response);
				}
			});
}