$(function() {
    $("#show-tel").on("click", function() {
        var $this = $(this);
        $this.find("span").text($this.data("telephone"))
    });

    $("#send-message-to-agent").on("click", function() {
        var agent_id = $("#agent_id").val(),
            first_name = $("#message-first-name").val(),
            last_name = $("#message-last-name").val(),
            email = $("#message-email").val(),
            message = $("#message-text").val();

        $.ajax({
            url: "http://localhost:3000/agent/message",
            method: "post",
            data: {
                agent_id: agent_id,
                first_name: first_name,
                last_name: last_name,
                email: email,
                message: message
            },
            success: function(data) {
                $('#contact-modal form').remove();
                $('#send-message-to-agent').remove();
                $('#contact-modal .modal-body').html("<p>Your message has been sent successfully</p>");
            }
        });
    });

    $("#toggleDetails").on("click", function() {
        var details = $("#prop-details");

        details.toggleClass("open");

        if (details.hasClass("open")) {
            $(this).text("Show less")
        } else {
            $(this).text("Read more")
        }
    })

    $('#contact-modal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var modal = $(this);
    })
});