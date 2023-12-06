function displayErrorMessage() {

    var errorMessage = '<%= request.getAttribute("errorMessage") %>';
    var errorElement = document.getElementById("error-message");

    // // Set the initial display style to "none"
    errorElement.style.display = "none";
    // Display the error message
    if(errorMessage) {
        errorElement.textContent = errorMessage;
        errorElement.style.display = "block";// Make the error message visible
    }else {
        // Hide the error message
        errorElement.style.display = "none"; // Hide the error message
    }
    window.addEventListener("load", displayErrorMessage);
}