import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stu:StuModel = self.stuArray[indexPath.row] 
        let cell:StuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StuTableViewCell") as! StuTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.stuModel = stu
        cell.setStuModelData(stu)
        return cell
    }
    
    
    var stuArray = [StuModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.stuArray = self.loadData()
        
        let tableView:UITableView = UITableView(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.rowHeight = 100
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.separatorColor = UIColor.red
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.backgroundColor = UIColor.gray
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        tableView.register(UINib.init(nibName: "StuTableViewCell", bundle: nil), forCellReuseIdentifier: "StuTableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData() -> [StuModel] {
        var dataArray: Array = [StuModel]()
            for i in 0 ..< 10 {
                let stu = StuModel()
                stu.no = i
                stu.name = "张三_\(i)"
                stu.age = Int(arc4random() % 100)
                stu.photo = UIImage.init(named: "bd_logo1")!
                dataArray.append(stu)
            }
        return dataArray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let array = ["一班","二班","三班"]
        return array[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let array = ["一班尾","二班尾","三班尾"]
        return array[section]
    }
}
