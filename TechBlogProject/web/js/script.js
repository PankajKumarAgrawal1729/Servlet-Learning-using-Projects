function getPost(catId) {
    $(".c-link").removeClass("active");
    let currentTarget = event ? event.currentTarget : $("#allpost")[0];
    if (currentTarget) {
        let allElements = Array.from($(".c-link")).filter(element => element.innerText.trim() === currentTarget.innerText.trim());
        $("#loader").show();

        allElements.forEach(element => {
            $(element).addClass("active");
        });

        $("#post-container").hide();

        // Loading post using ajax
        $.ajax({
            url: "loadpost.jsp",
            data: {cid: catId},
            success: function (data, textStatus, jqXHR) {
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);
            }
        });
    }
}

function bindEvents() {
    let editStatus = false;
    $("#edit-profile-btn").on('click', function () {
        if (!editStatus) {
            $("#profile-details").hide();
            $("#profile-edit").show();
            $(this)[0].innerText = "Show";
            editStatus = true;
        } else {
            $("#profile-details").show();
            $("#profile-edit").hide();
            $(this)[0].innerText = "Edit";
            editStatus = false;
        }
    });
}

$(document).ready(function () {
    getPost(0);
    bindEvents();
});
