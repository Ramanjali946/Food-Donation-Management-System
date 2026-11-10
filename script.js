function validateRegisterForm() {

    var fullName = document.getElementById("txtFullName").value.trim();
    var email = document.getElementById("txtEmail").value.trim();
    var phone = document.getElementById("txtPhone").value.trim();
    var password = document.getElementById("txtPassword").value;
    var confirmPassword = document.getElementById("txtConfirmPassword").value;
    var role = document.getElementById("ddlRole").value;
    var address = document.getElementById("txtAddress").value.trim();
    var city = document.getElementById("txtCity").value.trim();

    if (fullName === "") {
        alert("Please enter your full name.");
        return false;
    }

    if (email === "") {
        alert("Please enter your email.");
        return false;
    }

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (phone === "") {
        alert("Please enter your phone number.");
        return false;
    }

    var phonePattern = /^[0-9]{10}$/;

    if (!phonePattern.test(phone)) {
        alert("Phone number must contain exactly 10 digits.");
        return false;
    }

    if (password === "") {
        alert("Please enter a password.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must contain at least 6 characters.");
        return false;
    }

    if (confirmPassword === "") {
        alert("Please confirm your password.");
        return false;
    }

    if (password !== confirmPassword) {
        alert("Password and Confirm Password do not match.");
        return false;
    }

    if (role === "") {
        alert("Please select a role.");
        return false;
    }

    if (address === "") {
        alert("Please enter your address.");
        return false;
    }

    if (city === "") {
        alert("Please enter your city.");
        return false;
    }

    return true;
}

// ========================================
// LOGIN VALIDATION
// ========================================

function validateLoginForm() {

    var email = document.getElementById("txtLoginEmail").value.trim();

    var password = document.getElementById("txtLoginPassword").value;

    if (email === "") {
        alert("Please enter your email address.");
        return false;
    }

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (password === "") {
        alert("Please enter your password.");
        return false;
    }

    return true;
}


// ========================================
// SHOW / HIDE PASSWORD
// ========================================

function togglePassword() {

    var passwordBox = document.getElementById("txtLoginPassword");

    if (passwordBox.type === "password") {

        passwordBox.type = "text";

    } else {

        passwordBox.type = "password";

    }
}
function confirmLogout() {
    return confirm("Are you sure you want to logout?");
}

// ========================================
// DONATION FORM VALIDATION
// ========================================
function validateDonationForm() {
    var name = document.getElementById("txtFoodName").value.trim();
    var type = document.getElementById("ddlFoodType").value;
    var qty = parseInt(document.getElementById("txtQuantity").value, 10);
    var addr = document.getElementById("txtPickupAddress").value.trim();
    var date = document.getElementById("txtPickupDate").value;
    if (name === "") { alert("Please enter the food name."); return false; }
    if (type === "") { alert("Please select the food type."); return false; }
    if (isNaN(qty) || qty <= 0) { alert("Please enter a valid quantity."); return false; }
    if (addr === "") { alert("Please enter the pickup address."); return false; }
    if (date === "") { alert("Please select the pickup date."); return false; }
    return true;
}
