//
//  TableViewController.swift
//  xml parsing
//
//  Created by D7703_11 on 2018. 9. 18..
//  Copyright © 2018년 dit.ac.kr. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,XMLParserDelegate {

    var item:[String:String] = [:]  // item[key] => value
    var elements:[[String:String]] = []
    var currentElement = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        if let path = Bundle.main.url(forResource: "Fruit", withExtension: "xml"){
        //            if let myparser = XMLParser(contentsOf: path){
        //                //XMLParserDekegata
        //                myparser.delegate = self
        //
        //
        //                if myparser.parse(){
        //                    print("parsing succed!")
        //                    print(elements)
        //                }else{
        //                    print("parsing failed!")
        //                }
        //            }else{
        //                print("parser nil")
        //            }
        //
        //        }else{
        //            print("XML file not found!")
        //        }
        let strURL = "http://api.androidhive.info/pizza/?format=xml"
        
        if NSURL(string: strURL) != nil {
            if let parser = XMLParser(contentsOf: URL(string: strURL)!) {
                parser.delegate = self
                
                if parser.parse() {
                    print("parsing success")
                    print(elements)
                    
                } else {
                    print("parsing fail")
                }
                
            }
        }
    }
    //XMLParserDelegate 메소드 호출
    //1.tag(element)를 만났을때
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        
        currentElement = elementName
        
        
        
        
    }
    //2.문자열을 받았을때
    func parser(_ parser: XMLParser, foundCharacters string: String){
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !data.isEmpty && currentElement != "id" && currentElement != "description"{
            item[currentElement] = data
            
        }
        
    }
    //3.tag 끝을 만났을때 (/tag)
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if elementName == "item" {
            elements.append(item)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return elements.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
