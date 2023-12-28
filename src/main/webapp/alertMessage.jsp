<% String msg = (String) session.getAttribute("message");
  if (msg != null) { %>
<div class="alert alert-info alert-dismissible fade show" role="alert" id="alertBox">
  <%= msg %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
    session.removeAttribute("message");
  }
%>

