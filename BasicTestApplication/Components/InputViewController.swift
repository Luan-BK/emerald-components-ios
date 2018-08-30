//
//  InputViewController.swift
//  BasicTestApplication
//
//  Created by Luan Kalume | Stone on 20/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import SlingBasicComponent

class InputViewController: UIViewController {

    @IBOutlet weak var noMaskInput: SlingInput!
    @IBOutlet weak var cpfInput: SlingInput!
    @IBOutlet weak var cnpjInput: SlingInput!
    @IBOutlet weak var cepInput: SlingInput!
    
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

extension InputViewController: SlingInputDelegate {
    
    func inputDidChange(_ input: SlingInput, text: String, valid: Bool) {
        print("\(input.title) has text: \(text) \nValid: \(valid)")
    }
    
}
