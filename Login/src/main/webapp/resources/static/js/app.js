// input fields focus effects
const textInputs = document.querySelectorAll("input");

textInputs.forEach(textInput => {
	textInput.addEventListener("focus", ()=> {
		let parent = textInput.parentNode;
		parent.classiclist.add("active");
	})

	textInput.addEventListener("blur", ()=> {
		let parent = textInput.parentNode;
		parent.classList.remove("active");
	});
});

	const passwordInput = document.querySelector(".password-input");
	const eyeBtn = document.querySelector(".eye-btn");
	
	eyeBtn.addEventListener("click", () =>{
		if(passwordInput.type === "password"){
			passwordInput.type="text";
			eyeBtn.innerHTML = "<i class='uil uil-eye'></i>";
		}
		else{
			passwordInput.type = "password";
			eyeBtn.innerHTML = "< i class='uil uil-eye-slash'></i>";
		}
	});