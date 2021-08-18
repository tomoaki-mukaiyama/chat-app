window.onload = function () {
    var nodes = document.querySelectorAll(".message.mb-2")
    nodes = Array.from(nodes)
    nodes.pop()
        .scrollIntoView({
            behavior: "instant",
            block: "start"
        });
}
document.body.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
        var nodes = document.querySelectorAll(".message.mb-2")
        nodes = Array.from(nodes)
        nodes.pop()
            .scrollIntoView({
                behavior: "instant",
                block: "start"
            });
    }
})


function isVisible(elem) {
    const elemCenter = {
        y: elem.getBoundingClientRect().top + elem.offsetHeight / 2
    };
    if (elemCenter.y > 821.5) {
        console.log(elemCenter.y)
        return false
    } else {
        return true
    }
}

const checkExist = setInterval(() => {
    if (document.querySelector("#messages")) {
        clearInterval(checkExist);
        var target = document.querySelector("#messages")
        const observer = new MutationObserver(records => {
            var nodes = document.querySelectorAll(".message.mb-2")
            nodes = Array.from(nodes)
            if (isVisible(nodes[nodes.length - 2])) {
                nodes.pop()
                    .scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });
            }
        });

        observer.observe(target, {
            childList: true
        })
    }
}, 500)