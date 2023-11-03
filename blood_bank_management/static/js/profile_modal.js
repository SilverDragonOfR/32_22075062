// Get the modal and the button elements
var modal = document.querySelector("#profile-modal");
var openModalBtn = document.querySelector("#openModalBtn");
var closeModalBtn = document.querySelector("#closeModalBtn");
var closeEditProfileModalBtn = document.querySelector("#closeEditProfileModalBtn");
var editModalBtn = document.querySelector("#editModalBtn")
var editProfileModal = document.querySelector("#edit-profile-modal")

// Function to open the modal
openModalBtn.addEventListener("click", function () {
    modal.classList.remove("hidden");
    modal.classList.add("animate-fade-in");
});

// Function to close the modal
closeModalBtn.addEventListener("click", function () {
    modal.classList.remove("animate-fade-in");
    modal.classList.add("animate-fade-out");
    modal.classList.add("hidden");
    modal.classList.remove("animate-fade-out");
});

editModalBtn.addEventListener("click", function () {
    modal.classList.remove("animate-fade-in");
    modal.classList.add("animate-fade-out");
    modal.classList.add("hidden");
    modal.classList.remove("animate-fade-out");

    editProfileModal.classList.remove("hidden");
    editProfileModal.classList.add("animate-fade-in");
})

closeEditProfileModalBtn.addEventListener("click", function () {
    editProfileModal.classList.remove("animate-fade-in");
    editProfileModal.classList.add("animate-fade-out");
    editProfileModal.classList.add("hidden");
    editProfileModal.classList.remove("animate-fade-out");
});