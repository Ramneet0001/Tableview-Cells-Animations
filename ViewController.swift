//
//  ViewController.swift
//  TableAnim
//
//  Created by ramneet singh


import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let scRect:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TableView Delegate & DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animCell = tableView.dequeueReusableCell(withIdentifier: "CellAnim") as! UITableViewCell
        
        animCell.textLabel?.text = "ROW : \(indexPath.row)"
        animCell.textLabel?.textAlignment = .center
        
        return animCell
    }
    
    
    
    // MARK: Animation Cell with Spring Damping
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row % 2 == 0 {
             cell.frame = CGRect(x: scRect.width, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
        }else{
             cell.frame = CGRect(x: -scRect.width, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
        }
       
        
        
        
        if indexPath.row % 2 == 0 {
            UIView.animate(withDuration: 3.0, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
                cell.frame =  CGRect(x: 0, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
                
            }, completion: { finished in
                
            })
            
        }else{
            
            UIView.animate(withDuration: 3.0, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
                cell.frame =  CGRect(x: 0, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
                
            }, completion: { finished in
                
            })
            
            
        }
       
    }
    
    
    
}

