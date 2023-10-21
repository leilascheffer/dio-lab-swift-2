protocol Authenticatable {
    func authenticate(completion: (Bool) -> Void)
}

struct PasswordAuthentication: Authenticatable {
    var password: String

    func authenticate(completion: (Bool) -> Void) {
        completion(password == "secret")
    }
}

struct BiometricAuthentication: Authenticatable {
    enum BiometricType {
        case faceID
        case touchID
    }

    var type: BiometricType

    func authenticate(completion: (Bool) -> Void) {
        switch type {
        case .faceID:
            print("Autenticando via FaceID")
            completion(true)  // faceID success simulation
        case .touchID:
            print("Autenticando via TouchID")
            completion(false) // touchId fail simulation
        }
    }
}

class Authenticator {
    var methods: [Authenticatable]

    init(methods: [Authenticatable]) {
        self.methods = methods
    }

    func testAuthentication() {
        for method in methods {
            method.authenticate { isAuthenticated in
                if isAuthenticated {
                    print("Teste: Autenticado com sucesso!")
                } else {
                    print("Teste: Erro na autenticação!")
                }
            }
        }
    }
}

let authenticator = Authenticator(methods: [PasswordAuthentication(password: "secret"), BiometricAuthentication(type: .faceID), BiometricAuthentication(type: .touchID)])

authenticator.testAuthentication()

