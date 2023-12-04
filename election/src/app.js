// app.js
<!-- Add this line before your app.js script -->
<script src="https://cdn.ethers.io/lib/ethers-5.0.umd.min.js"></script>
<script src="app.js"></script>
// app.js
document.addEventListener('DOMContentLoaded', async () => {
    // Connect to the deployed contract
    const contract = new ethers.Contract('0x276E8DEd8b0D7Fd1a2A9A70faF15f004d2187A98', MissingDiaries.abi, signer);

    document.getElementById('missingForm').addEventListener('submit', async (e) => {
        e.preventDefault();

        const name = document.getElementById('name').value;
        const age = document.getElementById('age').value;
        const height = document.getElementById('height').value;
        const status = document.getElementById('status').value;
        const description = document.getElementById('description').value;
        const division = document.getElementById('division').value;
        const contactNumber = document.getElementById('contactNumber').value;

        await contract.addPerson(name, age, height, status, description, division, contactNumber);
    });

    document.getElementById('searchDivision').addEventListener('change', async () => {
        // Now, the searchMissingPeople function is defined
        searchMissingPeople();
    });
});

async function addPerson() {
    // Implementation of the addPerson function
    // This is where you interact with your smart contract to add a person
}

async function searchMissingPeople() {
    const division = document.getElementById('searchDivision').value;
    const resultDiv = document.getElementById('result');

    // Call the smart contract function to get missing people count for a specific division
    const missingCount = await contract.getMissingCount(division);

    resultDiv.innerHTML = `Missing People Count: ${missingCount}`;
}

