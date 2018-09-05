//
//  InputTableViewController.swift
//  EmeraldComponentsApplication
//
//  Created by João Mendes | Stone on 05/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class InputTableViewController: UITableViewController {

    @IBOutlet weak var noMaskInput: EmeraldInput!
    @IBOutlet weak var cpfInput: EmeraldInput!
    @IBOutlet weak var cnpjInput: EmeraldInput!
    @IBOutlet weak var cepInput: EmeraldInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noMaskInput.inputDelegate = self
        cpfInput.inputDelegate = self
        cnpjInput.inputDelegate = self
        cepInput.inputDelegate = self
        
        cpfInput.setMask(.cpf)
        cpfInput.inputText = "122.122"
        cpfInput.errorMessage = "Campo inválido"
        cnpjInput.setMask(.cnpj)
        cepInput.setMask(.cep)
        
        noMaskInput.setMask(.password)
    }

}

extension InputTableViewController: EmeraldInputDelegate {
    
    func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool) {
        print("\(input.title) has text: \(text) \nValid: \(valid)")
    }
    
}
