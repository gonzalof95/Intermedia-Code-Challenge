//
//  Constants.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

struct TitleConstants {
    static let mainScreenTitle = "Marvel Challenge"
    static let firstTabBarTitle = "Personajes"
    static let secondTabBarTitle = "Eventos"
}

struct AssetConstants {
    static let heroIconEnabled = "iconSuperheroEnabled"
    static let heroIconDisabled = "iconSuperHeroDisabled"
    static let calendarIconEnabled = "iconCalendarEnabled"
    static let calendarIconDisabled = "iconCalendarDisabled"
}

struct Fonts {
    static let mainFont = "RobotoCondensed-Regular"
    static let tabBarFont = "Roboto-Regular"
}

struct ErrorMessages {
    static let couldNotLog = "Could not log the user."
    static let couldNotRegister = "Could not register the user." 
    static let emptyField = "Complete the text fields."
    static let invalidEmail = "Invalid email format."
}

struct NetworkingConstants {
    static let baseURL = "https://gateway.marvel.com/v1/public/characters"
    static let publicKey = "API_PUB_KEY"
    static let hash = "API_HASH"
}
