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

    @IBOutlet weak var passwordInput: EmeraldInput!
    @IBOutlet weak var cpfInput: EmeraldInput!
    @IBOutlet weak var cnpjInput: EmeraldInput!
    @IBOutlet weak var emailInput: EmeraldInput!
    @IBOutlet weak var phoneInput: EmeraldInput!
    @IBOutlet weak var cepInput: EmeraldInput!
    @IBOutlet weak var currencyInput: EmeraldInput!
    @IBOutlet weak var customInput: EmeraldInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordInput.setMask(.password)
        cpfInput.setMask(.cpf)
        cnpjInput.setMask(.cnpj)
        emailInput.setMask(.email)
        phoneInput.setMask(.phone)
        cepInput.setMask(.cep)
        currencyInput.setMask(.currency)
        customInput.setMask(.custom(mask: "[A][-]"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        passwordInput.inputDelegate = self
        cpfInput.inputDelegate = self
        cnpjInput.inputDelegate = self
        emailInput.inputDelegate = self
        phoneInput.inputDelegate = self
        cepInput.inputDelegate = self
        currencyInput.inputDelegate = self
        customInput.inputDelegate = self
    }
    
}

extension InputTableViewController: EmeraldInputDelegate {
    
    func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool) {
        switch input {
        case cpfInput:
            state(cpfInput, text: text,
                  valid: valid,
                  secondState: .error,
                  secondStateMessage: "CPF Error feedback",
                  successMessage: "CPF Success feedback")
        case cnpjInput:
            state(cnpjInput,
                  text: text,
                  valid: valid,
                  secondState: .warning,
                  secondStateMessage: "CNPJ Warning feedback",
                  successMessage: "CNPJ Success feedback")
        case phoneInput:
            state(phoneInput,
                  text: text,
                  valid: valid,
                  secondState: .warning,
                  secondStateMessage: "Phone Warning feedback",
                  successMessage: "Phone Success feedback")
        case cepInput:
            state(cepInput,
                  text: text,
                  valid: valid,
                  secondState: .warning,
                  secondStateMessage: "CEP Warning feedback",
                  successMessage: "CEP Success feedback")
        case customInput:
            state(customInput,
                  text: text,
                  valid: valid,
                  secondState: .warning,
                  secondStateMessage: "Custom Warning feedback",
                  successMessage: "Custom Success feedback")
        default:
            break
        }
    }
    
}

extension InputTableViewController {
    
    func state(_ input: EmeraldInput,
               text: String,
               valid: Bool,
               secondState: EmeraldElementState,
               secondStateMessage: String,
               successMessage: String) {
        if text == "" {
            input.setState(.regular)
            input.bottomText = ""
        } else if valid == false {
            input.setState(secondState)
            input.bottomText = secondStateMessage
        } else {
            input.setState(.success)
            input.bottomText = successMessage
        }
    }
    
}
