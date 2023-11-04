const splash = document.querySelector("#splash-anim")
const mainContent = document.querySelector("#main-content")
const hasSeenSplash = sessionStorage.getItem("hasSeenSplash");
if (hasSeenSplash) {

} else {
    splash.classList.remove("hidden")
    mainContent.classList.add("hidden")
    setTimeout(() => {
        splash.classList.add("hidden")
        mainContent.classList.remove("hidden")
        sessionStorage.setItem("hasSeenSplash", true);
    }, 4000)
}
