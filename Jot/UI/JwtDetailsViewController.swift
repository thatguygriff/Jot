//
//  JwtDetailsViewController.swift
//  Jot
//
//  Created by James Griffin-Allwood on 2018-12-31.
//  Copyright © 2018 James Griffin-Allwood. All rights reserved.
//

import Foundation
import Cocoa

class JwtDetailsViewController: NSViewController {
    
    var jwt: Jwt?
    
    @IBOutlet weak var jwtImportButton: NSButton!
    @IBOutlet var jwtInput: NSTextView!
    @IBOutlet weak var jwtAlgOutput: NSTextField!
    @IBOutlet weak var jwtTypOutput: NSTextField!
    @IBOutlet weak var jwtDetailsTable: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jwtInput.textStorage?.delegate = self
        jwtDetailsTable.delegate = self
        jwtDetailsTable.dataSource = self
    }
    
    @IBAction func importToken(_ sender: NSButton) {
        guard let tokenString = NSPasteboard.general.string(forType: .string) else {
            return
        }
        
        jwtInput.textStorage?.setAttributedString(NSAttributedString(string: tokenString))
    }
}
