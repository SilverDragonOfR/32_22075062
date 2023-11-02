// Get the modal and the button elements
var modal2 = document.querySelector("#form-modal");
var openModalBtn2s = document.querySelectorAll(".openModalBtn2");
var closeModalBtn2 = document.querySelector("#closeModalBtn2");

// Function to open the modal
openModalBtn2s.forEach((openModalBtn2)=>{
    var pk = openModalBtn2.id.slice(14)
    var requestpk = document.querySelector("#requestpk")
    openModalBtn2.addEventListener("click", function () {
        modal2.classList.remove("hidden");
        modal2.classList.add("animate-fade-in");
        requestpk.value = parseInt(pk)
    });
})


// Function to close the modal
closeModalBtn2.addEventListener("click", function () {
    modal2.classList.remove("animate-fade-in");
    modal2.classList.add("animate-fade-out");
    modal2.classList.add("hidden");
    modal2.classList.remove("animate-fade-out");
    var requestpk = document.querySelector("#requestpk")
    requestpk.value = null
});