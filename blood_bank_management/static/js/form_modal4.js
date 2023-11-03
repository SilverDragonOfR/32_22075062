// Get the modal and the button elements
var modal3 = document.querySelector("#form-modal2");
var openModalBtn3s = document.querySelectorAll(".openModalBtn3");
var closeModalBtn3 = document.querySelector("#closeModalBtn3");
var bloodgroup = document.querySelector("#bloodgroup-edit")
var amount = document.querySelector("#amount-edit")
var forminfo = document.querySelector("#forminfo")

// Function to open the modal
openModalBtn3s.forEach((openModalBtn3)=>{
    var info = openModalBtn3.id.split("_")
    var pk = parseInt(info[1])
    var requestpk = document.querySelector("#requestpk")
    openModalBtn3.addEventListener("click", function (e) {
        e.preventDefault();
        modal3.classList.remove("hidden");
        modal3.classList.add("animate-fade-in");
        bloodgroup.value = info[2]
        amount.value = info[3]
        requestpk.value = pk
        forminfo.action = "/hospital/requests/update/" + pk
        return false
    });
})

// Function to close the modal
closeModalBtn3.addEventListener("click", function () {
    modal3.classList.remove("animate-fade-in");
    modal3.classList.add("animate-fade-out");
    modal3.classList.add("hidden");
    modal3.classList.remove("animate-fade-out");
    var requestpk = document.querySelector("#requestpk")
    bloodgroup.value = null
    amount.value = null
    requestpk.value = null
});