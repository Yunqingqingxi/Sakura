// script.js

document.getElementById('submitBtn').addEventListener('click', function() {
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var age = document.getElementById('age').value;

    var data = {
        name: name,
        email: email,
        age: age
    };

    // Log the data (you can send it to the server here if needed)
    console.log('Submitting:', data);

    // Display a confirmation message
    var confirmationMessage = document.getElementById('confirmationMessage');
    confirmationMessage.classList.remove('hidden');

    // Clear the form fields
    document.getElementById('name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('age').value = '';

    // Optionally, you can focus on the first input field
    document.getElementById('name').focus();
});
