var donations = document.querySelectorAll(".donation_class")
donations.forEach((donation) => {
    var pk = donation.id.slice(9)
    donation.addEventListener("click", async () => {
        const res = await fetch("/api/donation/post_seen_update", {
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
    })
})