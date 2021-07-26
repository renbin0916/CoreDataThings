//
//  ViewController.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/20.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let abilities: [Difficult] = CDManager.shared.fetchEntity()
        {
            for item in abilities
            {
                CDManager.shared.context.delete(item)
                debugPrint(item.ability)
            }
            CDManager.shared.saveContext()
        }
        let ability = Ability(with: "破坏死光2", destructivePower: 199999, couldRestoreVitality: false, color: .red, locations: [])

        CDManager.shared.saveEntity(Difficult.self, info: ["ability" : ability])
    }

}




