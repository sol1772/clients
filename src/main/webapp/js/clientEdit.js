const re = /^[\d+][\d() -]{4,14}\d$/;
const phone = document.getElementById("newContact");
const phoneType = document.getElementById("newContactType");
const phoneTbl = document.getElementById("contactTable");
const addContactBtn = document.getElementById("addContact");
const saveBtn = document.getElementById("saveBtn");
const closeBtn = document.getElementById("close");
const error = document.getElementById("error");

function validateFields() {
    let validated = true;
    Array.from(document.querySelectorAll('[required]')).forEach(function (e) {
        if (Object.is(e.value, "")) {
            e.style.border = '0.15rem ridge red';
            validated = false;
        } else {
            e.style.border = '';
        }
    });
    if (validated) {
        return true;
    } else {
        error.innerText = "Required fields not filled";
        return false;
    }
}

function validatePhone(phoneNum) {
    for (let i = 0; i < phoneTbl.rows.length; i++) {
        if (Object.is(phoneTbl.rows[i].cells[1].getElementsByTagName('input')[0].value, phoneNum)) {
            phone.style.border = '3px ridge red';
            error.innerHTML = "Contact already exists";
            return false;
        }
    }
    return true;
}

function addTableRow(phoneNum, phoneType) {
    let newRow, newCell1, newCell2, newCell3, newCell4, newCell5;
    if (phoneTbl.rows.length < 5) {
        let contType = phoneType === "Phone" ? "Телефон" : "Email";

        newRow = phoneTbl.insertRow();
        newCell1 = newRow.insertCell();
        newCell1.innerHTML = "<td id='colContactType'></td>"
        newCell1.textContent = contType;
        newCell1.style.fontSize = "small";
        newCell1.style.borderRight = "solid 1px lightgrey";
        newCell1.style.width = "7rem";

        newCell2 = newRow.insertCell();
        newCell2.innerHTML = "<td id='colPhoneNum'><input type='tel' readonly name='contacts[" + rowsCounter() +
            "].txtContent' id='phoneNum' value='" + phoneNum + "'></td>";
        newCell2.style.fontSize = "small";
        newCell2.style.width = "15rem";

        newCell3 = newRow.insertCell();
        newCell3.innerHTML = "<td><input type='hidden' name='contacts[" + rowsCounter() +
            "].id' id='contactId' value='0'></td>";

        newCell4 = newRow.insertCell();
        newCell4.innerHTML = "<td><input type='hidden' name='contacts[" + rowsCounter() +
            "].contactType' id='contactType' value='" + phoneType.toUpperCase() + "'></td>";

        newCell5 = newRow.insertCell();
        newCell5.innerHTML = "<td id='colDelPhone'>" +
            "<button class='btn btn-sm btn-outline-secondary' type='button' id='delPhone'>x</button></td>";
        newCell5.style.textAlign = "right";
        newCell5.addEventListener('click', function () {
            const a = this.closest('tr');
            a.parentElement.removeChild(a);
        });
    } else {
        phone.style.border = '3px ridge red';
        error.innerHTML = "Макс.кол-во контактов = 5";
    }
}

function rowsCounter() {
    return phoneTbl.rows.length - 1;
}

addContactBtn.addEventListener("click", function () {
    if (validatePhone(phone.value)) {
        addTableRow(phone.value, phoneType.value);
    }
});

Array.from(document.querySelectorAll("button[id=delPhone]")).forEach(function (e) {
    e.addEventListener('click', function () {
        const a = this.closest('tr');
        a.parentElement.removeChild(a);
    });
});

saveBtn.addEventListener("click", function (e) {
    if (!validateFields()) {
        e.preventDefault();
        closeBtn.click();
    }
})
