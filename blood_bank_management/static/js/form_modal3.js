// Get the modal and the button elements
var modal3 = document.querySelector("#form-modal2");
var openModalBtn3s = document.querySelectorAll(".openModalBtn3");
var closeModalBtn3 = document.querySelector("#closeModalBtn3");
var naam = document.querySelector("#name-edit")
var startdate = document.querySelector("#startdate-edit")
var enddate = document.querySelector("#enddate-edit")
var address = document.querySelector("#address-edit")
var city = document.querySelector("#city-edit")
var pincode = document.querySelector("#pincode-edit")
var forminfo = document.querySelector("#forminfo")


// Function to open the modal
openModalBtn3s.forEach((openModalBtn3)=>{
    var info = openModalBtn3.id.split("_")
    var pk = parseInt(info[1])
    var camppk = document.querySelector("#camppk")
    openModalBtn3.addEventListener("click", function (e) {
        e.preventDefault();
        modal3.classList.remove("hidden");
        modal3.classList.add("animate-fade-in");
        naam.value = info[2]
        startdate.value = info[3]
        enddate.value = info[4]
        address.value = info[5]
        city.value = info[6]
        pincode.value = info[7]
        camppk.value = pk
        forminfo.action = "/bloodbank/camps/update/" + pk
        return false
    });

})


// Function to close the modal
closeModalBtn3.addEventListener("click", function () {
    modal3.classList.remove("animate-fade-in");
    modal3.classList.add("animate-fade-out");
    modal3.classList.add("hidden");
    modal3.classList.remove("animate-fade-out");
    var camppk = document.querySelector("#camppk")
    naam.value = null
    startdate.value = null
    enddate.value = null
    address.value = null
    city.value = null
    pincode.value = null
    camppk.value = null
});