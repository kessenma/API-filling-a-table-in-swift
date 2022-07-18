//
//  Model.swift
//  API_Filling_a_table

//
//  Created by Kyle Essenmacher on 7/16/22.
//

import Foundation



struct ToDo:Decodable {
    let userId: Int
    let id: Int
    let title:String
    let completed:Bool

    
}
