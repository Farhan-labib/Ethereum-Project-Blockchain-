// contracts/MissingDiaries.sol
pragma solidity ^0.5.16;

contract MissingDiaries {
    struct Person {
        string name;
        uint256 age;
        uint256 height;
        string status;
        string description;
        string division;
        string contactNumber;
    }

    mapping(address => bool) public admins;
    mapping(uint256 => Person) public people;
    uint256 public peopleCount = 0;

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admins can call this function");
        _;
    }

    function addAdmin(address _admin) external onlyAdmin {
        admins[_admin] = true;
    }

function addPerson(
    string calldata _name,
    uint256 _age,
    uint256 _height,
    string calldata _status,
    string calldata _description,
    string calldata _division,
    string calldata _contactNumber
) external {
    peopleCount++;
    people[peopleCount] = Person({
        name: _name,
        age: _age,
        height: _height,
        status: _status,
        description: _description,
        division: _division,
        contactNumber: _contactNumber
    });
}


    function updateStatus(uint256 _personId) external onlyAdmin {
        require(_personId <= peopleCount, "Person does not exist");
        people[_personId].status = "found";
    }

    function getMedian() external view returns (uint256) {
        uint256[] memory counts = new uint256[](peopleCount);
        for (uint256 i = 1; i <= peopleCount; i++) {
            if (keccak256(abi.encodePacked((people[i].status))) == keccak256(abi.encodePacked(("missing")))) {
                counts[i - 1] = 1;
            }
        }
        return calculateMedian(counts);
    }

    function calculateMedian(uint256[] memory counts) internal pure returns (uint256) {
        uint256 n = counts.length;
        uint256[] memory sortedCounts = sortArray(counts);

        if (n % 2 == 0) {
            return (sortedCounts[n / 2 - 1] + sortedCounts[n / 2]) / 2;
        } else {
            return sortedCounts[n / 2];
        }
    }

    function sortArray(uint256[] memory arr) internal pure returns (uint256[] memory) {
        for (uint256 i = 0; i < arr.length; i++) {
            for (uint256 j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    (arr[i], arr[j]) = (arr[j], arr[i]);
                }
            }
        }
        return arr;
    }
}

