$("#message").html("<%= j render_notifications(@notifications)%>")
$("#notifications").addClass("active")
$("#spinner").remove()
