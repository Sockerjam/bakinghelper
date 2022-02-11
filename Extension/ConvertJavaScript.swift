//
//  ReadJavaScript.swift
//  Extension
//
//  Created by Niclas Jeppsson on 11/02/2022.
//

import Foundation

protocol Converter: AnyObject {

    func convert(text: String?)
}

enum ConvertTextError: Error {

    case textIsNil
}

class ConvertJavaScript: Converter {

    var converterOutput: ConverterOutput?

    init(converterOutput: ConverterOutput) {

        self.converterOutput = converterOutput
    }

    func convert(text: String?) {

        guard let text = text, text != "" else {
            converterOutput?.errorOf(type: .textIsNil)
            return
        }


        applyConversion(to: text)
        
    }

    private func applyConversion(to text: String) {

        converterOutput?.loadConverted(text: text)
        
    }

}
