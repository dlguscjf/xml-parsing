//
//  ViewController.swift
//  xml parsing
//
//  Created by D7703_11 on 2018. 9. 17..
//  Copyright © 2018년 dit.ac.kr. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,XMLParserDelegate{

    var item:[String:String] = [:]  // item[key] => value
    var elements:[[String:String]] = []
    var currentElement = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.url(forResource: "Fruit", withExtension: "xml"){
            if let myparser = XMLParser(contentsOf: path){
                //XMLParserDekegata
                myparser.delegate = self
                
                
                if myparser.parse(){
                    print("parsing succed!")
                    print(elements)
                }else{
                    print("parsing failed!")
                }
            }else{
                print("parser nil")
            }
            
        }else{
            print("XML file not found!")
        }
     
    }
        //XMLParserDelegate 메소드 호출
        //1.tag(element)를 만났을때
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        currentElement = elementName
        print("currentElement = \(currentElement)")
    }
    //2.문자열을 받았을때
    func parser(_ parser: XMLParser, foundCharacters string: String){
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !data.isEmpty{
          item[currentElement] = data
        }
       
    }
    //3.tag 끝을 만났을때 /tag
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if elementName == "item"{
            elements.append(item)
        }
    }

}
   

