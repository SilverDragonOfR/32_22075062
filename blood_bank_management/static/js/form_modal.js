// Get the modal and the button elements
var modal2 = document.querySelector("#form-modal");
var openModalBtn2 = document.querySelector("#openModalBtn2");
var closeModalBtn2 = document.querySelector("#closeModalBtn2");

// Function to open the modal
openModalBtn2.addEventListener("click", function () {
    modal2.classList.remove("hidden");
    modal2.classList.add("animate-fade-in");
});

// Function to close the modal
closeModalBtn2.addEventListener("click", function () {
    modal2.classList.remove("animate-fade-in");
    modal2.classList.add("animate-fade-out");
    modal2.classList.add("hidden");
    modal2.classList.remove("animate-fade-out");

});