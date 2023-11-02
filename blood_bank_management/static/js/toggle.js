function toggle(){
    let temp = document.getElementById("navbar-sticky").className;
    if (temp.includes("hidden")) {
        document.getElementById("navbar-sticky").className = temp.replace(" hidden","");
    }
    else {
        document.getElementById("navbar-sticky").className += " hidden"
    }
}