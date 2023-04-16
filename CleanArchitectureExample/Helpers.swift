import Foundation

let fetchStub = {
    return stubResponse.data(using: .utf8)!
}

let stubResponse = """
[
    {
        "id": "1d85498c-d95f-11ed-afa1-0242ac120002",
        "playerName": {
            "firstName": "First",
            "lastName": "Last"
        },
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcDCSuXudcIO6M4F3uBTgqmdiJH3Z7RBvIsg&usqp=CAU"
    },
    {
        "id": "b863eb48-d95f-11ed-afa1-0242ac120002",
        "playerName": {
            "firstName": "Another",
            "lastName": "Another l"
        },
    },
    {
        "id": "332db28c-d960-11ed-afa1-0242ac120002",
        "playerName": {
            "firstName": "Three",
            "lastName": "Another l"
        },
    }
]
"""

extension Collection where Element == PlayerDescriptor {
    static func stub() -> [PlayerDescriptor] {
        [
            PlayerDescriptor(id: UUID(), displayName: "First player name", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcDCSuXudcIO6M4F3uBTgqmdiJH3Z7RBvIsg&usqp=CAU")),
            PlayerDescriptor(id: UUID(), displayName: "Second player name", imageURL: nil)
        ]
    }
}
