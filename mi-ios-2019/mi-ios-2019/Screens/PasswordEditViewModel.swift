//
//  PasswordEditViewModel.swift
//  mi-ios-2019
//
//  Created by Lukáš Hromadník on 18/03/2019.
//  Copyright © 2019 ČVUT. All rights reserved.
//

import ReactiveSwift

final class PasswordEditViewModel {
    let password: MutableProperty<String>
    let passwordCheck: MutableProperty<String>

    let register: Action<Void, Void, ValidationError>

    // MARK: - Initialization

    init(userData: UserRegistrationData) {
        password = MutableProperty("")
        passwordCheck = MutableProperty("")

        register = Action(state: Property.combineLatest(password, passwordCheck)) { state in
            let (password, passwordCheck) = state

            return SignalProducer { observer, _ in
                if password.isEmpty || passwordCheck.isEmpty {
                    observer.send(error: ValidationError(message: "Password is empty"))
                }

                if password != passwordCheck {
                    observer.send(error: ValidationError(message: "Passwords are not matching"))
                }

                let user = User(username: userData.email, name: userData.name, password: password, phone: userData.phone)
                UserRepository.shared.register(user)

                observer.send(value: ())
                observer.sendCompleted()
            }
        }
    }

}
