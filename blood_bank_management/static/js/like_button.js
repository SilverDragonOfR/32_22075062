var donations = document.querySelectorAll(".donation_class")
donations.forEach((donation) => {
    var pk = donation.id.slice(9)
    var likeButton = document.querySelector("#donation_button_"+pk)
    likeButton.addEventListener("click", async () => {
        const res = await fetch("/api/donation/post_like_update", {
            method: "POST",
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                'X-CSRFToken': csrftoken
            },
            body: JSON.stringify([{
                csrfmiddlewaretoken: csrftoken,
                pk: pk
            }]),
            credentials: 'same-origin'
        })
        likeButton.classList.toggle("opacity-20")
    })
})